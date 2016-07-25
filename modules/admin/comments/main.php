<?php
if(isset($_REQUEST['view'])){
    $arResult = q("
        SELECT *
        FROM `comments`
        WHERE `id` = ".(int)$_REQUEST['view']."
        LIMIT 1
    ");

    if($arResult->num_rows == 0){
        sessionInfo('/admin/comments/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = hsc($arResult->fetch_assoc());
    }
} elseif(isset($_REQUEST['edit'])){
    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['email'] = ((empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))? 'class="error"' : '');
        $check['text'] = (empty($_POST['text'])? 'class="error"' : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            q(" UPDATE `comments` SET
 			          `name`        = '".$_POST['name']."',
		            `email`       = '".$_POST['email']."',
 			          `text`        = '".$_POST['text']."',
 			          `user_custom` = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
			          WHERE `id` = ".(int)$_REQUEST['edit']."
		        ");

            sessionInfo('/admin/comments/', $messG['Редагування пройшло успішно!'], 1);
        }
    }

    $arResult = q("
        SELECT * 
        FROM `comments`
        WHERE `id` = ".(int)$_REQUEST['edit']."
    ");

    if($arResult->num_rows == 0){
        sessionInfo('/admin/comments/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = hsc($arResult->fetch_assoc());
    }
} else {
    if(isset($_REQUEST['del'])){ // Delete one
        deleteElement($_REQUEST['del'], 'comments', '/admin/comments/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['delete']) && isset($_POST['ids'])){ // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'comments', '/admin/comments/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['deactivate']) && isset($_POST['ids'])){ // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'comments');
        sessionInfo('/admin/comments/', $messG['Деактивація пройшла успішно!'], 1);
    }

    if(isset($_POST['activate']) && isset($_POST['ids'])){ // Activate
        activeElement(implode(',', $_POST['ids']), 'comments');
        sessionInfo('/admin/comments/', $messG['Активація пройшла успішно!'], 1);
    }

    // Pagination
    $comments = Pagination::formNav(array(
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/comments/",
        'db_table'    => "comments",
        'css_class'   => "pagination-admin",
        'filter'      => '',
        'sort'        => '',
        'seo'         => 'N',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ));
}