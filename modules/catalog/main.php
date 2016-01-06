<?php
Core::$META['title'] = 'Childrensdream.com.ua';
Core::$CSS[] = '<link rel="stylesheet" type="text/css" href="/vendor/public/slick-carousel/slick/slick.css"/>';
Core::$CSS[] = '<link rel="stylesheet" type="text/css" href="/vendor/public/slick-carousel/slick/slick-theme.css"/>';
Core::$JS[] = '<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>';
Core::$JS[] = '<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>';
Core::$JS[] = '<script type="text/javascript" src="/vendor/public/slick-carousel/slick/slick.min.js"></script>';
Core::$JS[] = '<script type="text/javascript" src="/skins/default/js/slide-el.js"></script>';

if($_GET['page'] == 'main'){

    // catalog
    $catalog = q("
      SELECT `id`,`name`,`seo_name`,`price`,`availability`,`anons_photo`,`name_ru`
      FROM `catalog`
      WHERE `active` = 1 ORDER BY `id` DESC
    ");

} else {

    // catalog
    $catalog = q("
      SELECT *
      FROM `catalog`
      WHERE `seo_name` = '".mres($_GET['page'])."' AND `active` = 1
      LIMIT 1
    ");

    if($catalog->num_rows == 0 || isset($_GET['key1'])){
        header("Location: /404");
        exit();
    }

    $el = $catalog->fetch_assoc();

    $slidePhoto = explode('#', $el['more_photos']);
    foreach($slidePhoto as $value){
        $photos[] = explode('|', $value);
    }
}