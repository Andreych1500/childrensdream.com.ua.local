<?php 
if(isset($_SESSION['user']) && ($_SESSION['user']['access'] == 1 || $_SESSION['user']['access'] == 5) ){
	$res = q("
		SELECT * FROM `users`
		WHERE `id` = ".(int)$_SESSION['user']['id']."
		LIMIT 1
	");
	
	$row = $res->fetch_assoc();
	
	// редагування email у галереї користувача 
	if(isset($_POST['submit'],$_POST['email']) && !empty($_POST['email'])){
		$_POST = trimAll($_POST);
		$errors = array();
		
		if(empty($_POST['email']) || !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)){
			$errors['email'] = 'Заповніть коректно email!';
		}
		
		if(!count($errors)){
			$res = q("
				SELECT `email`
				FROM `users`
				WHERE `email` = '".mres($_POST['email'])."'
				LIMIT 1
			"); 
			if($res->num_rows  && $_POST['email'] != $row['email']){
				$errors['email'] = 'Користувач з даним email вже існує';
			}
		}
		
		if(!count($errors)){
			q("
				UPDATE `users` SET
				`email` = '".mres($_POST['email'])."'
				WHERE `id`    = ".(int)$_SESSION['user']['id']."
			");
			$_SESSION['info'] = '<span class="color11">Зміни  провели успішно!</span>';
			header("Location: /account/edit");
			exit();
		}	
	}
	
	
	// редагування паролю користувача у його галереї
	if(isset($_POST['submit'],$_POST['password1'],$_POST['password2'],$_POST['password3']) && !empty($_POST['password1'])){
		$_POST = trimAll($_POST);
		$errors2 = array();
	
		$pass = '`pass` = \''.mres(myHash($_POST['password2'])).'\'';
		
		if(empty($_POST['password1'])){
			$errors2['password1'] = 'Ви не заповнили Паполь';
		} elseif(mb_strlen($_POST['password1']) < 6){
			$errors2['password1'] = 'Пароль занадто короткий';
		}
		
		if(myHash($_POST['password1']) == $row['pass']){
			if(empty($_POST['password2'])){
				$errors2['password2'] = 'Ви не заповнили новий паполь';
			} elseif(mb_strlen($_POST['password2']) < 6){
				$errors2['password2'] = 'Новий пароль занадто короткий';
			} else {
				if(mb_strlen($_POST['password3']) < 6){
					$errors2['password3'] = 'Будь-ласка не менше 6 символів';
				} elseif($_POST['password3'] != $_POST['password2']){
					$errors2['password3'] = 'Не співпадає  пароль';
				} else {
					q("
						UPDATE `users` SET
						".$pass."
						WHERE `id` = ".(int)$_SESSION['user']['id']."
					");
					
					$_SESSION['info'] = '<span class="color11">Зміни  провели успішно!</span>';
					header("Location: /account/edit");
					exit();
				}
			}
		} else {
			$errors2['password1'] = 'Cтарий пароль неправельний';
		}
	}
	
	
	// зміна аватару
	if(isset($_POST['submit']) && !empty($_FILES['file']['tmp_name'])){
		$_POST = trimAll($_POST);
		$errors3 = array();
		
		if(!count($errors3)){
			if($_FILES['file']['error'] == 0) {
				$widthava = 100;
				if(Uploader::upload($_FILES['file'],$widthava) != 1){	
					$errors3['file'] = Uploader::$error;
				}
			} else {
				$errors3['file'] = 'Винекнула ошибка при відправці....';
			}
		}
		
		if(!count($errors3)){
			q("
				UPDATE `users` SET
				`ava`  = '".mres(Uploader::$filename)."'
				WHERE `id` = '".(int)$_SESSION['user']['id']."'
			");
			$_SESSION['info'] = '<span class="color11">Зміни  провели успішно!</span>';
			header("Location: /account/edit");
			exit();
		}
	}
	
	
	if(isset($_SESSION['info'])){
		$info = $_SESSION['info'];
		unset($_SESSION['info']);
	}

} else {
	header("Location: /");
	exit();	
}