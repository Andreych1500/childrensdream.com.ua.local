<?php
// --- DNS LOADING ASYNCHRONOUS
Core::$META['dns-prefetch'] = array(
    0 => 'https://www.google-analytics.com',
    1 => 'https://mc.yandex.ru',
    2 => 'http://counter.yadro.ru',
    3 => Core::$DOCUMENT_ROOT,
);

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

// --- CANONICAL ---
Core::$META['canonical'] = Core::$DOCUMENT_ROOT.(($lang == 'ua')? '/' : '/ru/').(($arrOptionModule['module'] == 'static')? '' : $arrOptionModule['module'].'/');

// --- ALTERNATE LANG ---
$module_url = (($arrOptionModule['module'] == 'static')? '' : $arrOptionModule['module'].'/');
Core::$META['alternate'] = Core::$DOCUMENT_ROOT.(($lang == 'ua')? '/' : '/ru/').$module_url;
Core::$META['alternate_ua'] = Core::$DOCUMENT_ROOT.'/'.$module_url;
Core::$META['alternate_ru'] = Core::$DOCUMENT_ROOT.'/ru/'.$module_url;


// --- RDFa OPEN GRAPH ---
if($arrOptionModule['open_graph_page']){
    $contentOG = '';

    $contentOG .= '<meta property="og:title" content="'.hsc($arrOptionModule['meta_title_'.$lang]).'">
            <meta property="og:description"  content="'.hsc($arrOptionModule['meta_description_'.$lang]).'">';

    if(!empty($arrOptionModule['og_type'])){
        $contentOG .= '<meta property="og:type" content="'.hsc($arrOptionModule['og_type']).'">';
    }
    if(!empty($arrOptionModule['og_url'])){
        if($arrOptionModule['og_url'] == '/'){
            $arrOptionModule['og_url'] = '';
        }

        $contentOG .= '<meta property="og:url" content="'.Core::$DOCUMENT_ROOT.$link_langs.hsc($arrOptionModule['og_url']).'">';
    }
    if(!empty($arrOptionModule['og_image'])){
        $contentOG .= '<meta property="og:image" content="'.Core::$DOCUMENT_ROOT.hsc($arrOptionModule['og_image']).'">';
    }
}

// --- COUNT COOKIE ---
if(isset($_COOKIE['items'])){
    $cookies = (array)json_decode($_COOKIE['items']);
    $countG = count($cookies);
}
else{
    $countG = 0;
}