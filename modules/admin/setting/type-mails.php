<?php
if(isset($_REQUEST['add'])){

    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['symbol_code'] = (empty($_POST['symbol_code'])? 'class="error"' : '');

        $primary = q("
            SELECT `symbol_code`
            FROM  `admin_type_mails`
            WHERE `symbol_code` = '".mres($_POST['symbol_code'])."'
            LIMIT 1
        ");

        if($primary->num_rows > 0){
            $check['symbol_code'] = 'class="error"';
        }

        // list
        $list_length = (isset($_POST['list_length'])? implode(',', $_POST['list_length']) : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];

            q(" INSERT INTO `admin_type_mails` SET
                `active`       = ".$_POST['active'].",
                `name`         = '".$_POST['name']."',
                `symbol_code`  = '".$_POST['symbol_code']."',
                `list_length`  = '".$list_length."',
                `hidden_copy`  = '".$_POST['hidden_copy']."',
                `user_custom`  = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."',
                `data_create`  = NOW()
            ");

            sessionInfo('/admin/setting/type-mails/', $messG['Елемент створено успішно!'], 1);
        }
    }
} elseif(isset($_REQUEST['edit'])) {

    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['symbol_code'] = (empty($_POST['symbol_code'])? 'class="error"' : '');
        $check['name_list'] = (count($_POST['name_list']) != count($_POST['list_length']) || arrOneEmpty($_POST['name_list'])? 'class="error"' : '');
        $check['why_list'] = (count($_POST['why_list']) != count($_POST['list_length']) || arrOneEmpty($_POST['why_list'])? 'class="error"' : '');
        $check['text'] = (count($_POST['text']) != count($_POST['list_length']) || arrOneEmpty($_POST['text'])? 'class="error"' : '');
        $check['theme_list'] = (count($_POST['theme_list']) != count($_POST['list_length']) || arrOneEmpty($_POST['theme_list'])? 'class="error"' : '');

        $primary = q("
            SELECT `symbol_code`
            FROM  `admin_type_mails`
            WHERE `symbol_code` = '".mres($_POST['symbol_code'])."' AND `id` != ".(int)$_REQUEST['edit']."
            LIMIT 1
        ");

        if($primary->num_rows > 0){
            $check['symbol_code'] = 'class="error"';
        }
  
        // list
        $list_length = (isset($_POST['list_length'])? implode(',', $_POST['list_length']) : '');
        $theme_list = (isset($_POST['theme_list'])? implode('#|#', $_POST['theme_list']) : '');
        $name_list = (isset($_POST['name_list'])? implode('#|#', $_POST['name_list']) : '');
        $why_list = (isset($_POST['why_list'])? implode('#|#', $_POST['why_list']) : '');
        $text_list = (isset($_POST['text'])? implode('#|#', $_POST['text']) : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];

            q(" UPDATE `admin_type_mails` SET
                `active`       = ".$_POST['active'].",
                `name`         = '".$_POST['name']."',
                `symbol_code`  = '".$_POST['symbol_code']."',
                `list_length`  = '".mres($list_length)."',
                `why_list`     = '".mres($why_list)."',
                `name_list`    = '".mres($name_list)."',
                `text`         = '".mres($text_list)."',
                `theme_list`   = '".mres($theme_list)."',
                `hidden_copy`  = '".$_POST['hidden_copy']."',
                `user_custom`  = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
                WHERE `id` = ".(int)$_REQUEST['edit']."
            ");

            sessionInfo('/admin/setting/type-mails/', $messG['Редагування пройшло успішно!'], 1);
        }
    }

    $arResult = q("
        SELECT * 
        FROM `admin_type_mails`
        WHERE `id` = ".(int)$_REQUEST['edit']."
    ");

    if($arResult->num_rows == 0){
        sessionInfo('/admin/setting/type-mails/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = $arResult->fetch_assoc();
    }
} else {

    if(isset($_POST['arr']) && count($_POST['arr']) > 0){ // Dynamic edit
        DynamicEditMenu::edit($_POST['arr'], 'admin_type_mails', '/admin/setting/type-mails/', $messG['Редагування пройшло успішно!']);
    }

    if(isset($_REQUEST['del'])){ // Delete one
        deleteElement($_REQUEST['del'], 'admin_type_mails', '/admin/setting/type-mails/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['delete']) && isset($_POST['ids'])){ // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'admin_type_mails', '/admin/setting/type-mails/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['deactivate']) && isset($_POST['ids'])){ // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'admin_type_mails');
        sessionInfo('/admin/setting/type-mails/', $messG['Деактивація пройшла успішно!'], 1);
    }

    if(isset($_POST['activate']) && isset($_POST['ids'])){ // Activate
        activeElement(implode(',', $_POST['ids']), 'admin_type_mails');
        sessionInfo('/admin/setting/type-mails/', $messG['Активація пройшла успішно!'], 1);
    }

    // Filter
    if(isset($_REQUEST['filterReset'])){
        unset($_SESSION['ADM_filter']['type_mails']);
        header('Location: /admin/setting/type-mails/');
    }

    $_SESSION['ADM_filter']['type_mails'] = (isset($_POST['filter'])? $_POST['filter'] : (isset($_SESSION['ADM_filter']['type_mails'])? $_SESSION['ADM_filter']['type_mails'] : ''));
    $htmlFilter = AdminFilter::htmlFormation('admin_type_mails', $arMainParam['length_admin'], $_SESSION['ADM_filter']['type_mails']);
    $filter = (!empty($_SESSION['ADM_filter']['type_mails'])? AdminFilter::filter($_SESSION['ADM_filter']['type_mails'], 'admin_type_mails') : '');

    // PAGINATION
    $type_mails = Pagination::formNav(array(
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/setting/type-mails/",
        'db_table'    => "admin_type_mails",
        'css_class'   => "pagination-admin",
        'filter'      => $filter,
        'sort'        => '',
        'seo'         => 'N',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ));
}