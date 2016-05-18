<?php
// --- DELETE ELEMENT ---
if(isset($_POST['delete']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" DELETE FROM `comments`
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/comments/");
    exit();
}

// --- ACTIVE ELEMENT ---
if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `comments`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/comments/");
    exit();
}

// --- DEACTIVE ELEMENT ---
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `comments`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/comments/");
    exit();
}

// --- GET ALL ELEMENT OR FILTER---
$comments = q("
    SELECT *
    FROM `comments`
    ORDER BY `id` DESC
");