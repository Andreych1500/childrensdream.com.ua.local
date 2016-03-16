<?php
// --- EDIT COMMENTS ---

if(isset($_POST['ok'])){
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['name'])){
		$errors['name'] = 'errors';
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'errors';
	}
	if(empty($_POST['email']) || !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)){
		$errors['email'] = 'errors';
	}
	
	if(!count($errors)){
		q(" UPDATE `comments` SET
			`name`      = '".mres($_POST['name'])."',
			`email`     = '".mres($_POST['email'])."',
			`text`      = '".mres($_POST['text'])."'
			 WHERE `id` = ".(int)$_GET['id']."
		");

		header("Location: /admin/comments/");
		exit();
	}
}

// --- END EDIT COMMENTS ---


// --- GET ELEMENT ---

$comments = q("
    SELECT *
    FROM `comments`
    WHERE `id` = '".(int)$_GET['id']."'
    LIMIT 1
");

if($comments->num_rows){
	$row = $comments->fetch_assoc();
} else {
	header("Location: /admin/comments/");
	exit();
}

// --- END GET ELEMENT ---