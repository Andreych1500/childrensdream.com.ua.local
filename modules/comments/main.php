<?php
// --- ADD COMMENTS ---
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
		$_POST = mres($_POST);

		q(" INSERT INTO `comments` SET
			`name`  = '".$_POST['name']."',
			`text`  = '".$_POST['text']."',
			`email` = '".$_POST['email']."',
			`user_ip` = '".mres($_SERVER['REMOTE_ADDR'])."',
			`active` = 0,
			`date_create`  = NOW()
		");

		echo json_encode(array('status' => 'ok'));
		exit();

	} else {
		echo json_encode(array('warning' => 'ok'));
		exit();
	}
}

// --- ALL COMMENTS ---
$res = q("
	SELECT *
	FROM `comments`
	WHERE `active` = 1
	ORDER BY `id` DESC
");