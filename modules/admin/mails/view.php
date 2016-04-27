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

    $goods = q("
        SELECT `id`, `name_ua`, `name_ru`, `cAnonsPhoto`, `seo_name`
        FROM `products`
        WHERE `id` IN (".$arResult['ids_goods'].")
        LIMIT 2
    ");

    $k = 0;
    while($arGoods = $goods->fetch_assoc()){
        TemplateMail::$goods[$k]['photo']   = $arGoods['cAnonsPhoto'];
        TemplateMail::$goods[$k]['name_ua'] = $arGoods['name_ua'];
        TemplateMail::$goods[$k]['name_ru'] = $arGoods['name_ru'];
        TemplateMail::$goods[$k]['link']    = $arGoods['seo_name'];
        ++$k;
    }

    // --- SEND LIST ---

    if(isset($_POST['send'],$_POST['lang_send'])){
        $text = TemplateMail::orderHtml($_POST['lang_send'], Core::$DOCUMENT_ROOT);
        Mail::$text = (($arResult['type'] == 'text')? nslbr(hsc($text)) : $text);
        Mail::$from      = $arResult['from_mail'];
        Mail::$to        = $arResult['to_mail'];
        Mail::$subject   = $arResult['name_'.$_POST['lang_send']];
        Mail::$type_list = $arResult['type'];
        Mail::Send();
        header("Location: /admin/mails/");
        exit();
    }

    // --- END SEND LIST ---


    // --- CONTENT VIEW ---

    preg_match('#<body(.+)</body>#uis', TemplateMail::orderHtml('ua', Core::$DOCUMENT_ROOT), $body_ua);
    $body_ua = preg_replace('#(body)#uis', 'div', (($arResult['type'] == 'text')? hsc($body_ua[0]) : $body_ua[0]));
    preg_match('#<body(.+)</body>#uis', TemplateMail::orderHtml('ru', Core::$DOCUMENT_ROOT), $body_ru);
    $body_ru = preg_replace('#(body)#uis', 'div', (($arResult['type'] == 'text')? hsc($body_ru[0]) : $body_ru[0]));

    // --- END CONTENT VIEW ---
} else {
    header("Location: /admin/mails/");
    exit();
}

// --- END GET ELEMENT ---