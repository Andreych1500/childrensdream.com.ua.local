<?php

include '../config.php';

$mysqli = new mysqli(Core::$DB_LOCAL, Core::$DB_LOGIN, Core::$DB_PASS, Core::$DB_NAME);


if(isset($_POST['del_file']) && count($_POST['del_file']) > 0){
    foreach($_POST['del_file'] as $key => $value){
        if(file_exists('..'.$value) && !empty($value)){
            unlink('..'.$value);
        }
    }
} else {
    if(isset($_POST['del_file'])){
        echo json_encode(array('error' => 'warning'));
    }
}


if(isset($_POST['del_el']) && !empty($_POST['del_el'])){
    mysqli_query($mysqli, "
        DELETE FROM ".$_POST['table']."
		WHERE `id` = '".(int)$_POST['del_el']."'
		LIMIT 1
	");

    echo json_encode(array('delete' => 'ok'));

} else {
    echo json_encode(array('error' => 'warning'));
}