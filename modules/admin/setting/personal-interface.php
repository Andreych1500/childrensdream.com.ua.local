<?php
if (isset($_POST['ok'])) {
    $error = [];
    $_POST = trimAll($_POST);

    $check['logo_system'] = (empty($_POST['logo_system'])? 'error' : '');
    $check['brandPhoto'] = (empty($_POST['brandPhoto'])? 'error' : '');

    if (in_array('error', $check)) {
        $error['stop'] = 1;
    }

    if (!count($error)) {
        $_POST = mres($_POST);

        $_POST['active_shop'] = !isset($_POST['active_shop'])? 0 : (int)$_POST['active_shop'];

        q(" UPDATE `admin_personal_interface` SET
            `logo_system`       = '".$_POST['logo_system']."',
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
            `active_shop`       = '".$_POST['active_shop']."',
            `brand`             = '".$_POST['brand']."',
            `brandPhoto`        = '".$_POST['brandPhoto']."'
            WHERE `id` = 1
        ");

        sessionInfo('/admin/setting/personal-interface/', $messG['Редагування пройшло успішно!'], 1);
    }
}

// Ajax
if (isset($_REQUEST['addPhoto'])) {
    if (count($info = UploaderPhotos::upload($_FILES['photo'], $_POST['size'], $_POST['directory'])) > 0) {
        echo json_encode($info);
    } else {
        echo json_encode(['error' => 'warning_file']);
    }
    exit();
}

if (isset($_REQUEST['delPhoto']) && !empty($_POST['file_delete'])) {
    if (file_exists($_SERVER['DOCUMENT_ROOT'].$_POST['file_delete'])) {
        unlink($_SERVER['DOCUMENT_ROOT'].$_POST['file_delete']);
        echo json_encode(['file' => 'delete']);
    } else {
        echo json_encode(['error' => 'no files']);
    }
    exit();
}

$arResult = hsc(q("
    SELECT * 
    FROM `admin_personal_interface`
    WHERE `id` = 1
")->fetch_assoc());