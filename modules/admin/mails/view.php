<?php
// --- GET ELEMENT ---

$mails = q("
    SELECT *
    FROM `mails`
    WHERE `id` = ".(int)$_GET['id']."
    LIMIT 1
");

if($mails->num_rows){
    $arResult = $mails->fetch_assoc();

    // --- SEND LIST ---

    if(isset($_POST['send'],$_POST['lang_send'])){
        Mail::$text      = TemplateMail::orderHtml($_POST['lang_send']);
        Mail::$from      = $arResult['from_mail'];
        Mail::$to        = $arResult['to_mail'];
        Mail::$subject   = $arResult['name'];
        Mail::$type_list = $arResult['type'];
        Mail::Send();
        header("Location: /admin/mails/");
        exit();
    }

    // --- END SEND LIST ---


    // --- CONTENT VIEW ---

    preg_match('#<body(.+)</body>#uis', TemplateMail::orderHtml('ua'), $body_ua);
    $body_ua = preg_replace('#(body)#uis', 'div', $body_ua[0]);
    preg_match('#<body(.+)</body>#uis', TemplateMail::orderHtml('ru'), $body_ru);
    $body_ru = preg_replace('#(body)#uis', 'div', $body_ru[0]);

    // --- END CONTENT VIEW ---
} else {
    header("Location: /admin/mails/");
    exit();
}

// --- END GET ELEMENT ---