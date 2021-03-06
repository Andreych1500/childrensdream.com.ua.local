<?php
if (isset($_REQUEST['add'])) {
    if (isset($_POST['ok'])) {
        $error = [];
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['symbol_code'])? 'class="error"' : '');
        $check['symbol_code'] = (empty($_POST['symbol_code'])? 'class="error"' : '');

        $primary = q("
            SELECT `id`
            FROM  `admin_delivery_service`
            WHERE `symbol_code` = '".mres($_POST['symbol_code'])."'
            LIMIT 1
        ");

        if ($primary->num_rows > 0) {
            $check['symbol_code'] = 'class="error"';
        }

        if (in_array('class="error"', $check)) {
            $error['stop'] = 1;
        }

        if (!count($error)) {
            $_POST = mres($_POST);

            q(" INSERT INTO `admin_delivery_service` SET
                `name`         = '".$_POST['name']."',
                `symbol_code`  = '".$_POST['symbol_code']."',
                `sort`         = '".(int)$_POST['sort']."',
                `user_custom`  = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
            ");

            sessionInfo('/admin/order/delivery-service/', $messG['Елемент створено успішно!'], 1);
        }
    }
} elseif (isset($_REQUEST['edit'])) {

    if (isset($_POST['ok'])) {
        $error = [];
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['symbol_code'] = (empty($_POST['symbol_code'])? 'class="error"' : '');

        $primary = q("
            SELECT `symbol_code`
            FROM  `admin_delivery_service`
            WHERE `symbol_code` = '".mres($_POST['symbol_code'])."' AND `id` != ".(int)$_REQUEST['edit']."
            LIMIT 1
        ");

        if ($primary->num_rows > 0) {
            $check['symbol_code'] = 'class="error"';
        }

        if (in_array('class="error"', $check)) {
            $error['stop'] = 1;
        }

        if (!count($error)) {
            $_POST = mres($_POST);

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];

            q(" UPDATE `admin_delivery_service` SET
                `active`       = ".$_POST['active'].",
                `name`         = '".$_POST['name']."',
                `sort`         = '".(int)$_POST['sort']."',
                `symbol_code`  = '".$_POST['symbol_code']."',
                `text`         = '".$_POST['text']."',
                `user_custom`  = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
                WHERE `id` = ".(int)$_REQUEST['edit']."
            ");

            sessionInfo('/admin/order/delivery-service/', $messG['Редагування пройшло успішно!'], 1);
        }
    }

    $arResult = q("
        SELECT *
        FROM `admin_delivery_service`
        WHERE `id` = ".(int)$_REQUEST['edit']."
    ");

    if ($arResult->num_rows == 0) {
        sessionInfo('/admin/order/delivery-service/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = $arResult->fetch_assoc();
    }
} else {
    if (isset($_POST['arr']) && count($_POST['arr']) > 0) { // Dynamic edit
        DynamicEditMenu::edit($_POST['arr'], 'admin_delivery_service', '/admin/order/delivery-service/', $messG['Редагування пройшло успішно!']);
    }

    if (isset($_REQUEST['del'])) { // Delete one
        deleteElement($_REQUEST['del'], 'admin_delivery_service', '/admin/order/delivery-service/', $messG['Видалення пройшло успішно!']);
    }

    if (isset($_POST['delete']) && isset($_POST['ids'])) { // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'admin_delivery_service', '/admin/order/delivery-service/', $messG['Видалення пройшло успішно!']);
    }

    if (isset($_POST['deactivate']) && isset($_POST['ids'])) { // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'admin_main_banner');
        sessionInfo('/admin/order/delivery-service/', $messG['Деактивація пройшла успішно!'], 1);
    }

    if (isset($_POST['activate']) && isset($_POST['ids'])) { // Activate
        activeElement(implode(',', $_POST['ids']), 'admin_main_banner');
        sessionInfo('/admin/order/delivery-service/', $messG['Активація пройшла успішно!'], 1);
    }

    // Pagination
    $service = Pagination::formNav([
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/order/delivery-service/",
        'db_table'    => "admin_delivery_service",
        'css_class'   => "pagination-admin",
        'filter'      => '',
        'sort'        => '`sort` DESC, ',
        'seo'         => 'N',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ]);
}