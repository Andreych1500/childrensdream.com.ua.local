<?php
// --- SEO META TAGS ---

$res = q("
    SELECT *
    FROM `pages`
    WHERE `module` = '".mres($_GET['module'])."'
    LIMIT 1
");

$arMetaTags = $res->fetch_assoc();

Core::$META['title'] = $arMetaTags['meta_title_'.$lang];
Core::$META['description'] = $arMetaTags['meta_description_'.$lang];
Core::$META['keywords'] = $arMetaTags['meta_keywords_'.$lang];

// --- END SEO META TAGS ---


// --- COUNT COOKIE ---

if (isset($_COOKIE['items'])) {
    $cookies = (array)json_decode($_COOKIE['items']);
    $countG = count($cookies);
} else {
    $countG = 0;
}

// --- END COUNT GOODS COOKIE ---