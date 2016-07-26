<?php
if(isset($_POST['ok'])){
    if(count($_POST['tables']) > 0){
        $dir = $_SERVER['DOCUMENT_ROOT'].'/uploaded/db_tables/';
        ExpodtImportDB::removeLastFile($dir);

        if($_POST['export'] == 'mysql'){
            foreach($_POST['tables'] as $table){
                ExpodtImportDB::table_structureMySql($table, $dir);
                ExpodtImportDB::table_dataMySql($table, $dir);
                ExpodtImportDB::goToZip($table, $dir, 'sql');
            }
        } elseif($_POST['export'] == 'csv'){
            foreach($_POST['tables'] as $table){
               ExpodtImportDB::table_dataCsv($table, $dir);
               ExpodtImportDB::goToZip($table, $dir, 'csv');
            }
        } elseif($_POST['export'] == 'xls'){
            foreach($_POST['tables'] as $table){
                ExpodtImportDB::table_structureXls($table, $dir, 'xls');
                ExpodtImportDB::goToZip($table, $dir, 'xls');
            }
        } else {
            sessionInfo('/admin/setting/export-db/', $messG['Виникла помилка при створені ресурса!']);
        }

        $_SESSION['tables'] = $dir.'tables.zip';
        sessionInfo('/admin/setting/export-db/', $mess['Експорт даних пройшов успішно!'], 1);
    } else {
        sessionInfo('/admin/setting/export-db/', $mess['Жодної таблиці не було вибрано!']);
    }
}

if(isset($_REQUEST['download'])){
    if(!empty($_SESSION['tables']) && file_exists($_SESSION['tables'])){
        $file = $_SESSION['tables'];
        unset($_SESSION['tables']);
        file_force_download($file);
    } else {
        sessionInfo('/admin/setting/export-db/', $mess['Жодної таблиці не було знайдено!']);
    }
}

if(isset($_REQUEST['ajax'])){
    $tables = ExpodtImportDB::getTable(Core::$DB_NAME);
    if(count($tables) > 0){
        echo json_encode($tables);
    } else {
        echo json_encode(array('error' => 'No tables'));
    }
    exit();
}