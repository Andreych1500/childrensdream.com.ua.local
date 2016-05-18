<?php
include '../config.php';
$mysqli = new mysqli(Core::$DB_LOCAL, Core::$DB_LOGIN, Core::$DB_PASS, Core::$DB_NAME);
mysqli_set_charset($mysqli, "utf8");

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
      SELECT `id`,`name_ua`,`name_ru`,`seo_name`,`price`,`availability`,`cAnonsPhoto`,`img_seo_alt_ua`,`img_seo_alt_ru`,`description_ua`,`description_ru`
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
            $html .= '<div style="display: none;" class="mattress" itemprop="itemListElement" itemscope itemtype="http://schema.org/Product"><a class="photos" href="'.$link_langs.'products/'.htmlspecialchars($el['seo_name']).'/" itemprop="url"><img src="'.htmlspecialchars($el['cAnonsPhoto']).'" alt="'.htmlspecialchars($el['img_seo_alt_'.$_POST['siteLang']]).'" itemprop="image"></a><a class="links" href="'.$link_langs.'products/'.htmlspecialchars($el['seo_name']).'/" itemprop="url"><span itemprop="name">'.htmlspecialchars($el['name_'.$_POST['siteLang']]).'</span></a><p class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer"><span itemprop="price" content="'.htmlspecialchars($el['price']).'.00">'.number_format(htmlspecialchars($el['price']), 0, ',', ' ').'</span><span itemprop="priceCurrency" content="UAH">'.$mess['PRICE'].'</span></p><p class="aviability" itemprop="offers" itemscope itemtype="http://schema.org/Offer"><span class="'.(((int)$el['availability'] == 1)? 'icon-check-ok' : 'icon-cross').'"> </span>'.(((int)$el['availability'] == 1)? '<link itemprop="availability" href="http://schema.org/InStock">' : '<link itemprop="availability" href="http://schema.org/OutOfStock">').'<span>'.(((int)$el['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY']).'</span></p><meta itemprop="description" content="'.htmlspecialchars($el['description_'.$_POST['siteLang']]).'"><meta itemprop="brand" content="Children\'s Dream"></div>';
        }

        if($all_count <= $allElements){
            $end = 0;
        }

        echo json_encode(array('html' => $html, 'end' => $end));
    } else {
        echo json_encode(array('error' => 'warning'));
    }
} else {
    echo json_encode(array('error' => 'warning'));
}