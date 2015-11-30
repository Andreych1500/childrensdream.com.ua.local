<?php
Core::$META['title'] = 'admin';

// редагування данних користувача
if(isset($_POST['login'],$_POST['ok'],$_POST['pass'],$_POST['email'],$_POST['access'])){
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['login'])){
		$errors['login'] = 'Заповніть коректно логін!';
	}
	if(empty($_POST['email']) || !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)){
		$errors['email'] = 'Заповніть коректно email!';
	}
	if(empty($_POST['access'])){
		$errors['access'] = 'Виберіть доступ користувача!';
	}
	
	$pass = (!empty($_POST['pass']) ? '`pass` = \''.mres(myHash($_POST['pass'])).'\','  : '');
	
	if(!count($errors)){
		$res = q("
			SELECT `login`
			FROM `users`
			WHERE `login` = '".mres($_POST['login'])."'
			LIMIT 1
		");
		$res2 = q("
			SELECT *
			FROM `users`
			WHERE `id` = ".(int)$_GET['key2']."
			LIMIT 1
		");
		$res3 = q("
			SELECT `email`
			FROM `users`
			WHERE `email` = '".mres($_POST['email'])."'
			LIMIT 1
		");
		
		$row = $res2->fetch_assoc();
		
		if($res->num_rows  && $_POST['login'] != $row['login']){
			$errors['login'] = 'Користувач з даним логіном вже існує';
		} 
		if($res3->num_rows  && $_POST['email'] != $row['email']){
			$errors['email'] = 'Користувач з даним email вже існує';
		}

		
	}
	if(!count($errors)){
		q(" UPDATE `users` SET 
			`login`        = '".mres($_POST['login'])."',
			`access`       = '".mres($_POST['access'])."',
			".$pass."
			`email`        = '".mres($_POST['email'])."'
			 WHERE `id`    = ".(int)$_GET['key2']."
		");
		$_SESSION['info'] = '<span class="color11">Зміни  провели успішно!</span>';
		header("Location: /admin/user/main/".(int)$_GET['key2']);
		exit();
	}
}

// видалення користувача
if(isset($_POST['delete'],$_GET['key2'])){
	q("
		DELETE FROM `users` 
		WHERE `id` = ".(int)$_GET['key2']."
	");
	
	$_SESSION['info'] = '<span class="color11">Видалено успішно!</span>';
	header("Location: /admin/user/main");
	exit();
}

// перевірка на співпадіння логіна
if(isset($_POST['login2'],$_POST['ok2'])){
	$_POST = trimAll($_POST);
	$errors2 = array();
	
	if(empty($_POST['login2'])){
		$errors2['login2'] = '<span class="color12">Заповніть поле логін!</span>';
	}
	
	if(!count($errors2)){
		$res3 = q("
			SELECT *
			FROM `users`
			WHERE `login` LIKE '%".mres($_POST['login2'])."%'
		");
		
		if(!$res3->num_rows){
			$_SESSION['info2'] = '<span class="color12">Користувача з таким логіном неіснує</span>';
			header("Location: /admin/user/main");
			exit();
		}
	}
}

// список користувачів
$resul = '';

$users = q("
	SELECT *
	FROM `users`
	ORDER BY `access` DESC
");

if(isset($_GET['key2'])){ 
	$user2 = q("
		SELECT *
		FROM `users`
		WHERE `id` = ".(int)$_GET['key2']."
	"); 
}


if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}

if(isset($_SESSION['info2'])){
	$info2 = $_SESSION['info2'];
	unset($_SESSION['info2']);
}
