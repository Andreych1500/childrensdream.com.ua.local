<?php

include '../libs/class_Uploader.php';
include '../config.php';

$mysqli = new mysqli(Core::$DB_LOCAL, Core::$DB_LOGIN, Core::$DB_PASS, Core::$DB_NAME);

$info = array();

$issetElement = $mysqli->query("
    SELECT `id`
    FROM `catalog`
    WHERE `seo_name` = '".$_POST['directory']."'
    LIMIT 1
");


if(!mysqli_num_rows($issetElement) > 0) {
    if (count($info[] = Uploader::upload($_FILES['photo'], 200, $_POST['directory'], $_POST['del'])) > 0) {
        echo json_encode($info);
    } else {
        echo json_encode(array('error' => 'warning_file'));
    }
} else {
    echo json_encode(array('isset' => 'element'));
}
