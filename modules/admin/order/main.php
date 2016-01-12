<?php
// видалення замовлення по флажках
if(isset($_POST['delete']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" DELETE FROM `order`
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Замовлення успішно видалені!';
    header("Location: /admin/order/");
    exit();
}

// active
if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `order`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Замовлення успішно куплене!';
    header("Location: /admin/order/");
    exit();
}

// deactivate
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `order`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Замовлення успішно відкладене!';
    header("Location: /admin/order/");
    exit();
}

$res = q("
    SELECT *
    FROM `order`
    ORDER BY `id` DESC
");

if(isset($_SESSION['info'])){
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}