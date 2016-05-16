<?php
// --- SEO META TAGS ---

$res = q("
    SELECT *
    FROM `pages`
    WHERE `module` = '".mres($_GET['module'])."'
    LIMIT 1
");

$arrOptionModule = $res->fetch_assoc();

Core::$META['title'] = hsc($arrOptionModule['meta_title_'.$lang]);
Core::$META['description'] = hsc($arrOptionModule['meta_description_'.$lang]);
Core::$META['keywords'] = hsc($arrOptionModule['meta_keywords_'.$lang]);

// --- END SEO META TAGS ---


// --- RDFa OPEN GRAPH ---

if($arrOptionModule['open_graph_page']){
    $contentOG = '';

    $contentOG .= '<meta property="og:title" content="'.hsc($arrOptionModule['meta_title_'.$lang]).'">
    <meta property="og:description"  content="'.hsc($arrOptionModule['meta_description_'.$lang]).'">';

    if(!empty($arrOptionModule['og_type'])){
        $contentOG .= '<meta property="og:type" content="'.hsc($arrOptionModule['og_type']).'">';
    }
    if(!empty($arrOptionModule['og_url'])){
        $contentOG .= '<meta property="og:url" content="'.$_SERVER['DOCUMENT_ROOT'].$link_langs.hsc($arResult['og_url']).'">';
    }
    if(!empty($arrOptionModule['og_image'])){
        $contentOG .= '<meta property="og:image" content="'.$_SERVER['DOCUMENT_ROOT'].hsc($arrOptionModule['og_image']).'">';
    }
}

// --- END RDFa OPEN GRAPH ---


// --- COUNT COOKIE ---

if (isset($_COOKIE['items'])) {
    $cookies = (array)json_decode($_COOKIE['items']);
    $countG = count($cookies);
} else {
    $countG = 0;
}

// --- END COUNT GOODS COOKIE ---