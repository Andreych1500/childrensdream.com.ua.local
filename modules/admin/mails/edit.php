<?php
// --- EDIT COMMENTS ---

if(isset($_POST['ok'])){
    $_POST = trimAll($_POST);
    $errors = array();

    if(empty($_POST['name_ua'])){
        $errors['name_ua'] = 'errors';
    }

    if(empty($_POST['name_ru'])){
        $errors['name_ru'] = 'errors';
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

        q(" UPDATE `mails` SET
            `from_mail`  = '".$_POST['from_mail']."',
            `to_mail`  = '".$_POST['to_mail']."',
            `type`       = '".$_POST['type']."',
 			`name_ua`    = '".$_POST['name_ua']."',
 			`name_ru`    = '".$_POST['name_ru']."',
 			`ids_goods`  = '".$_POST['ids_goods']."',
		    `user_custom`    = '".mres($_SESSION['user']['FIO'])."'
		");

        header("Location: /admin/mails/");
        exit();
    }
}

// --- END EDIT COMMENTS ---


// --- GET ELEMENT ---

$mails = q("
    SELECT *
    FROM `mails`
    WHERE `id` = '".(int)$_GET['id']."'
    LIMIT 1
");

if($mails->num_rows){
    $row = $mails->fetch_assoc();
} else {
    header("Location: /admin/mails/");
    exit();
}

// --- END GET ELEMENT ---