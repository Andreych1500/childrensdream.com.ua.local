<?php
Core::$JS[] =  '<script type="text/javascript" src="/skins/default/js/order.js"></script>';

if (isset($_COOKIE['items'])) {
    $cookies = (array)json_decode($_COOKIE['items']);

    if(count($cookies) == 0){
        setcookie('items','',time()-16700000, '/');
        header("Location: /order/");
        exit();
    }

    // Goods
    foreach($cookies as $key => $value){
        $ids[] = trim($key, 'g');
    }

    $ids = implode(',',$ids);

    $res = q("
        SELECT id, name, name_ru, price, anons_photo
        FROM `catalog`
        WHERE `id` IN (".$ids.")
    ");
    // end Goods

    // arGoods
    $k = 0;
    $all_goods_price = 0;
    while($row = $res->fetch_assoc()){
        $row['all_price'] =  (isset($_POST['count'][$row['id']])? $_POST['count'][$row['id']] : '1') * $row['price'];
        $goods[] = $row;
        $all_goods_price = $all_goods_price + $row['all_price'];
        ++$k;
    }
    // end arGoods

    if(isset($_POST['ok'], $_POST['name'], $_POST['phone'], $_POST['email'], $_POST['delivery'], $_POST['city'], $_POST['adres'], $_POST['capcha'])){
        $errors = array();
        $_POST = trimAll($_POST);

        if(empty($_POST['name'])){ $errors['name'] = 'error'; }
        if(empty($_POST['phone'])){ $errors['phone'] = 'error'; }
        if(empty($_POST['city'])){ $errors['city'] = 'error'; }
        if(empty($_POST['adres'])){ $errors['adres'] = 'error'; }
        if(empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){ $errors['email'] = 'error'; }
        if(empty($_POST['comment'])){ $_POST['comment'] = ''; }
        if($_POST['delivery'] > 6 || $_POST['delivery'] < 0){ $errors['delivery'] = 'error'; }
        if($_POST['payment'] > 2 || $_POST['payment'] < 0){ $errors['payment'] = 'error'; }
        if($_SESSION['rand_code'] != $_POST['capcha']){ $errors['capcha'] = 'error'; }

        //info select
        if($_POST['delivery'] == 0){
            $_POST['delivery'] = $mess['DEVELORY0'];
        } elseif($_POST['delivery'] == 1){
            $_POST['delivery'] = $mess['DEVELORY1'];
        } elseif($_POST['delivery'] == 2){
            $_POST['delivery'] = $mess['DEVELORY2'];
        } elseif($_POST['delivery'] == 3){
            $_POST['delivery'] = $mess['DEVELORY3'];
        } elseif($_POST['delivery'] == 4){
            $_POST['delivery'] = $mess['DEVELORY4'];
        } elseif($_POST['delivery'] == 5){
            $_POST['delivery'] = $mess['DEVELORY5'];
        } elseif($_POST['delivery'] == 6){
            $_POST['delivery'] = $mess['DEVELORY6'];
        }

        if($_POST['payment'] == 0){
            $_POST['payment'] = $mess['PAYMANT0'];
        } elseif($_POST['payment'] == 1){
            $_POST['payment'] = $mess['PAYMANT1'];
        } elseif($_POST['payment'] == 2){
            $_POST['payment'] = $mess['PAYMANT2'];
        }

        //elements
        if(count($_POST['names_el']) > 0 && count($_POST['count']) > 0 && count($_POST['prices_el']) > 0){
            $names_el = implode(',',$_POST['names_el']);
            $prices_el = implode(',',$_POST['prices_el']);
            $counts_el = implode(',',$_POST['count']);
        } else {
            $errors = '';
        }

        if(!count($errors)){
            q(" INSERT INTO `order` SET
                `name`      = '" . mres($_POST['name']) . "',
                `phone`     = '" . mres($_POST['phone']) . "',
                `email`     = '" . mres($_POST['email']) . "',
                `city`      = '" . mres($_POST['city']) . "',
                `adres`     = '" . mres($_POST['adres']) . "',
                `comment`   = '" . mres($_POST['comment']) . "',
                `delivery`  = '" . mres($_POST['delivery']) . "',
                `payment`   = '" . mres($_POST['payment']) . "',
                `all_price` = '".(int)$all_goods_price."',
                `name_el`   = '" . mres($names_el) . "',
                `count_el`  = '" . mres($counts_el) . "',
                `price_el`  = '" . mres($prices_el) . "',
                `date`  = NOW()
            ");

            Mail::$to = $_POST['email'];
            Mail::$subject = 'Інтернет-магазин Сhildren*s Dream';
            Mail::$text = "
            <html>
              <head>
                <title>".$mess['ORDERH1']."</title>
              </head>
              <body>
                <div>
                  <img src=\"/skins/default/img/footer-logo.png\" alt=\"childrens-dream\" title=\"childrens-dream\">
                  <a style=\"\" href=\"#\">Перейти на сайт</a>
                </div>
                <hr>
                <div>
                  Текст
                </div>
                <hr>
                <div>
                  Дякуємо за співпрацю! <br>
                  Лист згенеровано автоматично.
                </div>
              </body>
            </html>";
            Mail::Send();

            setcookie('items','',time()-16700000, '/');
            $_SESSION['info'] = "Y";
            header("Location: ".(isset($lang)? '/ru/' : '/')."order");
            exit();
        }
    }
} else {
    $cookies = array();
}

if(isset($_SESSION['info'])){
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}