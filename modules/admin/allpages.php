<?php
// --- REDIRECT NO  ACCESS ---

if(!isset($_SESSION['user']) || $_SESSION['user']['access'] !=  5){
	if($_GET['module'] != 'static' || $_GET['page'] != 'main'){
		header("Location: /admin/");
		exit();
	}
}

if(isset($_COOKIE['authhash'],$_COOKIE['id'])){
	$res = q("
			SELECT *
			FROM `users`
			WHERE `hash` = '".mres($_COOKIE['authhash'])."'
			  AND `id`   = ".(int)$_COOKIE['id']."
			LIMIT 1
	");

	$auth = $res->fetch_assoc();

	if($auth['access'] == 5 && $res->num_rows){
		$_SESSION['user'] = $auth;
	} else {
		include './modules/cab/exit.php';
	}
}

// ---  END REDIRECT NO  ACCESS ---


// --- NEW INFORMATION ---

$new_order = q("
	SELECT `id`
	FROM `order`
	WHERE `new_massage` = 1
	LIMIT 1
");

$new_comments = q("
	SELECT `id`
	FROM `comments`
	WHERE `new_massage` = 1
	LIMIT 1
");

if($new_order->num_rows > 0){
	$new_el['order'] = 'Новий заказ';
}

if($new_comments->num_rows > 0){
	$new_el['comments'] = 'Новий відгук';
}

if(isset($_GET['editIfno'])){

	if(in_array($_GET['editIfno'], array('order','comments'))){
		q(" UPDATE `".$_GET['editIfno']."` SET
			`new_massage` = 0
		    WHERE `new_massage` = 1
		");

		header("Location: /admin/".$_GET['editIfno']);
		exit();
	}

}

// --- END NEW INFORMATION ---