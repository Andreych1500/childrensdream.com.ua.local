<?php
Core::$META['title'] = 'comments';
Core::$JS[] =  '<script type="text/javascript" src="/skins/default/js/comments.js"></script>';


$res = q("
	SELECT *
	FROM `comments`
	WHERE `active` = 1
	ORDER BY `id` DESC
");


// відгуки
if(isset($_POST['name'], $_POST['text'], $_POST['email'])){
	$errors = array();
	
	if(empty($_POST['name'])){
		$errors['name'] = $mess['ERROR_1'];
	}
	if(empty($_POST['email'])){
		$errors['email'] = $mess['ERROR_2'];
	}
	if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
		$errors['email'] = $mess['ERROR_2'];
	}
	if(empty($_POST['text'])){
		$errors['text'] = $mess['ERROR_3'];
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