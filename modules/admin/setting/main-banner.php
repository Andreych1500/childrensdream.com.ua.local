<?php
if(isset($_REQUEST['add'])){
    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            q(" INSERT INTO `admin_main_banner` SET
                `name`         = '".$_POST['name']."',
                `sort`         = '".(int)$_POST['sort']."',
                `user_custom`  = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
            ");

            sessionInfo('/admin/setting/main-banner/', $messG['Елемент створено успішно!'], 1);
        }
    }
} elseif(isset($_REQUEST['edit'])) {

    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];

            q(" UPDATE `admin_main_banner` SET
                `active`            = ".$_POST['active'].",
                `name`              = '".$_POST['name']."',
                `sort`              = '".(int)$_POST['sort']."',
                `img_ua`            = '".$_POST['img_ua']."',
                `img_ru`            = '".$_POST['img_ru']."',
                `img_seo_alt_ua`    = '".$_POST['img_seo_alt_ua']."',
                `img_seo_alt_ru`    = '".$_POST['img_seo_alt_ru']."',
                `img_seo_title_ua`  = '".$_POST['img_seo_title_ua']."',
                `img_seo_title_ru`  = '".$_POST['img_seo_title_ru']."',
                `user_custom`    = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
                WHERE `id` = ".(int)$_REQUEST['edit']."
            ");

            sessionInfo('/admin/setting/main-banner/', $messG['Редагування пройшло успішно!'], 1);
        }
    }

    $arResult = q("
        SELECT *
        FROM `admin_main_banner`
        WHERE `id` = ".(int)$_REQUEST['edit']."
    ");

    if($arResult->num_rows == 0){
        sessionInfo('/admin/setting/main-banner/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = $arResult->fetch_assoc();
    }
} else {
    if(isset($_POST['arr']) && count($_POST['arr']) > 0){ // Dynamic edit
        DynamicEditMenu::edit($_POST['arr'], 'admin_main_banner', '/admin/setting/main-banner/', $messG['Редагування пройшло успішно!']);
        sessionInfo('/admin/setting/main-banner/', $messG['Редагування пройшло успішно!'], 1);
    }

    if(isset($_REQUEST['del'])){ // Delete one
        deleteElement($_REQUEST['del'], 'admin_main_banner', '/admin/setting/main-banner/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['delete']) && isset($_POST['ids'])){ // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'admin_main_banner', '/admin/setting/main-banner/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['deactivate']) && isset($_POST['ids'])){ // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'admin_main_banner');
        sessionInfo('/admin/setting/main-banner/', $messG['Деактивація пройшла успішно!'], 1);
    }

    if(isset($_POST['activate']) && isset($_POST['ids'])){ // Activate
        activeElement(implode(',', $_POST['ids']), 'admin_main_banner');
        sessionInfo('/admin/setting/main-banner/', $messG['Активація пройшла успішно!'], 1);
    }

    // Pagination
    $main_banner = Pagination::formNav(array(
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/setting/main-banner/",
        'db_table'    => "admin_main_banner",
        'css_class'   => "pagination-admin",
        'filter'      => '',
        'sort'        => '`sort` DESC, ',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ));
}