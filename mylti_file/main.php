<?php

include '../libs/class_Uploader.php';
include '../config.php';

$mysqli = new mysqli(Core::$DB_LOCAL, Core::$DB_LOGIN, Core::$DB_PASS, Core::$DB_NAME);

$info = array();

// lang directory catalog
if(!in_array($_POST['lang'], array('ua','ru'))){
    echo json_encode(array('error' => 'warning_file'));
    exit();
}
// end lang directory catalog

$catalog = '`catalog_'.$_POST['lang'].'`';

$issetElement = $mysqli->query("
    SELECT `id`
    FROM $catalog
    WHERE `seo_name` = '".mysqli_real_escape_string($mysqli,$_POST['directory'])."'
    LIMIT 1
");


if(!isset($_POST['isset'])){
    if(!mysqli_num_rows($issetElement) > 0 && isset($_POST['update'])) {
        if (count($info[] = Uploader::upload($_FILES['photo'], 200, $_POST['directory'], $_POST['del'], $_POST['lang'])) > 0) {
            echo json_encode($info);
        } else {
            echo json_encode(array('error' => 'warning_file'));
        }
    } else {
        echo json_encode(array('isset' => 'element'));
    }
} else {
    if (count($info[] = Uploader::upload($_FILES['photo'], 200, $_POST['directory'], $_POST['del'], $_POST['lang'])) > 0) {
        echo json_encode($info);
    } else {
        echo json_encode(array('error' => 'warning_file'));
    }
}