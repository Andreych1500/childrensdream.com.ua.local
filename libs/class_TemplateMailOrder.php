<?php
class TemplateMailOrder {

    static $name_user    = '#NAME#';
    static $number_order = '#NUMBER_ORDER#';
    static $order_price  = '#PRICE#';
    static $goods = array(
        0 => array(
            "name"  => "#NAME_GOODS0#",
            "link"  => "#LINK_GOODS0#",
            "photo" => "/skins/default/img/default/nofoto.png"
        ),
        1 => array(
            "name"  => "#NAME_GOODS1#",
            "link"  => "#LINK_GOODS1#",
            "photo" => "/skins/default/img/default/nofoto.png"
        )
    );

    static $siteDirToFiles = '';
    static $html = '';

    static function formateHtml(){

        return self::$html = '
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Тема листа</title>
</head>
<body style="background:url('.hsc(self::$siteDirToFiles).' /skins/default/img/mails/pattern.png) #ffffff; max-width:560px; line-height:1.5; color:#482200; padding:30px 20px; font-size:18px; margin:auto;">
<style>
@media screen and (max-width: 480px){ .goods{ width:98% !important; margin-bottom:20px !important; } }
</style>
  <div role="header" style="border: 1px dashed #43D1E0; background:#ffffff; padding:10px 0; border-bottom: 4px solid #43D1E0;">
    <a href="//childrensdream.com.ua" target="_blank" title="www.childrensdream.com.ua" style="outline:none; width: 100%; text-align:center; display:inline-block;"><img src="'.hsc(self::$siteDirToFiles).'/skins/default/img/mails/cd-static.png" style="margin-left: -10px; width:auto"></a>
	<p style="text-align:center; font-size: 26px; margin:0; font-weight:bold;">Інтернет магазин дитячих матраців</p>
	<div style="clear:both;"></div>
  </div>

  <div role="main" style="border: 1px dashed #43D1E0; border-top: 0; background:#ffffff; font-family: sans-serif; padding: 0 3%; border-bottom: 4px solid #43D1E0; padding-top:10px;">
    <p style="margin-top:0;">Вітаю, '.hsc(self::$name_user).'</p>
	<p>Дякуємо Вам за замовлення в нашому Інтернет магазині.</p>
	<p>Ваш заказ №<b>'.hsc(self::$number_order).'</b> на сумму '.hsc(self::$order_price).' грн.</p>
	<p>Вибір доставки: #DEVELORY#.</p>
	<p>Найближчим часом наш менеджер зв\'яжеться з вами для підтвердження замовлення.</p>
	<div style="margin: auto; width: 250px; text-align: center; background: #43D1E0; font-size:20px; margin-bottom: 20px;">
	  <a href="//childrensdream.com.ua/products/" target="_blank" title="" style="color:#ffffff; padding:5px 0; text-decoration:none; display: inline-block; width: 100%;">Продовжити покупки</a>
    </div>
	<p style="font-weight:bold; text-align:center;">Новинки продукції:</p>
	<div class="goods" style="float:left; width:48%; margin:1%; text-align:center;">
        <a target="_blank" style="display:inline-block; width:100%;" href=""><img src="'.hsc(self::$goods[0]['photo']).'" alt="'.hsc(self::$goods[0]['name']).'"></a>
        <a target="_blank" style="width:100%; color:#482200;" href="'.hsc(self::$siteDirToFiles.self::$goods[0]['link']).'">'.hsc(self::$goods[0]['name']).'</a>
    </div>
    <div class="goods" style="float:left; width:48%; margin:1%; text-align:center;">
        <a target="_blank" style="display:inline-block; width:100%;" href=""><img src="'.hsc(self::$goods[1]['photo']).'" alt="'.hsc(self::$goods[1]['name']).'"></a>
        <a target="_blank" style="width:100%; color:#482200;" href="'.hsc(self::$siteDirToFiles.self::$goods[1]['link']).'">'.hsc(self::$goods[1]['name']).'</a>
    </div>
	<div style="clear:both;"></div>
  </div>

  <div role="footer" style="background:#ffffff; padding: 10px; color: #BFBFBF; text-align: center; border: 1px dashed #43D1E0; border-top: 0;">
    <p style="margin-top:0;">E-mail: <b style="color:#8B8B8B;">cdmatrasses@gmail.com</b> | phone: <b style="color:#8B8B8B;">+38 (098) 570-43-77</b></p>
    <div style="font-size:0;">
	  <a href="//www.facebook.com/tmchildrensdream" target="_blank" style="display:inline-block; margin: 0 5px;"><img src="'.hsc(self::$siteDirToFiles).'/skins/default/img/mails/facebook.png"></a>
	  <a href="//vk.com/tmchildrensdream" target="_blank" style="display:inline-block; margin: 0 5px;"><img src="'.hsc(self::$siteDirToFiles).'/skins/default/img/mails/vk.png"></a>
	  <a href="//plus.google.com/u/0/101299485141835241705" target="_blank" style="display:inline-block; margin: 0 5px;"><img src="'.hsc(self::$siteDirToFiles).'/skins/default/img/mails/google_plus.png"></a>
	  <a href="//www.instagram.com/tm_childrens_dream" target="_blank" style="display:inline-block; margin: 0 5px;"><img src="'.hsc(self::$siteDirToFiles).'/skins/default/img/mails/instagram.png"></a>
	  <div style="clear:both;"></div>
	</div>
	<p style="font-size:14px;">Ви отримали цей лист, тому що оформили замовлення на сайті: <a href="//childrensdream.com.ua" target="_blank" style="color: #43D1E0;">www.childrensdream.com.ua</a></p>
  </div>
</body>
</html>';
    }
}