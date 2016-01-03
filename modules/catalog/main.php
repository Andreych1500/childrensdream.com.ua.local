<?php
Core::$META['title'] = 'Childrensdream.com.ua';

$catalog = ((isset($lang))? '`catalog_ru`' : '`catalog_ua`' );

if($_GET['page'] == 'main'){

    // catalog
    $catalog = q("
      SELECT `id`,`name`,`seo_name`,`price`,`availability`,`anons_photo`
      FROM $catalog
      WHERE `active` = 1
    ");

} else {

    // catalog
    $catalog = q("
      SELECT *
      FROM $catalog
      WHERE `seo_name` = '".mres($_GET['page'])."'
      LIMIT 1
    ");

    if($catalog->num_rows == 0 || isset($_GET['key1'])){
        header("Location: /404");
        exit();
    }

}