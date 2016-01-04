<?php
Core::$META['title'] = 'Childrensdream.com.ua';

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
}