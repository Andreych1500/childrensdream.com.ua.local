<?php
if($_SERVER['REMOTE_ADDR'] == '5.58.53.67' || $_SERVER['REMOTE_ADDR'] == '178.20.153.111'){
    // Создаем поток
    $opts = array(
        'http' => array(
            'method' => "GET",
            'header' => "Accept-language: en\r\n"."Cookie: foo=bar\r\n"
        )
    );

    $context = stream_context_create($opts);

    // Открываем файл с помощью установленных выше HTTP-заголовков
    // $yandex = file_get_contents('https://mc.yandex.ru/metrika/watch.js', false, $context);
    $google = file_get_contents('https://www.google-analytics.com/analytics.js', false, $context);

    // if($yandex){
    //     $fp = fopen($_SERVER['DOCUMENT_ROOT']."/skins/default/get-js/watch.js", "w");
    //     fwrite($fp, $yandex);
    //     fclose($fp);
    // }

    if($google){
        $fp = fopen($_SERVER['DOCUMENT_ROOT']."/skins/default/get-js/analytics.js", "w");
        fwrite($fp, $google);
        fclose($fp);
    }

}