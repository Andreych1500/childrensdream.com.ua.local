<?php
// EDIT
if(isset($_POST['ok'])){
    $error = array();
    $_POST = trimAll($_POST);

    // Photo
    $logo_system = ((isset($_POST['logo_system']))? explode('|', $_POST['logo_system']) : '');
    $brandPhoto = ((isset($_POST['brandPhoto']))? explode('|', $_POST['brandPhoto']) : '');

    $check['logo_system'] = (empty($logo_system[0])? 'error' : '');
    $check['brandPhoto'] = (empty($brandPhoto[0])? 'error' : '');

    if(in_array('error', $check)){
        $error['stop'] = 1;
    }

    if(!count($error)){
        $_POST = mres($_POST);

        q(" UPDATE `admin_personal_interface` SET
            `admin_panel`       = '".$_POST['admin_panel']."',
            `system_create`     = '".$_POST['system_create']."',
            `logo_system`       = '".mres($logo_system[0])."',
            `version_php`       = '".$_POST['version_php']."',
            `web_server`        = '".$_POST['web_server']."',
            `version_core`      = '".$_POST['version_core']."',
            `address_site`      = '".$_POST['address_site']."',
            `site_create`       = '".$_POST['site_create']."',
            `responsible_face`  = '".$_POST['responsible_face']."',
            `support_seo`       = '".(int)$_POST['support_seo']."',
            `support_shop`      = '".(int)$_POST['support_shop']."',
            `monthly_fee`       = '".$_POST['monthly_fee']."',
            `phone`             = '".$_POST['phone']."',
            `email`             = '".$_POST['email']."',
            `brand`             = '".$_POST['brand']."',
            `brandPhoto`        = '".mres($brandPhoto[0])."'
            WHERE `id` = 1
        ");

        sessionInfo('/admin/setting/personal-interface/', 'Редагування успішно проведено!', 1);
    }
}

// Ajax
if(isset($_REQUEST['addPhoto'])){
    if(count($info = UploaderPhotos::upload($_FILES['photo'], $_POST['size'], $_POST['directory'])) > 0){
        echo json_encode($info);
    } else {
        echo json_encode(array('error' => 'warning_file'));
    }
    exit();
}

if(isset($_REQUEST['delPhoto']) && !empty($_POST['file_delete'])){
    if(file_exists($_SERVER['DOCUMENT_ROOT'].$_POST['file_delete'])){
        unlink($_SERVER['DOCUMENT_ROOT'].$_POST['file_delete']);
        echo json_encode(array('file' => 'delete'));
    } else {
        echo json_encode(array('error' => 'no files'));
    }
    exit();
}

$arResult = q("
    SELECT * 
    FROM `admin_personal_interface`
    WHERE `id` = 1
")->fetch_assoc();