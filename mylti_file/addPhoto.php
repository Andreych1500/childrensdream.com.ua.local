<?php

include '../libs/class_UploaderPhotos.php';
include '../config.php';

$mysqli = new mysqli(Core::$DB_LOCAL, Core::$DB_LOGIN, Core::$DB_PASS, Core::$DB_NAME);

$info = array();


if($_POST['size'] > 1100){
    unset($_POST['isset']);
}

if(!isset($_POST['isset'])){
    if (count($info[] = UploaderPhotos::upload($_FILES['photo'], $_POST['size'], $_POST['directory'])) > 0) {
        echo json_encode($info);
    } else {
        echo json_encode(array('error' => 'warning_file'));
    }
} else {
    if (count($info[] = UploaderPhotos::upload($_FILES['photo'], $_POST['size'], $_POST['directory'])) > 0) {
        echo json_encode($info);
    } else {
        echo json_encode(array('error' => 'warning_file'));
    }
}