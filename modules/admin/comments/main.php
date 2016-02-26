<?php
// видалення відгуків по флажках
if(isset($_POST['delete']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" DELETE FROM `comments`
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Відгуки успішно видалені!';
    header("Location: /admin/comments/");
    exit();
}

// active
if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `comments`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Відгуки успішно активовані!';
    header("Location: /admin/comments/");
    exit();
}

// deactivate
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `comments`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Відгуки успішно деактивовані!';
    header("Location: /admin/comments/");
    exit();
}

//new massage deactive
$new_massage = q("
	SELECT `id`
	FROM `comments`
	WHERE `new_massage` = 1
	LIMIT 1
");

if($new_massage->num_rows > 0){
    q("
		UPDATE `comments` SET
		`new_massage` = 0
		WHERE `new_massage` = 1
	");
}

//filter

if(isset($_POST['cat']) && in_array($_POST['cat'],array(0,1,5)) && isset($_POST['filter'])){
    if($_POST['cat'] == 5){
        $_POST['cat'] = '0,1';
    }

    $res = q("
        SELECT *
        FROM `comments`
	    WHERE `active` IN (".$_POST['cat'].")
	    ORDER BY `id` DESC
    ");

    if($_POST['cat'] == '0,1'){
        $_POST['cat'] = 5;
    }
} else{
    $res = q("
        SELECT *
        FROM `comments`
        ORDER BY `id` DESC
    ");
}


if(isset($_SESSION['info'])){
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}