<?php

if(isset($_POST['del_file'])){
    $info = explode('|', $_POST['del_file']);
    if(file_exists($info[0])){
        if(!is_dir($info[0])) {
            unlink($info[0]);
        }
    }
    echo json_encode(array('file' => 'delete'));
}