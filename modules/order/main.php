<?php
if (isset($_COOKIE['items'])) {
    $cookies = (array)json_decode($_COOKIE['items']);

    if(count($cookies) == 0){
        setcookie('items','',time()-16700000, '/');
        header("Location: /order/");
        exit();
    }

    // goods
    foreach($cookies as $key => $value){
        $ids[] = trim($key, 'g');
    }

    $ids = implode(',',$ids);

    $res = q("
        SELECT id, name, name_ru, price, anons_photo
        FROM `catalog`
        WHERE `id` IN (".$ids.")
    ");

    $k = 0;
    $all_goods_price = 0;
    while($row = $res->fetch_assoc()){
        $row['all_price'] =  (isset($_POST['count'][$row['id']])? $_POST['count'][$row['id']] : '1') * $row['price'];
        $goods[] = $row;
        $all_goods_price = $all_goods_price + $row['all_price'];
        ++$k;
    }

    if(isset($_POST['ok'])){
        $errors = array();
        $_POST = trimAll($_POST);

    }

    wtf($_POST,1);

} else {
    $cookies = array();
}