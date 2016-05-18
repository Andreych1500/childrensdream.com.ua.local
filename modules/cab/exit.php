<?php
// --- EXIT ADMIN ---
if(isset($_GET['page']) && $_GET['page'] == 'exit'){
	q("
		UPDATE `users` SET
		`lastonline` = NOW()
		WHERE `id` = ".(int)$_SESSION['user']['id']."
	");	
}

session_unset();
session_destroy();
setcookie('authhash','',time()-636000,'/');
setcookie('id','',time()-636000,'/');

header("Location: /");
exit();