<?php 
if(isset($_SESSION['user']) && ($_SESSION['user']['access'] == 1 || $_SESSION['user']['access'] == 5) ){
	$res = q("
		SELECT * FROM `users`
		WHERE `id` = ".(int)$_SESSION['user']['id']."
		LIMIT 1
	");
	
	$row = $res->fetch_assoc();
} else {
	header("Location: /");
	exit();		
}

