<?php
class TemplateMail {

    static $name_user    = '#NAME#';
    static $number_order = '#NUMBER_ORDER#';
    static $order_price  = '#PRICE#';
    static $delivery     = '#DELIVERY#';
    static $goods = array(
        0 => array(
            "name_ua"  => "#NAME_GOODS_UA0#",
            "name_ru"  => "#NAME_GOODS_RU0#",
            "link"  => "#LINK_GOODS0",
            "photo" => "/skins/default/img/default/nofoto.png"
        ),
        1 => array(
            "name_ua"  => "#NAME_GOODS_UA1#",
            "name_ru"  => "#NAME_GOODS_UA1#",
            "link"  => "#LINK_GOODS1",
            "photo" => "/skins/default/img/default/nofoto.png"
        )
    );

    static $html = '';

    static function orderHtml($idLang, $siteDirToFiles){
        include './libs/lang/'.$idLang.'/lang.php';
        $lang = (($idLang == 'ua')? '/' : '/ru/');

        $mails = q("
            SELECT *
            FROM `mails`
            WHERE `code` = 'order'
            LIMIT 1
        ");

        if($mails->num_rows){
            $arResult = $mails->fetch_assoc();

            $goods = q("
                SELECT `id`, `name_ua`, `name_ru`, `cAnonsPhoto`, `seo_name`
                FROM `products`
                WHERE `id` IN (".$arResult['ids_goods'].")
                LIMIT 2
            ");

            $k = 0;
            while($arGoods = $goods->fetch_assoc()){
                self::$goods[$k]['photo']   = $arGoods['cAnonsPhoto'];
                self::$goods[$k]['name_ua'] = $arGoods['name_ua'];
                self::$goods[$k]['name_ru'] = $arGoods['name_ru'];
                self::$goods[$k]['link']    = $arGoods['seo_name'];
                ++$k;
            }
        }

        self::$html = '
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Замовлення товару</title>
</head>
<body style="background-image:url('.$siteDirToFiles.'/skins/default/img/mails/pattern.png); background-color:#ffffff; line-height:1.5; color:#482200; padding:30px 20px; font-size:17px;">
<div role="header" style="text-align: center; border: 1px dashed #43D1E0; background:#ffffff; padding:10px; border-bottom: 4px solid #43D1E0; margin: auto; max-width: 538px;">
<a href="'.$siteDirToFiles.$lang.'" target="_blank" title="www.childrensdream.com.ua" style="outline:none; display:inline-block;"><img src="'.$siteDirToFiles.'/skins/default/img/mails/cd-static.png" style="width:auto"></a>
<p style="font-size: 26px; margin:0; font-weight:bold;">'.$mess['ISM'].'</p>
<div style="clear:both;"></div>
</div>
<div role="main" style="border: 1px dashed #43D1E0; border-top: 0; background:#ffffff; font-family: sans-serif; padding: 10px; border-bottom: 4px solid #43D1E0; margin: auto; max-width: 538px;">
<p style="margin:0 0 10px;">'.$mess['TEXT_1'].', '.hsc(self::$name_user).'.</p>
<p style="margin:0 0 10px;">'.$mess['TEXT_2'].'</p>
<p style="margin:0 0 10px;">'.$mess['TEXT_3'].' №'.(int)self::$number_order.' '.$mess['TEXT_4'].' '.hsc(self::$order_price).' грн.</p>
<p style="margin:0 0 10px;">'.$mess['TEXT_5'].': '.self::$delivery.'</p>
<p style="margin:0 0 10px;">'.$mess['TEXT_6'].'</p>
<div style="margin: auto; width: 250px; text-align: center; background: #43D1E0; font-size:20px; margin-bottom: 20px;">
<a href="'.$siteDirToFiles.$lang.'products/" target="_blank" title="" style="color:#ffffff; padding:5px 0; text-decoration:none; display: inline-block; width: 100%;">'.$mess['TEXT_7'].'</a>
</div>
<p style="font-weight:bold; text-align:center; margin:0 0 10px;">'.$mess['TEXT_8'].':</p>
<div style="float:left; width:48%; margin:1%; text-align:center;">
<a href="'.hsc($siteDirToFiles.$lang.'products/'.self::$goods[0]['link']).'" target="_blank" style="display:inline-block; width:100%;"><img src="'.$siteDirToFiles.hsc(self::$goods[0]['photo']).'" style="max-width:200px; width:100%;" alt="'.hsc(self::$goods[0]['name_'.$idLang]).'"></a>
<a href="'.hsc($siteDirToFiles.$lang.'products/'.self::$goods[0]['link']).'" target="_blank" style="width:100%; color:#482200;">'.hsc(self::$goods[0]['name_'.$idLang]).'</a>
</div>
<div style="float:left; width:48%; margin:1%; text-align:center;">
<a href="'.hsc($siteDirToFiles.$lang.'products/'.self::$goods[1]['link']).'" target="_blank" style="display:inline-block; width:100%;"><img src="'.$siteDirToFiles.hsc(self::$goods[1]['photo']).'" style="max-width:200px; width:100%;" alt="'.hsc(self::$goods[1]['name_'.$idLang]).'"></a>
<a href="'.hsc($siteDirToFiles.$lang.'products/'.self::$goods[1]['link']).'" target="_blank" style="width:100%; color:#482200;">'.hsc(self::$goods[1]['name_'.$idLang]).'</a>
</div>
<div style="clear:both;"></div>
</div>
<div role="footer" style="background:#ffffff; padding: 10px; color: #BFBFBF; text-align: center; border: 1px dashed #43D1E0; border-top: 0; margin: auto; max-width: 538px;">
<p style="margin:0 0 10px; font-size: 18px;">E-mail: <a href="mailto:cdmatrasses@gmail.com" style="color:#8B8B8B !important; font-weight:bold; text-decoration:none;">cdmatrasses@gmail.com</a> | phone: <a href="callto:38-098-570-43-77" style="color:#8B8B8B !important; font-weight:bold; text-decoration:none;">+38 (098) 570-43-77</a></p>
<div style="font-size:0; margin:0 0 10px;">
<a href="https://www.facebook.com/tmchildrensdream" target="_blank" style="display:inline-block; margin: 0 5px;"><img src="'.$siteDirToFiles.'/skins/default/img/mails/facebook.png"></a>
<a href="https://vk.com/tmchildrensdream" target="_blank" style="display:inline-block; margin: 0 5px;"><img src="'.$siteDirToFiles.'/skins/default/img/mails/vk.png"></a>
<a href="https://plus.google.com/u/0/101299485141835241705/posts" target="_blank" style="display:inline-block; margin: 0 5px;"><img src="'.$siteDirToFiles.'/skins/default/img/mails/google_plus.png"></a>
<a href="https://www.instagram.com/tm_childrens_dream" target="_blank" style="display:inline-block; margin: 0 5px;"><img src="'.$siteDirToFiles.'/skins/default/img/mails/instagram.png"></a>
<div style="clear:both;"></div>
</div>
<p style="font-size:14px;">'.$mess['TEXT_9'].': <a href="'.$siteDirToFiles.$lang.'" target="_blank" style="color: #43D1E0; display: inherit;">www.childrensdream.com.ua</a></p>
<p style="margin-top:15px;">&copy; '.data(Core::$CREATED).'</p>
</div>
</body>
</html>';

        return  (($arResult['type'] == 'text')? nslbr(hsc(self::$html)) : self::$html);
    }

}