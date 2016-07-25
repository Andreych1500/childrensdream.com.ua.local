<?php
if(isset($_REQUEST['add'])){

    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');

        // list
        $list_length = (isset($_POST['list_length'])? implode(',', $_POST['list_length']) : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];

            q(" INSERT INTO `admin_policy_certification` SET       
                `name`         = '".$_POST['name']."',
                `sort`         = '".(int)$_POST['sort']."',
                `list_length`  = '".$list_length."',
                `user_custom`  = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."',
                `data_custom`  = NOW()
            ");

            sessionInfo('/admin/setting/policy-certification/', $messG['Елемент створено успішно!'], 1);
        }
    }
} elseif(isset($_REQUEST['edit'])) {

    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['list_title'] = (count($_POST['list_title']) != count($_POST['list_length']) || arrOneEmpty($_POST['list_title'])? 'class="error"' : '');
        $check['list_alt'] = (count($_POST['list_alt']) != count($_POST['list_length']) || arrOneEmpty($_POST['list_alt'])? 'class="error"' : '');
        $check['text'] = (count($_POST['text']) != count($_POST['list_length']) || arrOneEmpty($_POST['text'])? 'class="error"' : '');

        // list
        $list_length = (isset($_POST['list_length'])? implode(',', $_POST['list_length']) : '');
        $list_title = (isset($_POST['list_title'])? implode('#|#', $_POST['list_title']) : '');
        $list_alt = (isset($_POST['list_alt'])? implode('#|#', $_POST['list_alt']) : '');
        $text_list = (isset($_POST['text'])? implode('#|#', $_POST['text']) : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];

            q(" UPDATE `admin_policy_certification` SET
                `active`            = ".$_POST['active'].",
                `name`              = '".$_POST['name']."',
                `sort`              = '".$_POST['sort']."',
                `img_certification` = '".$_POST['img_certification']."',
                `list_length`       = '".mres($list_length)."',
                `alt_img`           = '".mres($list_alt)."',
                `text`              = '".mres($text_list)."',
                `title_img`         = '".mres($list_title)."',
                `user_custom`       = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
                WHERE `id` = ".(int)$_REQUEST['edit']."
            ");

            sessionInfo('/admin/setting/policy-certification/', $messG['Редагування пройшло успішно!'], 1);
        }
    }

    $arResult = q("
        SELECT * 
        FROM `admin_policy_certification`
        WHERE `id` = ".(int)$_REQUEST['edit']."
    ");

    if($arResult->num_rows == 0){
        sessionInfo('/admin/setting/policy-certification/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = $arResult->fetch_assoc();
    }
} else {

    if(isset($_POST['arr']) && count($_POST['arr']) > 0){ // Dynamic edit
        DynamicEditMenu::edit($_POST['arr'], 'admin_policy_certification', '/admin/setting/policy-certification/', $messG['Редагування пройшло успішно!']);
    }

    if(isset($_REQUEST['del'])){ // Delete one
        deleteElement($_REQUEST['del'], 'admin_policy_certification', '/admin/setting/policy-certification/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['delete']) && isset($_POST['ids'])){ // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'admin_policy_certification', '/admin/setting/policy-certification/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['deactivate']) && isset($_POST['ids'])){ // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'admin_policy_certification');
        sessionInfo('/admin/setting/policy-certification/', $messG['Деактивація пройшла успішно!'], 1);
    }

    if(isset($_POST['activate']) && isset($_POST['ids'])){ // Activate
        activeElement(implode(',', $_POST['ids']), 'admin_policy_certification');
        sessionInfo('/admin/setting/policy-certification/', $messG['Активація пройшла успішно!'], 1);
    }
    
    // PAGINATION
    $certification = Pagination::formNav(array(
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/setting/policy-certification/",
        'db_table'    => "admin_policy_certification",
        'css_class'   => "pagination-admin",
        'filter'      => '',
        'sort'        => '`id` DESC, ',
        'seo'         => 'N',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ));
}