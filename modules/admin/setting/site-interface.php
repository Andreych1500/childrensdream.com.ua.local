<?php
if(isset($_POST['ok'])){
    $error = array();
    $_POST = trimAll($_POST);

    $check['records_pagination'] = (empty($_POST['records_pagination'])? 'class="error"' : '');
    $check['logo_saviii_dir'] = (empty($_POST['logo_saviii_dir'])? 'class="error"' : '');
    $check['brandPhoto_dir'] = (empty($_POST['brandPhoto_dir'])? 'class="error"' : '');
    $check['banner_dir'] = (empty($_POST['banner_dir'])? 'class="error"' : '');
    $check['products_dir'] = (empty($_POST['products_dir'])? 'class="error"' : '');
    $check['user_avatar_dir'] = (empty($_POST['user_avatar_dir'])? 'class="error"' : '');
    $check['rdfa_dir'] = (empty($_POST['rdfa_dir'])? 'class="error"' : '');
    $check['certification_dir'] = (empty($_POST['certification_dir'])? 'class="error"' : '');
    $check['banner_size'] = (empty($_POST['banner_size'])? 'class="error"' : '');
    $check['anons_size'] = (empty($_POST['anons_size'])? 'class="error"' : '');
    $check['circle_size'] = (empty($_POST['circle_size'])? 'class="error"' : '');
    $check['more_size'] = (empty($_POST['more_size'])? 'class="error"' : '');
    $check['rdfa_size'] = (empty($_POST['rdfa_size'])? 'class="error"' : '');
    $check['user_avatar_size'] = (empty($_POST['user_avatar_size'])? 'class="error"' : '');
    $check['logo_saviii_size'] = (empty($_POST['logo_saviii_size'])? 'class="error"' : '');
    $check['brand_size'] = (empty($_POST['brand_size'])? 'class="error"' : '');
    $check['certification_size'] = (empty($_POST['certification_size'])? 'class="error"' : '');

    // list
    $list_length_admin = (isset($_POST['list_length_admin'])? implode(',', $_POST['list_length_admin']) : '');

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
            `more_size`            = '".(int)$_POST['more_size']."',
            `rdfa_size`            = '".(int)$_POST['rdfa_size']."',
            `certification_size`   = '".(int)$_POST['certification_size']."',
            `user_avatar_size`     = '".$_POST['user_avatar_size']."',
            `logo_saviii_dir`      = '".$_POST['logo_saviii_dir']."',
            `brandPhoto_dir`       = '".$_POST['brandPhoto_dir']."',
            `user_avatar_dir`      = '".$_POST['user_avatar_dir']."',
            `rdfa_dir`             = '".$_POST['rdfa_dir']."',
            `banner_dir`           = '".$_POST['banner_dir']."',
            `products_dir`         = '".$_POST['products_dir']."',
            `certification_dir`    = '".$_POST['certification_dir']."',
            `list_length_admin`    = '".mres($list_length_admin)."'
            WHERE `id` = 1
        ");

        sessionInfo('/admin/setting/site-interface/', $messG['Редагування пройшло успішно!'], 1);
    }
}

$arResult = hsc(q("
    SELECT * 
    FROM `admin_site_interface`
    WHERE `id` = 1
")->fetch_assoc());