<?php
$elRedirect = array(
    'detskii-ortopedicheskii-matras-lite-organic-cotton' => 'detskii-matras-lite-organic-cotton-kokos-porolon',
    'detskii-matras-novorozhdennykh-lite-aloe-vera'      => 'detskii-matras-lite-aloe-vera-kokos-porolon',
    'detskii-bespruzhinnyi-matras-lux-organic-cotton'    => 'detskii-matras-lux-organic-cotton-kokos-porolon-kokos',
    'ditiachii-matrats-u-lizhechko-lux-aloe-vera'        => 'detskii-matras-lux-aloe-vera-kokos-porolon-kokos'
);

if($r = array_search($_GET['page'], $elRedirect)){
    header("HTTP/1.1 301 Moved Permanently");
    header("Location: ".$arMainParam['url_http_site']."/products/".$r."/");
    exit();
}

if($_GET['page'] == 'main'){

    // All elements
    $products = q("
      SELECT `id`,`name_ua`,`symbol_code`,`price`,`availability`,`img_anons`,`name_ru`,`img_seo_alt_ua`,`img_seo_alt_ru`,`description_ua`,`description_ru`
      FROM `products`
      WHERE `active` = 1
      ORDER BY `availability` DESC, `sort` DESC, `id` DESC
    ");
} else {

    // Detail element
    $products = q("
      SELECT *
      FROM `products`
      WHERE `symbol_code` = '".mres($_GET['page'])."' AND `active` = 1
      LIMIT 1
    ");

    if($products->num_rows < 1 || isset($_GET['key1'])){
        header("HTTP/1.0 404 Not Found");
        echo bufferStartError404($lang, $link_lang);
        exit();
    }

    $arResult = $products->fetch_assoc();

    // Seo meta tags
    Core::$META['title'] = $arResult['meta_title_'.$lang];
    Core::$META['keywords'] = $arResult['meta_keywords_'.$lang];
    Core::$META['description'] = $arResult['meta_description_'.$lang];

    // Canonical
    Core::$META['canonical'] = $arMainParam['url_http_site'].$link_lang.(($GM['module'] == 'static')? '' : $GM['module'].'/'.$arResult['symbol_code'].'/');

    // Alternate lang
    $module_url = (($GM['module'] == 'static')? '' : $GM['module'].'/'.$arResult['symbol_code'].'/');
    Core::$META['alternate'] = $arMainParam['url_http_site'].$link_lang.$module_url;
    foreach(Core::$LINK_LANG as $k => $v){
        Core::$META['alternate_'.$v] = $arMainParam['url_http_site'].(($v == 'ua')? '/' : '/'.$v.'/').$module_url;
    }

    // --- RDFa OPEN GRAPH ---
    if($GM['open_graph_page']){
        $contentOG = '';

        $contentOG .= '<meta property="og:title" content="'.hsc($arResult['meta_title_'.$lang]).'">
        <meta property="og:description"  content="'.hsc($arResult['meta_description_'.$lang]).'">';

        if(!empty($arResult['og_type'])){
            $contentOG .= '<meta property="og:type" content="'.hsc($arResult['og_type']).'">';
        }
        if(!empty($arResult['og_url'])){
            $contentOG .= '<meta property="og:url" content="'.$arMainParam['url_http_site'].'/'.$lang.hsc($arResult['og_url']).'">';
        }
        if(!empty($arResult['og_image'])){
            $contentOG .= '<meta property="og:image" content="'.$arMainParam['url_http_site'].hsc($arResult['og_image']).'">';
        }
    }

    // Slider photo
    $slidePhoto = explode('#', $arResult['img_more']);
    foreach($slidePhoto as $value){
        if(!empty($value)){
            $photos[] = explode('|', $value);
        }
    }

    // Goods in basket
    if(isset($_COOKIE['items'])){
        $cookies = (array)json_decode($_COOKIE['items']);
        if(array_key_exists('g'.$arResult['id'], $cookies)){
            $basket = 'backet-ok';
        }
    }
}

Core::$JS[] = '<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js" defer></script>';
Core::$JS[] = '<script src="/vendor/public/slick-carousel/slick/slick.min.js" defer></script>';
Core::$JS[] = '<script src="/skins/default/js/slide-el.min.js?v='.$vF.'" defer></script>';