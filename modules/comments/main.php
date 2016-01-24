<?php
Core::$META['title'] = 'comments';
Core::$JS[] =  '<script src="/skins/default/js/comments.js?v=1"></script>';

// відгуки
if(isset($_POST['name'], $_POST['text'], $_POST['email'])){
	$errors = array();
	
	if(empty($_POST['name'])){
		$errors['name'] = 'errors';
	}
	if(empty($_POST['email'])){
		$errors['email'] = 'errors';
	}
	if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
		$errors['email'] = 'errors';
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'errors';
	}

	if(!count($errors)){

		q(" INSERT INTO `comments` SET
			`name`  = '".mres($_POST['name'])."',
			`text`  = '".mres($_POST['text'])."',
			`email` = '".mres($_POST['email'])."',
			`ip_user` = '".mres($_SERVER['REMOTE_ADDR'])."',
			`active` = 0,
			`date`  = NOW()
		");

		echo json_encode(array('status' => 'ok'));
		exit();
	} else {
		echo json_encode(array('warning' => 'ok'));
		exit();
	}
}

$res = q("
	SELECT *
	FROM `comments`
	WHERE `active` = 1
	ORDER BY `id` DESC
");