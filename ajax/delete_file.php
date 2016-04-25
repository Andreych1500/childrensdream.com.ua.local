<?php

if(isset($_POST['del_file']) && !empty($_POST['del_file'])){

    foreach($_POST['del_file'] as $key => $value){
        if(!empty($value)){
            $info = explode('|', $value);

            if(file_exists('..'.$info[0])){
                unlink('..'.$info[0]);
            }
        }
    }

    echo json_encode(array('file' => 'delete'));
}