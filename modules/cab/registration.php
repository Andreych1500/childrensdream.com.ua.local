<?php
Core::$META['title'] = 'registration';
//Core::$CSS[] = '<link type="text/css" rel="stylesheet" href="/css/style.css"">'; для окремих CSS файлів

// перевірка на правельність введення в поле форми при реєстрації
if(isset($_POST['login'],$_POST['email'],$_POST['age'],$_POST['password'])){
	$errors = array();
	
	if(empty($_POST['login'])){
		$errors['login'] = 'Ви не заповнили Логін';
	} elseif(mb_strlen($_POST['login']) <= 2 ) {
		$errors['login'] = 'Логін занадто короткий';
	} elseif(mb_strlen($_POST['login']) > 20){
		$errors['login'] = 'Логін занадто довгий';
	}
	
	if(empty($_POST['password'])){
		$errors['password'] = 'Ви не заповнили Паполь';
	} elseif(mb_strlen($_POST['password']) < 6){
		$errors['password'] = 'Пароль занадто короткий';
	}
	
	if(empty($_POST['email']) || !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)){
		$errors['email'] = 'Ви не заповнили Email';
	}
	
	if(empty($_POST['age'])){
		$errors['age'] = 'Ви не заповнили Вік';
	}
	
	// перевірка на те чи існують вже такі дані
	if(!count($errors)){
		$res = q("
			SELECT `id`
			FROM `users`
			WHERE `login` = '".mres($_POST['login'])."'
			LIMIT 1
		");
		
		if($res->num_rows){
			$errors['login'] = 'Користувач з даним логіном вже існує';
		}
		
		$res = q("
			SELECT `id`
			FROM `users`
			WHERE `email` = '".mres($_POST['email'])."'
			LIMIT 1
		");
		
		if($res->num_rows){
			$errors['email'] = 'Користувач з даним email вже існує';	
		}
	}
	
	// якщо все добре ввели то виконуєм реєстрацію і відправку листа
	if(!count($errors)){
		q("
		    INSERT INTO `users` SET
			`login`     = '".mres($_POST['login'])."',
			`pass`      = '".mres(myHash($_POST['password']))."',
			`email`     = '".mres($_POST['email'])."',
			`age`       = ".(int)$_POST['age'].",
			`hash`      = '".mres(myHash($_POST['login'].$_POST['age']))."',
			`ip`        = '".mres($_SERVER['REMOTE_ADDR'])."',
			`useragent` = '".mres($_SERVER['HTTP_USER_AGENT'])."',
			`date`      = NOW()
		");
		
		$id = DB::_()->insert_id;

		
		Mail::$to = $_POST['email'];
		Mail::$subject = 'Реєстрація на сайті';
		Mail::$text = 'Ви успішно зареєструвались, для активації сайту пройдіть по даній силці: '.Core::$DOMAIN.'cab/activate/'.(int)$id.'?hash='.urlencode(myHash($_POST['login'].$_POST['age'])).'';
		Mail::send();
		
		$_SESSION['regok'] = 'ok';
		header("Location: /cab/registration");
		exit();
	}
}
