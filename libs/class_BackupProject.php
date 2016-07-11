<?php

class BackupProject {

    static $allFiles = array(); // Глобальний массив з всіма файлами
    static $fileNotZip = array(); // Файли, які не попадають в архів
    static $dbNames = array(); // Массив баз даних які потраплять у архів
    static $dbFiles = array(); // Массив файлів з дампом баз даних
    static $return = array(
        'file_name'     => '',
        'volume_memory' => 0
    ); // Повернення даних

    static function startBackup($dbNames, $offsetDirs, $timeDirDelete, $namePrefix) {
        set_time_limit(0); // Забираємо обмеження в часі

        self::$fileNotZip = explode(',', $offsetDirs);

        $dbNames = explode(',', $dbNames); // Массив получаємих баз даних

        foreach($dbNames as $v) {
            self::$dbNames[] = $v;
        }

        /* Директорія з всіма файлами сайту. ВАЖЛИВО: Шляхи повинні бути фізичними, від корня.*/
        $source_dirs = $_SERVER['DOCUMENT_ROOT'];

        /* Директорія, куди будуть поміщатися архіви */
        $dump_dir = $_SERVER['DOCUMENT_ROOT']."/uploaded/backup";

        /* Службова змінна, що служить для усунення зайвих папок до корня */
        $offset_dirs = strlen($_SERVER['DOCUMENT_ROOT']) - strlen($_SERVER['HTTP_HOST']);

        /* Час в секундах через який будуть видалятися архіви*/
        $time_delete = $timeDirDelete * 86400;

        /* Iм'я архіву */
        $file_zip = $namePrefix."_".date("Y_m_d").".zip";
        self::$return['file_name'] = $file_zip;

        BackupProject::deleteOldArchive($dump_dir, $time_delete); // Видаленя попередніх архівів

        if(file_exists($dump_dir."/".$file_zip)) {
            BackupProject::errorBackup('Архів з таким ім\'ям вже існує!', $dump_dir);
        }

        foreach(self::$dbNames as $dataBase) {
            if(!q("SHOW DATABASES LIKE '".mres($dataBase)."'")->num_rows) {
                BackupProject::errorBackup('База даних з таким ім\'ям "'.$dataBase.'" відсутня!', $dump_dir);
            }
        }

        foreach(self::$dbNames as $k => $dataBase) {
            self::$dbFiles[] = $dump_dir."/".$dataBase.".sql";
            $fp = fopen(self::$dbFiles[$k], "a"); // Відкриваємо файл або створюємо

            $result_set = q("SHOW TABLES"); // Запитуємо всі таблиці з бази

            while(($table = $result_set->fetch_assoc()) != false) {
                /* Перебір всіх таблиць в базі даних */
                $table = array_values($table);

                if($fp) {
                    $result_set_table = q("SHOW CREATE TABLE `".$table[0]."`")->fetch_assoc();
                    $result_set_table = array_values($result_set_table);

                    fwrite($fp, "\n".$result_set_table[1].";\n"); // Результат даних таблиці

                    $result_set_rows = q("SELECT * FROM `".mres($table[0])."`"); // Список всіх записів таблиці

                    while(($row = $result_set_rows->fetch_assoc()) != false) {
                        $query = "";
                        /* Путём перебора всех записей добавляем запросы на их создание в файл */
                        foreach($row as $field) {

                            if(is_null($field)) {
                                $field = "NULL";
                            } else {
                                $field = "'".mres($field)."'";
                            }

                            if($query == "") {
                                $query = $field;
                            } else {
                                $query .= ", ".$field;
                            }

                        }

                        $query = "INSERT INTO `".$table[0]."` VALUES (".$query.");";
                        fwrite($fp, $query);
                    }
                } else {
                    BackupProject::errorBackup('Виникла помилка при створеню ресурса!', $dump_dir);
                }
            }

            /* Закриваєм файл та з'єднання */
            fclose($fp);
            DB::close();
        }

        $zip = new ZipArchive();

        if($zip->open($dump_dir."/".$file_zip, ZipArchive::CREATE) === true) {

            /* Рекурсивний перебір всіх директорій */
            if(is_dir($source_dirs)) {
                BackupProject::recoursiveDir($source_dirs);
            } else {
                self::$allFiles[] = $source_dirs;
            }

            foreach(self::$allFiles as $val) {
                /* Добавляем в ZIP-архив все полученные файлы */
                $unsetFile = substr($val, strlen($_SERVER['DOCUMENT_ROOT']));
                $local = substr($val, $offset_dirs);

                if($unsetFile == $offsetDirs) {
                    continue;
                }

                self::$return['volume_memory'] += filesize($val);

                $zip->addFile($val, $local);
            }

            /* Добавляем в ZIP-архив все дампы баз данных */
            foreach(self::$dbFiles as $k => $value) {
                $local = substr($value, strlen($dump_dir) + 1);
                $zip->addFile($value, $local);
            }

            $zip->close();
        }

        foreach(self::$dbFiles as $k => $value) { // Очищуємо маcсив
            unlink($value);
        }
        
        return self::$return;
    }

    static function recoursiveDir($dir) {
        if($files = glob($dir."/{,.}*", GLOB_BRACE)) {
            foreach($files as $file) {
                $b_name = basename($file);

                if(in_array($b_name, self::$fileNotZip) || ($b_name == ".") || ($b_name == "..")) {
                    continue;
                }

                if(is_dir($file)) {
                    BackupProject::recoursiveDir($file);
                } else {
                    self::$allFiles[] = $file;
                }
            }
        }
    }

    static function deleteOldArchive($dump_dir, $delay_delete) {
        $ts = time();
        $files = glob($dump_dir."/*.zip");
        foreach($files as $file) {
            if($ts - filemtime($file) > $delay_delete) {
                unlink($file);
            }
        }
    }

    static function errorBackup($text, $dump_dir) {

        foreach(glob($dump_dir.'/*.sql') as $file) {
            unlink($file);
        }

        sessionInfo('/admin/setting/backup/', $text);
    }
}