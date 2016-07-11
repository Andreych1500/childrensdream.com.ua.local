<?php
if(isset($_COOKIE['items'])){

    $cookies = (array)json_decode($_COOKIE['items']);

    if(count($cookies) == 0){
        setcookie('items', '', time() - 16700000, '/');
        header("Location: ".$link_lang."order/");
        exit();
    }

    // Get goods
    foreach($cookies as $key => $value){
        $ids[] = trim($key, 'g');
    }

    $ids = implode(',', $ids);

    $order = q("
        SELECT `id`,`name_ua`,`name_ru`,`price`,`cAnonsPhoto`,`img_seo_alt_ua`,`img_seo_alt_ru`
        FROM `products`
        WHERE `id` IN (".$ids.")
    ");

    if($order->num_rows == 0){
        setcookie('items', '', time() - 16700000, '/');
        header("Location: ".$link_lang."order/");
        exit();
    }

    // Info goods
    $all_goods_price = 0;
    while($row = $order->fetch_assoc()){
        $row['all_price'] = (isset($_POST['count'][$row['id']])? $_POST['count'][$row['id']] : '1') * $row['price'];
        $goods[] = $row;
        $all_goods_price = $all_goods_price + $row['all_price'];
    }

    // Order
    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['text'] = (empty($_POST['phone'])? 'class="error"' : '');
        $check['city'] = (empty($_POST['city'])? 'class="error"' : '');
        $check['phone'] = (empty($_POST['phone'])? 'class="error"' : '');
        $check['adres'] = (empty($_POST['adres'])? 'class="error"' : '');
        $check['email'] = (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)? 'class="error"' : '');
        $check['delivery'] = (($_POST['delivery'] > 6 || $_POST['delivery'] < 0)? 'class="error"' : '');
        $check['payment'] = (($_POST['payment'] > 2 || $_POST['payment'] < 0)? 'class="error"' : '');
        $check['capcha'] = ((!isset($_SESSION['rand_code']) || $_SESSION['rand_code'] != $_POST['capcha'])? 'class="error"' : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        // Info select
        if($_POST['delivery'] == 0){
            $_POST['delivery'] = $mess['DEVELORY0'];
        } elseif($_POST['delivery'] == 1) {
            $_POST['delivery'] = $mess['DEVELORY1'];
        } elseif($_POST['delivery'] == 2) {
            $_POST['delivery'] = $mess['DEVELORY2'];
        } elseif($_POST['delivery'] == 3) {
            $_POST['delivery'] = $mess['DEVELORY3'];
        } elseif($_POST['delivery'] == 4) {
            $_POST['delivery'] = $mess['DEVELORY4'];
        } elseif($_POST['delivery'] == 5) {
            $_POST['delivery'] = $mess['DEVELORY5'];
        } elseif($_POST['delivery'] == 6) {
            $_POST['delivery'] = $mess['DEVELORY6'];
        } else {
            header("Location: ".$link_lang."order/");
            exit();
        }

        if($_POST['payment'] == 0){
            $_POST['payment'] = $mess['PAYMANT0'];
        } elseif($_POST['payment'] == 1) {
            $_POST['payment'] = $mess['PAYMANT1'];
        } elseif($_POST['payment'] == 2) {
            $_POST['payment'] = $mess['PAYMANT2'];
        } else {
            header("Location: ".$link_lang."order/");
            exit();
        }

        // Elements
        if(isset($_POST['names_el'], $_POST['count'], $_POST['prices_el'])){
            $names_el = implode(',', $_POST['names_el']);
            $prices_el = implode(',', $_POST['prices_el']);
            $counts_el = implode(',', $_POST['count']);

            foreach($_POST['count'] as $key => $value){
                if($value > 99 || $value < 1){
                    $error['stop'] = 1;
                }
            }
        } else {
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            q(" INSERT INTO `order` SET
                `name`        = '".$_POST['name']."',
                `phone`       = '".$_POST['phone']."',
                `email`       = '".$_POST['email']."',
                `city`        = '".$_POST['city']."',
                `adres`       = '".$_POST['adres']."',
                `comment`     = '".$_POST['comment']."',
                `delivery`    = '".$_POST['delivery']."',
                `payment`     = '".$_POST['payment']."',
                `all_price`   = '".(int)$all_goods_price."',
                `name_el`     = '".mres($names_el)."',
                `count_el`    = '".mres($counts_el)."',
                `price_el`    = '".mres($prices_el)."',
                `date_create` = NOW()
            ");

            sort($_POST['count']);
            $all_price = '';
            foreach($_POST['prices_el'] as $k => $v){
                $all_price += ($v * $_POST['count'][$k]);
            }

            $param = array(
                'name'      => $_POST['name'],
                'number'    => DB::_()->insert_id,
                'all_price' => $all_price,
                'delivery'  => $_POST['delivery']
            );

            Mail::$text = TemplateMail::formationMail($param, 'order_goods', $lang, $arMainParam);

            if(Mail::$text){
                Mail::$to = $_POST['email'];
                Mail::send();
            }

            setcookie('items', '', time() - 16700000, '/');
            sessionInfo($link_lang.'order', 'Y', 2);
        }
    }
} else {
    $cookies = array();
}