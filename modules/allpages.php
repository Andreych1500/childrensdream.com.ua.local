<?php
if(preg_match('#^ru#ius',Core::$CONT['castom']) && Core::$LANGUAGE['status']){
    $langs = Core::$LANGUAGE['allow']['ru'];
} else {
    $langs = Core::$LANGUAGE['default'];
}

// SEO META TAGS
$res = q("
    SELECT *
    FROM `pages`
    WHERE `module` = '".mres($_GET['module'])."'
    LIMIT 1
");

$arMetaTags = $res->fetch_assoc();

Core::$META['title'] = $arMetaTags['meta_title_'.$langs];
Core::$META['description'] = $arMetaTags['meta_description_'.$langs];
Core::$META['keywords'] = $arMetaTags['meta_keywords_'.$langs];

// END SEO META TAGS

if (isset($_COOKIE['items'])) {
    $cookies = (array)json_decode($_COOKIE['items']);
    $countG = count($cookies);
} else {
    $countG = 0;
}