<?php
if(Core::$CONT != 'modules/admin'){
    // Seo meta tags
    foreach(explode(',', $GM['list_length']) as $k => $v){
        if($lang == $v){
            Core::$META['title'] = hsc(explode('#|#', $GM['meta_title'])[$k]);
            Core::$META['keywords'] = hsc(explode('#|#', $GM['meta_title'])[$k]);
            Core::$META['description'] = hsc(explode('#|#', $GM['meta_title'])[$k]);
        }
    }

    // Dns loading asynchronous
    Core::$META['dns-prefetch'] = array(
        0 => 'https://www.google-analytics.com',
        1 => 'https://mc.yandex.ru',
        2 => 'http://counter.yadro.ru',
        3 => $_SERVER['DOCUMENT_ROOT'],
    );

    // Canonical
    Core::$META['canonical'] = $_SERVER['DOCUMENT_ROOT'].$link_lang.(($GM['module'] == 'static')? '' : $GM['module'].'/');

    // Alternate lang
    $module_url = (($GM['module'] == 'static')? '' : $GM['module'].'/');
    Core::$META['alternate'] = $_SERVER['DOCUMENT_ROOT'].$link_lang.$module_url;
    foreach(Core::$LINK_LANG as $k => $v){
        Core::$META['alternate_'.$v] = $_SERVER['DOCUMENT_ROOT'].(($v == 'ua')? '/' : '/'.$v.'/').$module_url;
    }

    // RDFa open graph
    if($GM['open_graph_page']){
        $contentOG = '';

        $contentOG .= '<meta property="og:title" content="'.Core::$META['title'].'">
            <meta property="og:description"  content="'.Core::$META['description'].'">';

        if(!empty($GM['og_type'])){
            $contentOG .= '<meta property="og:type" content="'.hsc($GM['og_type']).'">';
        }
        if(!empty($GM['og_url'])){
            $contentOG .= '<meta property="og:url" content="'.$_SERVER['DOCUMENT_ROOT'].(($lang == 'ua')? '' : '/'.$lang).$GM['og_url'].'">';
        }
        if(!empty($GM['og_image'])){
            $contentOG .= '<meta property="og:image" content="'.$_SERVER['DOCUMENT_ROOT'].$GM['og_image'].'">';
        }
    }

    // Count goods in cookie
    if(isset($_COOKIE['items'])){
        $cookies = (array)json_decode($_COOKIE['items']);
        $countG = count($cookies);
    } else {
        $countG = 0;
    }
} else {

    // Admin glob param
    $adminParam = hsc(q("
        SELECT *
        FROM `admin_site_interface`
        WHERE `id` = 1
    ")->fetch_assoc());

    // Access
    if(isset($_SESSION['user'])){
        $arAccess = q("
			      SELECT *
			      FROM `admin_users_list`
			      WHERE `id` = ".(int)$_SESSION['user']['id']."
			      AND `active` != 0
			      AND `access` = 5
			      LIMIT 1
	      ");

        if($arAccess->num_rows){
            $_SESSION['user'] = $arAccess->fetch_assoc();
            $globalAccess = true;
        } else {
            menuExit();
        }
    } else {
        $globalAccess = false;

        if($_GET['module'] != 'static'){
            header("Location: /admin/");
            exit();
        }
    }

    if(isset($_COOKIE['authhash'], $_COOKIE['id'])){
        $auth = q("
            SELECT *
			      FROM `admin_users_list`
			      WHERE `hash` = '".mres($_COOKIE['authhash'])."'
            AND `id`   = ".(int)$_COOKIE['id']."
            AND `active` != 0
			      AND `access` = 5
			      LIMIT 1
	      ");

        if($auth->num_rows){
            $_SESSION['user'] = $auth->fetch_assoc();
            $globalAccess = true;
        } else {
            menuExit();
        }
    }

    // Exit
    if(isset($_REQUEST['exit'])){
        menuExit();
    }

    // Menu
    if(isset($_COOKIE['act-menu-lv2'])){
        $arrayActMenu = (array)json_decode($_COOKIE['act-menu-lv2']);
    }

    // New information
    $new_order = q("
	      SELECT `id`
	      FROM `order`
	      WHERE `new_massage` = 1
	      LIMIT 1
    ");

    $new_comments = q("
	      SELECT `id`
	      FROM `comments`
	      WHERE `new_massage` = 1
	      LIMIT 1
    ");

    if($new_order->num_rows > 0){
        $new_el['order'] = 'Новий заказ';
    }

    if($new_comments->num_rows > 0){
        $new_el['comments'] = 'Новий відгук';
    }

    if(isset($_GET['edit_info'])){
        if(in_array($_GET['edit_info'], array('order', 'comments'))){
            q(" 
				        UPDATE `".$_GET['edit_info']."` SET
			          `new_massage` = 0
		            WHERE `new_massage` = 1
		        ");

            header("Location: /admin/".$_GET['edit_info']);
            exit();
        }
    }
}