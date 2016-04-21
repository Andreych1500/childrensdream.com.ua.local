<?php
Core::$JS[] = '<script src="//code.jquery.com/jquery-1.11.0.min.js" defer></script>';
Core::$JS[] = '<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js" defer></script>';
Core::$JS[] = '<script src="/vendor/public/slick-carousel/slick/slick.min.js" defer></script>';
Core::$JS[] = '<script src="/skins/default/js/slide-el.js?v=1" defer></script>';
Core::$JS[] = '<script src="/skins/default/js/fancy-modal.js?v=1" defer></script>';

if($_GET['page'] == 'main'){

    // --- ALL ELEMENT ---

    $product = q("
      SELECT `id`,`name_ua`,`seo_name`,`price`,`availability`,`cAnonsPhoto`,`name_ru`,`img_seo_alt_ua`,`img_seo_alt_ru`
      FROM `product`
      WHERE `active` = 1 ORDER BY `sort` DESC, `id` DESC
    ");

    // --- END ALL ELEMENT ---

} else {

// --- DETAIL ELEMENT ---

    $product = q("
      SELECT *
      FROM `product`
      WHERE `seo_name` = '" . mres($_GET['page']) . "' AND `active` = 1
      LIMIT 1
    ");

    if ($product->num_rows == 0 || isset($_GET['key1'])) {
        header("HTTP/1.0 404 Not Found");
    }

    $arResult = $product->fetch_assoc();

    // --- SEO ELEMENT META TAGS ---

    Core::$META['title'] = $arResult['meta_title_'.$lang];
    Core::$META['keywords'] = $arResult['meta_keywords_'.$lang];
    Core::$META['description'] = $arResult['meta_description_'.$lang];

    // --- END SEO ELEMENT META TAGS ---


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