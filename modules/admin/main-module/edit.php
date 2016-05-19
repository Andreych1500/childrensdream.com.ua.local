<?php
Core::$JS[] = '<script src="/skins/admin/js/addPhoto.js?v='.$vF.'"></script>';

// --- EDIT MODULE ---
if(isset($_POST['ok'])){
    $_POST = trimAll($_POST);
    $errors = array();

    if(isset($_POST['open_graph_page'])){
        $_POST['open_graph_page'] = 1;
    }

    // --- SEO ---
    if(empty($_POST['meta_title_ua'])){ $_POST['meta_title_ua'] = ''; }
    if(empty($_POST['meta_keywords_ua'])){ $_POST['meta_keywords_ua'] = ''; }
    if(empty($_POST['meta_description_ua'])){ $_POST['meta_description_ua'] = ''; }
    if(empty($_POST['meta_title_ru'])){ $_POST['meta_title_ru'] = ''; }
    if(empty($_POST['meta_keywords_ru'])){ $_POST['meta_keywords_ru'] = ''; }
    if(empty($_POST['meta_description_ru'])){ $_POST['meta_description_ru'] = ''; }

    // --- OPEN GRAPG ---
    if(empty($_POST['og_url'])){ $_POST['og_url'] = ''; }
    if(empty($_POST['og_type'])){ $_POST['og_type'] = ''; }
    $og_image = ((isset($_POST['og_image']))? explode('|',$_POST['og_image']) : '');

    if(!count($errors)){
        $_POST = mres($_POST);

        q(" UPDATE `pages` SET
		    `meta_title_ua`        = '".$_POST['meta_title_ua']."',
		    `meta_keywords_ua`     = '".$_POST['meta_keywords_ua']."',
		    `meta_description_ua`  = '".$_POST['meta_description_ua']."',
		    `meta_title_ru`        = '".$_POST['meta_title_ru']."',
		    `meta_keywords_ru`     = '".$_POST['meta_keywords_ru']."',
		    `meta_description_ru`  = '".$_POST['meta_description_ru']."',
		    `user_custom`          = '".mres($_SESSION['user']['FIO'])."',
		    `open_graph_page`      = '".(int)$_POST['open_graph_page']."',
		    `og_image`             = '".mres($og_image[0])."',
		    `og_type`              = '".$_POST['og_type']."',
		    `og_url`               = '".$_POST['og_url']."'
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