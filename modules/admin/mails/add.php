<?php
Core::$JS[] = '<script src="/skins/admin/js/addPhoto.js?v=1"></script>';

// --- ADD NEW ELEMENT ---

if(isset($_POST['ok'],$_POST['name'])){
    $errors = array();

    if(empty($_POST['name'])){
        $errors['name'] = 'errors';
    }

    if(empty($_POST['code'])){
        $errors['code'] = 'errors';
    } else {
        $isset = q("
			SELECT `id`
			FROM `mails`
			WHERE `code` = '".mres($_POST['code'])."'
			LIMIT 1
		");

        if($isset->num_rows > 0){
            $errors['code'] = 'errors';
        }
    }

    if(empty($_POST['ids_goods'])){
        $errors['ids_goods'] = 'errors';
    }

    if(empty($_POST['from_mail']) || !filter_var($_POST['from_mail'],FILTER_VALIDATE_EMAIL)){
        $errors['from_mail'] = 'errors';
    }

    if(empty($_POST['to_mail']) || !filter_var($_POST['to_mail'],FILTER_VALIDATE_EMAIL)){
        $errors['to_mail'] = 'errors';
    }

    if(!count($errors)){
        $_POST = mres($_POST);

        q(" INSERT INTO `mails` SET
            `from_mail`  = '".$_POST['from_mail']."',
            `to_mail`    = '".$_POST['to_mail']."',
            `code`       = '".$_POST['code']."',
            `type`       = '".$_POST['type']."',
 			`name`       = '".$_POST['name']."',
 			`ids_goods`  = '".$_POST['ids_goods']."',
		    `user_custom`    = '".mres($_SESSION['user']['FIO'])."',
			`date_create`    = NOW()
		");

        header("Location: /admin/mails/");
        exit();
    }
}

// --- END ADD ELEMENT ---