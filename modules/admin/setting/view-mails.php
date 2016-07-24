<?php
if(isset($_REQUEST['view'])){
    if(isset($_POST['send'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['test_email'] = ((empty($_POST['test_email']) || !filter_var($_POST['test_email'], FILTER_VALIDATE_EMAIL))? 'class="error"' : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $arResult = hsc(q("
                SELECT `symbol_code`
                FROM `admin_type_mails`
                WHERE `id` = ".(int)$_REQUEST['view']."
                LIMIT 1
            ")->fetch_assoc());

            Mail::$text = TemplateMail::formationMail('', $arResult['symbol_code'], $_POST['lang_send'], $arMainParam);

            if(Mail::$text){
                Mail::$to = $_POST['test_email'];
                Mail::send();
            }

            sessionInfo('/admin/setting/view-mails/', $mess['Тестовий лист успішно відправлений!'], 1);
        }
    }

    $arResult = hsc(q("
        SELECT *
        FROM `admin_type_mails`
        WHERE `id` = ".(int)$_REQUEST['view']."
    ")->fetch_assoc());
} else {
    // Pagination
    $view_mails = Pagination::formNav(array(
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/setting/view-mails/",
        'db_table'    => "admin_type_mails",
        'css_class'   => "pagination-admin",
        'filter'      => '',
        'sort'        => '',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ));
}