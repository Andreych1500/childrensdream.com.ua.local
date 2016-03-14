<?php
Core::$JS[] = '<script src="/skins/admin/js/addPhoto.js?v=1"></script>';

// --- ADD NEW ELEMENT ---

if(isset($_POST['ok'],$_POST['name'], $_POST['sort'])){
    $_POST = trimAll($_POST);
    $errors = array();

    if(empty($_POST['name'])){
        $errors['name'] = 'errors';
    }
    if(isset($_POST['active'])){
        $_POST['active'] = 1;
    }

    // --- NO MANDATORY FIELDS ---
    if(empty($_POST['sort'])){ $_POST['sort'] = '100'; }

    // SEO
    if(empty($_POST['img_seo_title_ua'])){ $_POST['img_seo_title_ua'] = '';	}
    if(empty($_POST['img_seo_title_ru'])){ $_POST['img_seo_title_ru'] = '';	}
    if(empty($_POST['img_seo_alt_ua'])){ $_POST['img_seo_alt_ua'] = '';	}
    if(empty($_POST['img_seo_alt_ru'])){ $_POST['img_seo_alt_ru'] = '';	}

    // --- FUNCTION IMAGE ---

    $main_banner_ua = ((isset($_POST['main_banner_ua']))? explode('|',$_POST['main_banner_ua']) : '');
    $main_banner_ru = ((isset($_POST['main_banner_ru']))? explode('|',$_POST['main_banner_ru']) : '');

    // --- END FUNCTION IMAGE ---

    if(!count($errors)){
        q(" INSERT INTO `main_banner` SET
 			`sort`           = '".(int)$_POST['sort']."',
 			`active`         = '".(int)$_POST['active']."',
 			`name`           = '".mres($_POST['name'])."',
		    `img_ua`         = '".mres($main_banner_ua[0])."',
		    `img_ru`         = '".mres($main_banner_ru[0])."',
		    `user_custom`    = '".mres($_SESSION['user']['FIO'])."',
			`date_create`    = NOW(),

			`img_seo_title_ua`    = '".mres($_POST['img_seo_title_ua'])."',
 			`imag_seo_title_ru`    = '".mres($_POST['img_seo_title_ru'])."',
 			`imag_seo_alt_ua`      = '".mres($_POST['img_seo_alt_ua'])."',
 			`imag_seo_alt_ru`      = '".mres($_POST['img_seo_alt_ru'])."'
		");

        header("Location: /admin/main-banner/");
        exit();
    }
}

// --- END ADD ELEMENT ---