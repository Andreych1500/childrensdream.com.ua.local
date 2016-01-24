<?php
// якщо дані не відповідають вимогам адміна не буде доступу до сторінки
if(!isset($_SESSION['user']) || $_SESSION['user']['access'] !=  5){
	if($_GET['module'] != 'static' || $_GET['page'] != 'main'){
		$error_404 = true;
		header("HTTP/1.0 404 Not Found");
	}
}

if(isset($_SESSION['user']) && ($_SESSION['user']['active'] == 1)){
	$res = q("
		SELECT *
		FROM `users`
		WHERE `id` = ".(int)$_SESSION['user']['id']."	
		LIMIT 1
	");
	
	$_SESSION['user'] = $res->fetch_assoc();

	if($_SESSION['user']['access'] == 2){
		include './modules/cab/exit.php';
	}
}
