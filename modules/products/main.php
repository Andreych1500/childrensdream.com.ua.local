<?php
Core::$JS[] = '<script src="//code.jquery.com/jquery-1.11.0.min.js" defer></script>';
Core::$JS[] = '<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js" defer></script>';
Core::$JS[] = '<script src="/vendor/public/slick-carousel/slick/slick.min.js" defer></script>';
Core::$JS[] = '<script src="/skins/default/js/slide-el.js?v=1" defer></script>';
Core::$JS[] = '<script src="/skins/default/js/fancy-modal.js?v=1" defer></script>';

if($_GET['page'] == 'main'){

    // --- ALL ELEMENT ---

    $products = q("
      SELECT `id`,`name_ua`,`seo_name`,`price`,`availability`,`cAnonsPhoto`,`name_ru`,`img_seo_alt_ua`,`img_seo_alt_ru`
      FROM `products`
      WHERE `active` = 1 ORDER BY `sort` DESC, `id` DESC
    ");

    // --- END ALL ELEMENT ---

} else {

// --- DETAIL ELEMENT ---

    $products = q("
      SELECT *
      FROM `products`
      WHERE `seo_name` = '" . mres($_GET['page']) . "' AND `active` = 1
      LIMIT 1
    ");

    if ($products->num_rows == 0 || isset($_GET['key1'])) {
        header("HTTP/1.0 404 Not Found");
        echo bufferStartError404($lang,$link_langs);
        exit();
    }

    $arResult = $products->fetch_assoc();

    // --- SEO ELEMENT META TAGS ---

    Core::$META['title'] = $arResult['meta_title_'.$lang];
    Core::$META['keywords'] = $arResult['meta_keywords_'.$lang];
    Core::$META['description'] = $arResult['meta_description_'.$lang];

    // --- END SEO ELEMENT META TAGS ---


    // --- RDFa OPEN GRAPH ---

    $contentOG = '';

    $contentOG .= '<meta property="og:title" content="'.hsc($arResult['meta_title_'.$lang]).'">
    <meta property="og:description"  content="'.hsc($arResult['meta_description_'.$lang]).'">';

    if(!empty($arResult['og_type'])){
        $contentOG .= '<meta property="og:type" content="'.hsc($arResult['og_type']).'">';
    }
    if(!empty($arResult['og_url'])){
        $contentOG .= '<meta property="og:url" content="'.$_SERVER['DOCUMENT_ROOT'].$link_langs.hsc($arResult['og_url']).'">';
    }
    if(!empty($arResult['og_image'])){
        $contentOG .= '<meta property="og:image" content="'.$_SERVER['DOCUMENT_ROOT'].hsc($arResult['og_image']).'">';
    }

    // --- END RDFa OPEN GRAPH ---


    // --- SLIDER PHOTO ---

    $slidePhoto = explode('#', $arResult['cMorePhoto']);
    foreach ($slidePhoto as $value) {
        if (!empty($value)) {
            $photos[] = explode('|', $value);
        }
    }

    // --- END SLIDER PHOTO ---

    // --- GOODS IN BASKET ---

    if (isset($_COOKIE['items'])) {
        $cookies = (array)json_decode($_COOKIE['items']);
        if(array_key_exists('g'.$arResult['id'],$cookies)){
            $basket = 'backet-ok';
        }
    }

    // --- END GOODS IN BASKET ---

// --- END DETAIL ELEMENT ---
}