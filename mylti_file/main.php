<?php

include '../libs/class_Uploader.php';

$info = array();

if(count($info[] = Uploader::upload($_FILES['photo'], 200, $_POST['directory'], $_POST['del'])) > 0){
    echo json_encode($info);
} else {
    echo json_encode(array('error' => 'warning_file'));
}
