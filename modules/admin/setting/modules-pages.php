<?php
if(isset($_REQUEST['add'])){
    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['module'] = (empty($_POST['module'])? 'class="error"' : '');

        $primary = q("
            SELECT `module`
            FROM  `admin_module_pages`
            WHERE `module` = '".mres($_POST['module'])."'
            LIMIT 1
        ");

        if($primary->num_rows > 0){
            $check['module'] = 'class="error"';
        }

        // list
        $list_length = (isset($_POST['list_length'])? implode(',', $_POST['list_length']) : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];
            $_POST['detail_page'] = !isset($_POST['detail_page'])? 0 : (int)$_POST['detail_page'];
            $_POST['dinamic_page'] = !isset($_POST['dinamic_page'])? 0 : (int)$_POST['dinamic_page'];

            q(" INSERT INTO `admin_module_pages` SET
                `active`       = ".$_POST['active'].",
                `module`       = '".$_POST['module']."',
                `detail_page`  = '".$_POST['detail_page']."',
                `dinamic_page` = '".$_POST['dinamic_page']."',
                `list_length`  = '".$list_length."',
                `user_custom`  = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
            ");

            sessionInfo('/admin/setting/modules-pages/', 'Модуль створено успішно!', 1);
        }
    }
} elseif(isset($_REQUEST['edit'])) {
    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['module'] = (empty($_POST['module'])? 'class="error"' : '');
        $check['meta_title'] = (count($_POST['list_length']) != count($_POST['meta_title']) || arrOneEmpty($_POST['meta_title'])? 'class="error"' : '');
        $check['meta_keywords'] = (count($_POST['list_length']) != count($_POST['meta_keywords']) || arrOneEmpty($_POST['meta_keywords'])? 'class="error"' : '');
        $check['meta_description'] = (count($_POST['list_length']) != count($_POST['meta_description']) || arrOneEmpty($_POST['meta_description'])? 'class="error"' : '');

        $primary = q("
            SELECT `module`
            FROM  `admin_module_pages`
            WHERE `module` = '".mres($_POST['module'])."' AND `id` != ".(int)$_REQUEST['edit']."
            LIMIT 1
        ");

        if($primary->num_rows > 0){
            $check['module'] = 'class="error"';
        }

        // list
        $list_length = (isset($_POST['list_length'])? implode(',', $_POST['list_length']) : '');
        $meta_title = (isset($_POST['meta_title'])? implode('#|#', $_POST['meta_title']) : '');
        $meta_keywords = (isset($_POST['meta_keywords'])? implode('#|#', $_POST['meta_keywords']) : '');
        $meta_description = (isset($_POST['meta_description'])? implode('#|#', $_POST['meta_description']) : '');

        // Photo
        $og_image = ((isset($_POST['og_image']))? explode('|', $_POST['og_image']) : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];
            $_POST['open_graph_page'] = !isset($_POST['open_graph_page'])? 0 : (int)$_POST['open_graph_page'];

            q(" UPDATE `admin_module_pages` SET
                `active`           = ".$_POST['active'].",
                `module`           = '".$_POST['module']."',
                `list_length`      = '".mres($list_length)."',
                `meta_title`       = '".mres($meta_title)."',
                `meta_keywords`    = '".mres($meta_keywords)."',
                `meta_description` = '".mres($meta_description)."',
                `open_graph_page`  = '".$_POST['open_graph_page']."',
                `og_type`          = '".$_POST['og_type']."',
                `og_url`          = '".$_POST['og_url']."',
                `og_image`           = '".mres($og_image[0])."',
                `user_custom`  = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
                WHERE `id` = ".(int)$_REQUEST['edit']."
            ");

            sessionInfo('/admin/setting/modules-pages/', 'Модуль змінено успішно!', 1);
        }
    }

    $arResult = q("
        SELECT *
        FROM `admin_module_pages`
        WHERE `id` = ".(int)$_REQUEST['edit']."
    ");

    if($arResult->num_rows == 0){
        sessionInfo('/admin/setting/modules-pages/', 'Помилка, елемента з таким ID неіснує!');
    } else {
        $arResult = $arResult->fetch_assoc();
    }
} else {

    if(isset($_POST['arr']) && count($_POST['arr']) > 0){ // Dynamic edit
        DynamicEditMenu::edit($_POST['arr'], 'admin_module_pages', '/admin/setting/modules-pages/');
    }

    if(isset($_REQUEST['del'])){ // Delete one
        deleteElement($_REQUEST['del'], 'admin_module_pages', '/admin/setting/modules-pages/');
    }

    if(isset($_POST['delete']) && isset($_POST['ids'])){ // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'admin_module_pages', '/admin/setting/modules-pages/');
    }

    if(isset($_POST['deactivate']) && isset($_POST['ids'])){ // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'admin_module_pages');
        sessionInfo('/admin/setting/modules-pages/', 'Деактивація пройшла успішно!', 1);
    }

    if(isset($_POST['activate']) && isset($_POST['ids'])){ // Activate
        activeElement(implode(',', $_POST['ids']), 'admin_module_pages');
        sessionInfo('/admin/setting/modules-pages/', 'Активація пройшла успішно!', 1);
    }

    // Filter
    if(isset($_REQUEST['filterReset'])){
        unset($_SESSION['ADM_filter']['module_pages']);
        header('Location: /admin/setting/modules-pages/');
    }

    $_SESSION['ADM_filter']['module_pages'] = (isset($_POST['filter'])? $_POST['filter'] : (isset($_SESSION['ADM_filter']['module_pages'])? $_SESSION['ADM_filter']['module_pages'] : ''));
    $htmlFilter = AdminFilter::htmlFormation('admin_module_pages', $arMainParam['length_admin'], $_SESSION['ADM_filter']['module_pages']);
    $filter = (!empty($_SESSION['ADM_filter']['module_pages'])? AdminFilter::filter($_SESSION['ADM_filter']['module_pages'], 'admin_module_pages') : '');

    // Pagination
    $module = Pagination::formNav(array(
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/setting/modules-pages/",
        'db_table'    => "admin_module_pages",
        'css_class'   => "pagination-admin",
        'filter'      => $filter,
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ));
}