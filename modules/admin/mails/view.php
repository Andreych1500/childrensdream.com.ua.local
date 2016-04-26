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
    preg_match('#<body(.+)</body>#uis', TemplateMailOrder::orderHtml('ua'), $body_ua);
    $body_ua = preg_replace('#(body)#uis', 'div', $body_ua[0]);
    preg_match('#<body(.+)</body>#uis', TemplateMailOrder::orderHtml('ru'), $body_ru);
    $body_ru = preg_replace('#(body)#uis', 'div', $body_ru[0]);
} else {
    header("Location: /admin/mails/");
    exit();
}

// --- END GET ELEMENT ---