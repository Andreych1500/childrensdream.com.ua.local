<?php

if(isset($_GET['page']) && $_GET['page'] == 'exit'){
	q("
		UPDATE `users` SET
		`lastonline` = NOW()
		WHERE `id` = ".(int)$_SESSION['user']['id']."
	");	
}

session_unset();
session_destroy();
setcookie('authhash','',time()-9600,'/');
setcookie('id','',time()-9600,'/');	

header("Location: /");
exit();