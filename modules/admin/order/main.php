<?php
if (isset($_REQUEST['view'])) {
    $arResult = q("
        SELECT *
        FROM `order`
        WHERE `id` = ".(int)$_REQUEST['view']."
        LIMIT 1
    ");

    if ($arResult->num_rows == 0) {
        sessionInfo('/admin/order/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = hsc($arResult->fetch_assoc());
    }

    $arResult['count_el'] = explode(',', $arResult['count_el']);
    $arResult['price_el'] = explode(',', $arResult['price_el']);
} else {
    if (isset($_REQUEST['del'])) { // Delete one
        deleteElement($_REQUEST['del'], 'order', '/admin/order/', $messG['Видалення пройшло успішно!']);
    }

    if (isset($_POST['delete']) && isset($_POST['ids'])) { // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'order', '/admin/order/', $messG['Видалення пройшло успішно!']);
    }

    if (isset($_POST['deactivate']) && isset($_POST['ids'])) { // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'order');
        sessionInfo('/admin/order/', $messG['Деактивація пройшла успішно!'], 1);
    }

    if (isset($_POST['activate']) && isset($_POST['ids'])) { // Activate
        activeElement(implode(',', $_POST['ids']), 'order');
        sessionInfo('/admin/order/', $messG['Активація пройшла успішно!'], 1);
    }

    // Pagination
    $order = Pagination::formNav([
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/order/",
        'db_table'    => "order",
        'css_class'   => "pagination-admin",
        'filter'      => '',
        'sort'        => '',
        'seo'         => 'N',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ]);
}