<?php
if(isset($_REQUEST['view'])){
    $arResult = q("
        SELECT *
        FROM `call_me`
        WHERE `id` = ".(int)$_REQUEST['view']."
        LIMIT 1
    ");

    if($arResult->num_rows == 0){
        sessionInfo('/admin/comments/call-me/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = hsc($arResult->fetch_assoc());
    }
} else {
    if(isset($_REQUEST['del'])){ // Delete one
        deleteElement($_REQUEST['del'], 'call_me', '/admin/comments/call-me/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['delete']) && isset($_POST['ids'])){ // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'call_me', '/admin/comments/call-me/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['deactivate']) && isset($_POST['ids'])){ // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'call_me');
        sessionInfo('/admin/comments/call-me/', $messG['Деактивація пройшла успішно!'], 1);
    }

    if(isset($_POST['activate']) && isset($_POST['ids'])){ // Activate
        activeElement(implode(',', $_POST['ids']), 'call_me');
        sessionInfo('/admin/comments/call-me/', $messG['Активація пройшла успішно!'], 1);
    }

    // Pagination
    $call_me = Pagination::formNav(array(
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/comments/call-me/",
        'db_table'    => "call_me",
        'css_class'   => "pagination-admin",
        'filter'      => '',
        'sort'        => '',
        'seo'         => 'N',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ));
}