<?php
// видалення товарів
if(isset($_POST['delete']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" DELETE FROM `catalog`
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Товар успішно видалений!';
    header("Location: /admin/catalog/");
    exit();
}

// active
if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `catalog`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Товар успішно активований!';
    header("Location: /admin/catalog/");
    exit();
}

// deactivate
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `catalog`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Товар успішно деактивований!';
    header("Location: /admin/catalog/");
    exit();
}

$res = q("
    SELECT *
    FROM `catalog`
    ORDER BY `id` DESC
");

if(isset($_SESSION['info'])){
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}