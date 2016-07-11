<?php

if(isset($_POST['ok'])){
    $error = array();
    $_POST = trimAll($_POST);

    $check['records_pagination'] = (empty($_POST['records_pagination'])? 'class="error"' : '');
    $check['logo_saviii_size'] = (empty($_POST['logo_saviii_size'])? 'class="error"' : '');
    $check['brand_size'] = (empty($_POST['brand_size'])? 'class="error"' : '');
    $check['logo_saviii_dir'] = (empty($_POST['logo_saviii_dir'])? 'class="error"' : '');
    $check['brandPhoto_dir'] = (empty($_POST['brandPhoto_dir'])? 'class="error"' : '');
    $check['banner_dir'] = (empty($_POST['banner_dir'])? 'class="error"' : '');
    $check['products_dir'] = (empty($_POST['products_dir'])? 'class="error"' : '');
    $check['user_avatar_dir'] = (empty($_POST['user_avatar_dir'])? 'class="error"' : '');
    $check['rdfa_dir'] = (empty($_POST['rdfa_dir'])? 'class="error"' : '');
    $check['banner_size'] = (empty($_POST['banner_size'])? 'class="error"' : '');
    $check['anons_size'] = (empty($_POST['anons_size'])? 'class="error"' : '');
    $check['circle_size'] = (empty($_POST['circle_size'])? 'class="error"' : '');
    $check['cmore_size'] = (empty($_POST['cmore_size'])? 'class="error"' : '');
    $check['rdfa_size'] = (empty($_POST['rdfa_size'])? 'class="error"' : '');
    $check['user_avatar_size'] = (empty($_POST['user_avatar_size'])? 'class="error"' : '');

    // list
    $list_error_reporting = (isset($_POST['list_error_reporting'])? implode(',', $_POST['list_error_reporting']) : '');
    $list_logic = (isset($_POST['list_logic'])? implode(',', $_POST['list_logic']) : '');
    $list_active = (isset($_POST['list_active'])? implode(',', $_POST['list_active']) : '');
    $list_length_admin = (isset($_POST['list_length_admin'])? implode(',', $_POST['list_length_admin']) : '');
    $list_male_admin = (isset($_POST['list_male_admin'])? implode(',', $_POST['list_male_admin']) : '');

    if(in_array('class="error"', $check)){
        $error['stop'] = 1;
    }

    if(!count($error)){
        $_POST = mres($_POST);

        q(" UPDATE `admin_site_interface` SET
            `records_pagination`   = '".(int)$_POST['records_pagination']."',
            `logo_saviii_size`     = '".(int)$_POST['logo_saviii_size']."',
            `brand_size`           = '".(int)$_POST['brand_size']."',
            `banner_size`          = '".(int)$_POST['banner_size']."',
            `anons_size`           = '".(int)$_POST['anons_size']."',
            `circle_size`          = '".(int)$_POST['circle_size']."',
            `cmore_size`           = '".(int)$_POST['cmore_size']."',
            `rdfa_size`            = '".(int)$_POST['rdfa_size']."',
            `user_avatar_size`     = '".$_POST['user_avatar_size']."',
            `logo_saviii_dir`      = '".$_POST['logo_saviii_dir']."',
            `brandPhoto_dir`       = '".$_POST['brandPhoto_dir']."',
            `user_avatar_dir`      = '".$_POST['user_avatar_dir']."',
            `rdfa_dir`             = '".$_POST['rdfa_dir']."',
            `banner_dir`           = '".$_POST['banner_dir']."',
            `products_dir`         = '".$_POST['products_dir']."',
            `list_error_reporting` = '".mres($list_error_reporting)."',
            `list_logic`           = '".mres($list_logic)."',
            `list_active`          = '".mres($list_active)."',
            `list_length_admin`    = '".mres($list_length_admin)."',
            `list_male_admin`      = '".mres($list_male_admin)."'
            WHERE `id` = 1
        ");

        sessionInfo('/admin/setting/site-interface/', 'Редагування успішно проведено!', 1);
    }
}

$arResult = q("
    SELECT * 
    FROM `admin_site_interface`
    WHERE `id` = 1
")->fetch_assoc();