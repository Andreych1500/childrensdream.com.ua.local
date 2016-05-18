<?php
// --- DELETE ELEMENT ---
if(isset($_POST['delete']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" DELETE FROM `order`
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/order/");
    exit();
}

// --- ACTIVE ELEMENT ---
if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `order`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/order/");
    exit();
}

// --- DEACTIVE ELEMENT ---
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `order`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/order/");
    exit();
}

// --- GET ALL ELEMENT ---
$order = q("
    SELECT *
    FROM `order`
    ORDER BY `id` DESC
");