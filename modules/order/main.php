<?php
if(isset($_COOKIE['items'])){
    $el = IsGoods::cookieGoods('products', $_COOKIE['items'], $link_lang, '`id`,`name_ua`,`name_ru`,`price`,`img_anons`,`img_seo_alt_ua`,`img_seo_alt_ru`');

    $all_goods_price = 0;
    while($row = $el->fetch_assoc()){
        $row['all_price'] = (isset($_POST['count'][$row['id']])? $_POST['count'][$row['id']] : '1') * $row['price'];
        $goods[] = $row;
        $all_goods_price = $all_goods_price + $row['all_price'];
    }

    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['text'] = (empty($_POST['phone'])? 'class="error"' : '');
        $check['city'] = (empty($_POST['city'])? 'class="error"' : '');
        $check['phone'] = (empty($_POST['phone'])? 'class="error"' : '');
        $check['address'] = (empty($_POST['address'])? 'class="error"' : '');
        $check['email'] = (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)? 'class="error"' : '');
        $check['capcha'] = ((!isset($_SESSION['rand_code']) || $_SESSION['rand_code'] != $_POST['capcha'])? 'class="error"' : '');
        $check['oferta'] = (!isset($_POST['oferta'])? 'class="error"' : '');

        // Info select
        $deliver = q("
            SELECT *
            FROM `admin_delivery_service`
            WHERE `symbol_code` = '".mres($_POST['delivery'])."' AND `active` = 1
        ");

        if($deliver->num_rows == 0){
            $check['delivery'] = 'class="error"';
        } else {
            $deliver = $deliver->fetch_assoc();
        }

        $payment = q("
            SELECT *
            FROM `admin_payment_type`
            WHERE `symbol_code` = '".mres($_POST['payment'])."' AND `active` = 1
        ");

        if($payment->num_rows == 0){
            $check['payment'] = 'class="error"';
        } else {
            $payment = $payment->fetch_assoc();
        }

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
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
                `address`     = '".$_POST['address']."',
                `comment`     = '".$_POST['comment']."',
                `delivery`    = '".mres($deliver['name'])."',
                `payment`     = '".mres($payment['name'])."',
                `all_price`   = '".(int)$all_goods_price."',
                `name_el`     = '".mres($names_el)."',
                `count_el`    = '".mres($counts_el)."',
                `price_el`    = '".mres($prices_el)."',
                `data_create` = NOW()
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
                'delivery'  => $deliver['name'],
                'payment'   => $payment['name']
            );

            Mail::$text = TemplateMail::formationMail($param, 'order_goods', $lang, $arMainParam);

            if(Mail::$text){
                Mail::$to = $_POST['email'];
                Mail::send();
            }

            setcookie('items', '', time() - 16700000, '/');
            sessionInfo($link_lang.'order/', 'Y', 2);
        }
    }

    $delivery = q("
        SELECT * 
        FROM `admin_delivery_service`
        WHERE `active` = 1
    ");

    $payment = q("
        SELECT *
        FROM `admin_payment_type`
        WHERE `active` = 1
    ");
} else {
    $cookies = array();
}