<?php
// --- DELETE ELEMENT ---
if(isset($_POST['delete']) && isset($_POST['ids'])){

    $ids = implode(',',$_POST['ids']);

    q(" DELETE FROM `call_me`
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/call-me/");
    exit();
}

// --- ACTIVE ELEMENT ---
if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }

    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `call_me`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/call-me/");
    exit();
}

// --- DEACTIVE ELEMENT ---
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `call_me`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/call-me/");
    exit();
}

// --- GET ALL ELEMENT ---
$call_me = q("
    SELECT *
    FROM `call_me`
    ORDER BY `id` DESC
");