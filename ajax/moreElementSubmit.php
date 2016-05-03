<?php
include '../config.php';
$mysqli = new mysqli(Core::$DB_LOCAL, Core::$DB_LOGIN, Core::$DB_PASS, Core::$DB_NAME);


if(isset($_POST['nextLine'], $_POST['siteLang']) && in_array($_POST['siteLang'], array('ua','ru'))){
    $countLine = 4;
    $lastNumber = $countLine * ((int)$_POST['nextLine'] - 1);
    $allElements = $countLine * (int)$_POST['nextLine'];

    $all = mysqli_query($mysqli,"
      SELECT `id`
      FROM `products`
      WHERE `active` = 1
    ");

    $products = mysqli_query($mysqli,"
      SELECT `id`,`name_ua`,`name_ru`,`seo_name`,`price`,`availability`,`cAnonsPhoto`,`img_seo_alt_ua`,`img_seo_alt_ru`
      FROM `products`
      WHERE `active` = 1 ORDER BY `sort` DESC, `id` DESC
      LIMIT ".$lastNumber.", ".$countLine."
    ");

    $all_count = mysqli_num_rows($all);
    $count = mysqli_num_rows($products);
    $end = 1;
    $html = '';

    if($count > 0){
        if($_POST['siteLang'] == 'ua'){
            $link_langs = '/';
        } else {
            $link_langs = '/ru/';
        }

        include '../modules/static/lang/'.$_POST['siteLang'].'/lang.php';

        while($el = mysqli_fetch_assoc($products)){
            $html .= '<div style="display: none;" class="mattress"><a class="photos" href="'.$link_langs.'products/'.htmlspecialchars($el['seo_name']).'/"><img src="'.htmlspecialchars($el['cAnonsPhoto']).'" alt="'.htmlspecialchars($el['img_seo_alt_'.$_POST['siteLang']]).'"></a><a class="links" href="'.$link_langs.'products/'.htmlspecialchars($el['seo_name']).'/">'.htmlspecialchars($el['name_'.$_POST['siteLang']]).'</a><p class="price">'.number_format(htmlspecialchars($el['price']), 0, ',', ' ').' '.$mess['PRICE'].'</p><p class="aviability"><span class="'.(((int)$el['availability'] == 1)? 'icon-check-ok' : 'icon-cross').'"> </span><span>'.(((int)$el['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY']).'</span></p></div>';
        }

        if($all_count <= $allElements){
            $end = 0;
        }

        echo json_encode(array('html' => $html, 'end' => $end));
    }

} else {
    echo json_encode(array('error' => 'warning'));
}