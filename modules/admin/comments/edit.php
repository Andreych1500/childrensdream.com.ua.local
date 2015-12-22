<?php 
// редагування відгука

if(isset($_POST['ok'],$_POST['text'],$_POST['name'],$_POST['email'])){
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['name'])){
		$errors['name'] = 'Ви незаповнили ім\'я!';
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'Ви незаповнили текс!';
	}
	if(empty($_POST['email']) || !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)){
		$errors['email'] = 'Заповніть коректно email!';
	}
	
	if(!count($errors)){
		q(" UPDATE `comments` SET
			`name`      = '".mres($_POST['name'])."',
			`email`     = '".mres($_POST['email'])."',
			`text`      = '".mres($_POST['text'])."'
			 WHERE `id` = ".(int)$_GET['key2']."
		");
		$_SESSION['info'] = 'Зміни  провели успішно!';
		header("Location: /admin/comments/");
		exit();
	}
}

// перевірка чи існує коментар
$comment = q("
	SELECT *
	FROM `comments`
	WHERE `id` = ".(int)$_GET['key2']."
	LIMIT 1
");

if(!$comment->num_rows){
	$_SESSION['info'] = 'Відгуку не знайдено!';
	header("Location: /admin/comments");
	exit();
}
$row = $comment->fetch_assoc();












