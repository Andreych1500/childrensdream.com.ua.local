<?php
// active
if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `call_me`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Відгуки успішно прочитано!';
    header("Location: /admin/static/call");
    exit();
}

// deactivate
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `call_me`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Повідомлення успішно деактивовані!';
    header("Location: /admin/static/call");
    exit();
}

$res = q("
    SELECT *
    FROM `call_me`
    ORDER BY `id` DESC
");

if(isset($_SESSION['info'])){
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}