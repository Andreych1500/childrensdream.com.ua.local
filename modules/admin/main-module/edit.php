<?php

// --- EDIT MODULE ---
if(isset($_POST['ok'])){
    $_POST = trimAll($_POST);
    $errors = array();

    // SEO
    if(empty($_POST['meta_title_ua'])){ $_POST['meta_title_ua'] = ''; }
    if(empty($_POST['meta_keywords_ua'])){ $_POST['meta_keywords_ua'] = ''; }
    if(empty($_POST['meta_description_ua'])){ $_POST['meta_description_ua'] = ''; }
    if(empty($_POST['meta_title_ru'])){ $_POST['meta_title_ru'] = ''; }
    if(empty($_POST['meta_keywords_ru'])){ $_POST['meta_keywords_ru'] = ''; }
    if(empty($_POST['meta_description_ru'])){ $_POST['meta_description_ru'] = ''; }

    if(!count($errors)){
        q(" UPDATE `pages` SET
		    `meta_title_ua`       = '".mres($_POST['meta_title_ua'])."',
		    `meta_keywords_ua`    = '".mres($_POST['meta_keywords_ua'])."',
		    `meta_description_ua` = '".mres($_POST['meta_description_ua'])."',
		    `meta_title_ru`       = '".mres($_POST['meta_title_ru'])."',
		    `meta_keywords_ru`    = '".mres($_POST['meta_keywords_ru'])."',
		    `meta_description_ru` = '".mres($_POST['meta_description_ru'])."',
		    `user_custom`         = '".mres($_SESSION['user']['FIO'])."'
			 WHERE `id`    = ".(int)$_GET['id']."
		");

        header("Location: /admin/main-module");
        exit();
    }

}


// --- GET MODULE ---

$module = q("
    SELECT *
    FROM `pages`
    WHERE `id` = '".(int)$_GET['id']."' AND `dinamic-page` = 1
    LIMIT 1
");

if($module->num_rows){
    $row = $module->fetch_assoc();
} else {
    header("Location: /admin/main-module/");
    exit();
}

// --- END GET MODULE ---