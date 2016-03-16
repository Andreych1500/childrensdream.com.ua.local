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

// --- END DELETE ELEMENT ---


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

// --- END ACTIVE ELEMENT ---


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

// --- END DEACTIVE ELEMENT ---


// --- GET ALL ELEMENT OR FILTER---

if(isset($_POST['cat']) && in_array($_POST['cat'],array(0,1,5)) && isset($_POST['filter'])){
    if($_POST['cat'] == 5){
        $_POST['cat'] = '0,1';
    }

    $comments = q("
        SELECT *
        FROM `comments`
	    WHERE `active` IN (".$_POST['cat'].")
	    ORDER BY `id` DESC
    ");

    if($_POST['cat'] == '0,1'){
        $_POST['cat'] = 5;
    }
} else {
    $comments = q("
        SELECT *
        FROM `comments`
        ORDER BY `id` DESC
    ");
}

// --- END GET ALL ELEMENT OR FILTER ---