<?php
Core::$META['title'] = 'Admin';

if(!isset($_SESSION['user']) || $_SESSION['user']['access'] !=  5){

	if(isset($_POST['login'], $_POST['pass'])){
		$errors = array();
		
		$res = q("
			SELECT *
			FROM `users`
			WHERE `login` = '".mres($_POST['login'])."'
			AND `pass`  = '".myHash($_POST['pass'])."'
			AND `access` = 5
			AND `active` = 1
			LIMIT 1  
		");
		
		if($res->num_rows){
			$_SESSION['user'] = $res->fetch_assoc();
			$status = 'ok';
			
			if(isset($_POST['save']) && !isset($errors['notuser'])){
				q("
					UPDATE `users` SET
					`hash` = '".myHash($_SESSION['user']['id'].$_SESSION['user']['login'].$_SESSION['user']['email'])."'
					WHERE `login`  = '".mres($_POST['login'])."'
					AND `pass`   = '".myHash($_POST['pass'])."'
				");
				setcookie('authhash',myHash($_SESSION['user']['id'].$_SESSION['user']['login'].$_SESSION['user']['email']),time()+9600,'/');
				setcookie('id',$_SESSION['user']['id'],time()+9600,'/');			
			}
		} else {
			$errors['notuser'] = 'Користувача з таким логіном або паролем не існує! Або у вас недостатньо прав...';
		}
	} 	
	
	// перевірка чи користувач у бані
	$userban = array();
	
	$res2 = q("
		SELECT *
		FROM `users`
	");
	
	while($ban = $res2->fetch_assoc()){
		if($ban['access'] == 2){
			$userban[] = $ban['login'];
		}
	}	
}
