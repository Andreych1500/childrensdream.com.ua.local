<?php
Core::$JS[] =  '<script src="/skins/default/js/chekForm.js?v=1" defer></script>';

// --- ORDER | BASKET ---

if (isset($_COOKIE['items'])) {

    $cookies = (array)json_decode($_COOKIE['items']);

    if(count($cookies) == 0){
        setcookie('items','',time()-16700000, '/');
        header("Location: ".$link_langs."order/");
        exit();
    }

    // --- GET GOODS ---
    foreach($cookies as $key => $value){
        $ids[] = trim($key, 'g');
    }

    $ids = implode(',',$ids);

    $order = q("
        SELECT `id`,`name_ua`,`name_ru`,`price`,`cAnonsPhoto`,`img_seo_alt_ua`,`img_seo_alt_ru`
        FROM `products`
        WHERE `id` IN (".$ids.")
    ");

    // --- END GET GOODS ---


    // --- ARRAY INFO GOODS ---

    $all_goods_price = 0;
    while($row = $order->fetch_assoc()){
        $row['all_price'] =  (isset($_POST['count'][$row['id']])? $_POST['count'][$row['id']] : '1') * $row['price'];
        $goods[] = $row;
        $all_goods_price = $all_goods_price + $row['all_price'];
    }

    // --- END ARRAY INFO GOODS ---


    // --- ORDER FORM ---

    if(isset($_POST['ok'], $_POST['name'], $_POST['phone'], $_POST['email'], $_POST['delivery'], $_POST['city'], $_POST['adres'], $_POST['capcha'])){
        $errors = array();
        $_POST = trimAll($_POST);

        if(empty($_POST['name'])){ $errors['name'] = 'errors'; }
        if(empty($_POST['phone'])){ $errors['phone'] = 'errors'; }
        if(empty($_POST['city'])){ $errors['city'] = 'errors'; }
        if(empty($_POST['adres'])){ $errors['adres'] = 'errors'; }
        if(empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){ $errors['email'] = 'errors'; }
        if(empty($_POST['comment'])){ $_POST['comment'] = ''; }
        if($_POST['delivery'] > 6 || $_POST['delivery'] < 0){ $errors['delivery'] = 'errors'; }
        if($_POST['payment'] > 2 || $_POST['payment'] < 0){ $errors['payment'] = 'errors'; }
        if($_SESSION['rand_code'] != $_POST['capcha']){ $errors['capcha'] = 'errors'; }


        // --- INFO SELECT ---

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

        // --- END INFO SELECT ---


        // --- ELEMENTS ---

        if(count($_POST['names_el']) > 0 && count($_POST['count']) > 0 && count($_POST['prices_el']) > 0){
            $names_el = implode(',',$_POST['names_el']);
            $prices_el = implode(',',$_POST['prices_el']);
            $counts_el = implode(',',$_POST['count']);
        } else {
            $errors = '';
        }

        // --- END ELEMENTS ---


        foreach($_POST['count'] as $key => $value){
            if($value > 99 || $value < 1){
                $errors['count'][$key] = 'errors';
            }
        }

        if(!count($errors)){
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
                `name_el`     = '". mres($names_el)."',
                `count_el`    = '".mres($counts_el)."',
                `price_el`    = '".mres($prices_el)."',
                `date_create` = NOW()
            ");

            $number = DB::_()->insert_id;

            $mails = q("
                SELECT *
                FROM `mails`
                WHERE `code` = 'order'
                LIMIT 1
            ");

            if($mails->num_rows){
                $arResult = $mails->fetch_assoc();
                TemplateMail::$name_user    = $_POST['name'];
                TemplateMail::$number_order = $number;
                TemplateMail::$order_price  = mres($prices_el);

                Mail::$to = $_POST['email'];
                Mail::$text=  TemplateMail::orderHtml($lang, Core::$DOCUMENT_ROOT);
                Mail::$from      = $arResult['from_mail'];
                Mail::$subject   = $arResult['name_'.$lang];
                Mail::$type_list = $arResult['type'];
                Mail::Send();

            }

            // --- MAIL TO GEKA ---
            Mail::$to = 'cdmatrasses@gmail.com';
            Mail::$subject = 'Dvizhenya Renya у нас нове Замолення, УРАА!';
            Mail::$text = '';
            Mail::Send();
            // --- END MAIL TO GEKA ---

            $_SESSION['info'] = 'Y';
            setcookie('items','',time()-16700000, '/');
            header("Location: ".$link_langs."order");
            exit();
        }
    }

    // --- END ORDER FORM ---

} else {
    $cookies = array();
}

// --- END ORDER | BASKET ---


// --- INFORMATION SESSION ---

if(isset($_SESSION['info'])){
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}

// --- END INFORMATION SESSION ---