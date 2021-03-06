<?php
if (Core::$CONT != 'modules/admin') {
    $key_lang = array_search($lang, explode(',', $GM['list_length']));  // Lang key

    // Seo meta tags
    foreach (explode(',', $GM['list_length']) as $k => $v) {
        if ($lang == $v) {
            Core::$META['title'] = hsc(explode('#|#', $GM['meta_title'])[$k]);
            Core::$META['keywords'] = hsc(explode('#|#', $GM['meta_keywords'])[$k]);
            Core::$META['description'] = hsc(explode('#|#', $GM['meta_description'])[$k]);
        }
    }

    // Dns loading asynchronous
    Core::$META['dns-prefetch'] = [
        0 => '//www.google-analytics.com',
        1 => '//mc.yandex.ru',
        2 => '//counter.yadro.ru',
        3 => $arMainParam['url_http_site'],
    ];

    // Canonical
    Core::$META['canonical'] = $arMainParam['url_http_site'].$link_lang.(($GM['module'] == 'static')? '' : $GM['module'].'/');

    // Alternate lang
    $module_url = (($GM['module'] == 'static')? '' : $GM['module'].'/');
    Core::$META['alternate'] = $arMainParam['url_http_site'].'/'.$module_url;
    foreach (Core::$LINK_LANG as $k => $v) {
        Core::$META['alternate_'.$v] = $arMainParam['url_http_site'].(($v == 'ua')? '/' : '/'.$v.'/').$module_url;
    }

    // RDFa open graph
    if ($GM['open_graph_page']) {
        $contentOG = '';
        $contentOG .= '<meta property="og:title" content="'.Core::$META['title'].'">
                       <meta property="og:description"  content="'.Core::$META['description'].'">';

        $contentOG .= ($GM['og_type']? '<meta property="og:type" content="'.hsc($GM['og_type']).'">' : '');
        $contentOG .= ($GM['og_url']? '<meta property="og:url" content="'.$arMainParam['url_http_site'].(($lang == 'ua')? '' : '/'.$lang).$GM['og_url'].'">' : '');
        $contentOG .= ($GM['og_image']? '<meta property="og:image" content="'.$arMainParam['url_http_site'].$GM['og_image'].'">' : '');
    }

    // Count goods in cookie
    if (isset($_COOKIE['items'])) {
        $cookies = (array)json_decode($_COOKIE['items']);
        $countG = count($cookies);
    } else {
        $countG = 0;
        $cookies = [];
    }
} else {

    // Admin glob param
    $adminParam = hsc(q("
        SELECT *
        FROM `admin_site_interface`
        WHERE `id` = 1
    ")->fetch_assoc());

    // Access
    if (isset($_SESSION['user'])) {
        $arAccess = q("
            SELECT *
            FROM `admin_users_list`
            WHERE `id` = ".(int)$_SESSION['user']['id']."
            AND `active` != 0
            AND `access` = 5
            LIMIT 1
	      ");

        if ($arAccess->num_rows) {
            $_SESSION['user'] = $arAccess->fetch_assoc();
            $globalAccess = true;
        } else {
            menuExit();
        }
    } elseif (isset($_COOKIE['authhash'], $_COOKIE['id'])) {
        $auth = q("
            SELECT *
			      FROM `admin_users_list`
			      WHERE `hash` = '".mres($_COOKIE['authhash'])."'
            AND `id`   = ".(int)$_COOKIE['id']."
            AND `active` != 0
			      AND `access` = 5
			      AND `user_ip` = '".mres($_SERVER['REMOTE_ADDR'])."'
			      AND `agent` = '".mres($_SERVER['HTTP_USER_AGENT'])."'
			      LIMIT 1
	      ");

        if ($auth->num_rows) {
            $_SESSION['user'] = $auth->fetch_assoc();
            $globalAccess = true;
        } else {
            menuExit();
        }
    } else {
        $globalAccess = false;

        if ($_GET['module'] != 'static') {
            header("Location: /admin/");
            exit();
        }
    }

    // Exit
    if (isset($_REQUEST['exit'])) {
        menuExit();
    }

    // Menu
    if (isset($_COOKIE['act-menu-lv2'])) {
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

    if ($new_order->num_rows > 0) {
        $new_el['order'] = $messG['Новий заказ'];
    }

    if ($new_comments->num_rows > 0) {
        $new_el['comments'] = $messG['Новий відгук'];
    }

    if (isset($_REQUEST['edit_info'])) {
        if (in_array($_REQUEST['edit_info'], [
            'order',
            'comments'
        ])) {
            q(" 
				        UPDATE `".$_REQUEST['edit_info']."` SET
			          `new_massage` = 0
		            WHERE `new_massage` = 1
		        ");

            header("Location: /admin/".$_REQUEST['edit_info']."/");
            exit();
        }
    }

    // Admin menu
    include './modules/admin/admin_menu.php';
}