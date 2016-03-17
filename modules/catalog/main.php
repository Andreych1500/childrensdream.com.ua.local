<?php
Core::$JS[] = '<script src="//code.jquery.com/jquery-1.11.0.min.js" defer></script>';
Core::$JS[] = '<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js" defer></script>';
Core::$JS[] = '<script src="/vendor/public/slick-carousel/slick/slick.min.js" defer></script>';
Core::$JS[] = '<script src="/skins/default/js/slide-el.js?v=1" defer></script>';

if($_GET['page'] == 'main'){

    // --- ALL ELEMENT ---

    $catalog = q("
      SELECT `id`,`name_ua`,`seo_name`,`price`,`availability`,`cAnonsPhoto`,`name_ru`,`img_seo_alt_ua`,`img_seo_alt_ru`
      FROM `catalog`
      WHERE `active` = 1 ORDER BY `sort` DESC, `id` DESC
    ");

    // --- END ALL ELEMENT ---

} else {

// --- DETAIL ELEMENT ---

    $catalog = q("
      SELECT *
      FROM `catalog`
      WHERE `seo_name` = '" . mres($_GET['page']) . "' AND `active` = 1
      LIMIT 1
    ");

    if ($catalog->num_rows == 0 || isset($_GET['key1'])) {
        $_GET['module'] = 'error';
        $_GET['page'] = 'main';
        header("HTTP/1.0 404 Not Found");
    }

    $el = $catalog->fetch_assoc();

    // --- SEO ELEMENT META TAGS ---

    Core::$META['title'] = $el['meta_title_'.$lang];
    Core::$META['keywords'] = $el['meta_keywords_'.$lang];
    Core::$META['description'] = $el['meta_description_'.$lang];

    // --- END SEO ELEMENT META TAGS ---


    // --- SLIDER PHOTO ---

    $slidePhoto = explode('#', $el['cMorePhoto']);
    foreach ($slidePhoto as $value) {
        if (!empty($value)) {
            $photos[] = explode('|', $value);
        }
    }

    // --- END SLIDER PHOTO ---

    // --- GOODS IN BASKET ---

    if (isset($_COOKIE['items'])) {
        $cookies = (array)json_decode($_COOKIE['items']);
        if(array_key_exists('g'.$el['id'],$cookies)){
            $basket = 'backet-ok';
        }
    }

    // --- END GOODS IN BASKET ---

// --- END DETAIL ELEMENT ---
}