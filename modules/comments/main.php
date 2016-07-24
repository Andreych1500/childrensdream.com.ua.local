<?php
if(isset($_POST['name'], $_POST['text'], $_POST['email'], $_POST['ok'])){
    $error = array();
    $_POST = trimAll($_POST);

    $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
    $check['email'] = ((empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))? 'class="error"' : '');
    $check['text'] = (empty($_POST['text'])? 'class="error"' : '');

    if(in_array('class="error"', $check)){
        $error['stop'] = 1;
    }

    if(!count($error)){
        $_POST = mres($_POST);

        q(" INSERT INTO `comments` SET
            `name`    = '".$_POST['name']."',
            `text`    = '".$_POST['text']."',
            `email`   = '".$_POST['email']."',
            `user_ip` = '".mres($_SERVER['REMOTE_ADDR'])."',
            `active`  = 0,
            `data_create`  = NOW()
        ");

        echo json_encode(array('status' => 'ok'));
        exit();
    } else {
        echo json_encode(array('error' => 'ok'));
        exit();
    }
} else {
    if(isset($_REQUEST['ajax'])){
        echo json_encode(array('error' => 'ok'));
        exit();
    }
}

// All comments
$comments = q("
	SELECT *
	FROM `comments`
	WHERE `active` = 1
	ORDER BY `id` DESC
");