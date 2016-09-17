<?php
class IsGoods {
    static function cookieGoods($db_table, $cookieGoods, $link_lang, $getParamGoods){
        $cookies = (array)json_decode($cookieGoods);

        if(count($cookies) == 0){
            setcookie('items', '', time() - 16700000, '/');
            header("Location: ".$link_lang."order/");
            exit();
        }

        $allElement = q("
            SELECT `id`
            FROM `".mres($db_table)."`
        ");

        while($arElement = $allElement->fetch_assoc()){
            $arResult[] = $arElement['id'];
        }

        // Get goods
        foreach($cookies as $key => $value){
            if(!preg_match('#[^\d]#uis', trim($key, 'g')) && in_array(trim($key, 'g'), $arResult)){
                $ids[] = trim($key, 'g');
            } else {
                unset($cookies[$key]);
                $del = 'ok';
            }
        }

        if(isset($del)){
            setcookie('items', json_encode($cookies), time() + 16700000, '/');
            header("Location: ".$link_lang."order/");
            exit();
        }

        if(count($ids) == 0){
            setcookie('items', '', time() - 16700000, '/');
            header("Location: ".$link_lang."order/");
            exit();
        }

        $order = q("
            SELECT ".$getParamGoods."
            FROM `".mres($db_table)."`
            WHERE `id` IN (".mres(implode(',', $ids)).")
        ");

        if($order->num_rows == 0){
            setcookie('items', '', time() - 16700000, '/');
            header("Location: ".$link_lang."order/");
            exit();
        } else {
            return $order;
        }
    }
}