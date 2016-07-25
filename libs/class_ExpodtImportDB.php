<?php
class ExpodtImportDB{
    static $tables = array();

    static function table_structureXml($table, $dir){
        //        $xml_file = '';
        //
        //        $select = q("SELECT * FROM `".$table."`;")->fetch_assoc();
        //        $keys = array_keys($select); // Get the Column Names
        //        $min = ord("A"); // ord returns the ASCII value of the first character of string.
        //        $max = $min + count($keys);
        //        $abc = $min;   // Initialize our alphabetical counter
        //
        //        for($j = $min; $j <= $max; ++$j){
        //            $col = $xml_file.chr($abc);   // This is the Column Label.
        //            $last_char = substr($col, -1);
        //
        //            if($last_char > "Z"){ // At the end of the alphabet. Time to Increment the first column letter.
        //                $abc = $min; // Start Over
        //
        //                if(empty($xml_file)){
        //                    $xml_file = "A";
        //                } else {
        //                    $fchrOrd = ord($xml_file);// Get the value of the first character
        //                    $fchrOrd++; // Move to the next one.
        //                    $xml_file = chr($fchrOrd); // Reset the first character.
        //                }
        //
        //                $col = $xml_file.chr($abc); // This is the column identifier
        //            }
        //
        //            //            /*
        //            //               Use the $col here.
        //            //            */
        //
        //            $abc++; // Move on to the next letter
        //        }

    }

    static function table_dataCsv($table, $dir){
        $csv_file = '';
        $delta = 500; // Кількість записів за один раз
        $start = 0;

        $count = current(q("SELECT COUNT(*) FROM `".$table."`;")->fetch_assoc());
        $result = q("SHOW COLUMNS FROM `".$table."`;");

        $i = 0;
        while($row = $result->fetch_assoc()){
            $csv_file .= (($i == 0)? ''.$row["Field"].'' : ';'.$row["Field"].'');
            ++$i;
        }
        $csv_file .= "\r\n";

        while($count > 0){
            $result = q("SELECT * FROM `".$table."` LIMIT ".$start.", ".$delta.";");

            while($row = $result->fetch_assoc()){
                $j = 0;
                foreach($row as $index => $field){
                    $csv_file .= (($j == 0)? ''.mres($field).'' : ';'.mres($field).'');
                    ++$j;
                }
                $csv_file .= "\r\n";
            }
            $count -= $delta;
            $start += $delta;
        }

        file_put_contents($dir.$table.'.csv', $csv_file, FILE_APPEND);
    }

    static function table_structureMySql($table, $dir){
        $content = "DROP TABLE IF EXISTS `".$table."`;\n\n";
        $result = q("SHOW CREATE TABLE `".$table."`;")->fetch_assoc();
        $content .= $result['Create Table'].";\n\n";

        file_put_contents($dir.$table.'.sql', $content);
    }

    static function table_dataMySql($table, $dir){
        $table = mres($table);
        $count = current(q("SELECT COUNT(*) FROM `".$table."`;")->fetch_assoc());
        $delta = 500; // Кількість записів за один раз
        $start = 0;

        if($count > 0){
            $result = q("SHOW COLUMNS FROM `".$table."`;");

            $content = "INSERT INTO `".$table."` (";
            $i = 0;
            while($row = $result->fetch_assoc()){
                $content .= (($i == 0)? '`'.$row['Field'].'`' : ', `'.$row['Field'].'`');
                ++$i;
            }
            $content .= ") VALUES";

            while($count > 0){
                $result = q("SELECT * FROM `".$table."` LIMIT ".$start.", ".$delta.";");

                while($row = $result->fetch_assoc()){
                    $content .= "\n(";
                    $j = 0;
                    foreach($row as $index => $field){
                        $content .= (($j == 0)? $field : ', \''.mres($field).'\'');
                        ++$j;
                    }
                    $content .= '),';
                }
                $count -= $delta;
                $start += $delta;
            }
            $content = trim($content, ',').";\n\n";

            file_put_contents($dir.$table.'.sql', $content, FILE_APPEND);
        }
    }

    static function goToZip($table, $dir, $file){
        $zip = new ZipArchive();
        if($zip->open($dir.'tables.zip', ZipArchive::CREATE) === true){
            $offset_dirs = strlen($_SERVER['DOCUMENT_ROOT']) - strlen($_SERVER['HTTP_HOST']);
            $table = $dir.$table.'.'.$file;
            $local = substr($table, strlen($dir));
            $zip->addFile($table, $local);
            $zip->close();

            if(file_exists($table)){
                unlink($table);
            }
        }
    }

    static function removeLastFile($dir){
        if($objs = glob($dir."*")){
            foreach($objs as $obj){
                is_dir($obj)? removeDirectory($obj) : unlink($obj);
            }
        }
    }

    static function getTable($name_db){
        $arResult = q("SHOW TABLES FROM `".mres($name_db)."`");
        while($table = $arResult->fetch_assoc()){
            self::$tables[] = current($table);
        }

        return self::$tables;
    }
}