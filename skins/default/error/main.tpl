<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><?=Core::$META['title']?></title>
  <meta name="apple-mobile-web-app-title" content="<?=Core::$META['title']?>">
  <meta name="description" content="<?=Core::$META['description']?>">
  <meta name="keywords" content="<?=Core::$META['keywords']?>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="author" content="Савіцький Андрій">
  <meta name="robots" content="index, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="format-detection" content="address=no">

  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon" href="/touch-icon-iphone.png">
  <link rel="apple-touch-icon" sizes="76x76" href="/touch-icon-ipad.png">
  <link rel="apple-touch-icon" sizes="120x120" href="/touch-icon-iphone-retina.png">
  <link rel="apple-touch-icon" sizes="152x152" href="/touch-icon-ipad-retina.png">

  <link href="/skins/<?=Core::$SKIN?>/css/style.min.css?v=<?=$vF?>" rel="stylesheet">
  <!--[if lt IE 9]>
  <script src="/skins/default/js/ielt9.min.js" defer></script><![endif]-->

  <script src="/vendor/public/jquery/dist/jquery.min.js" defer></script>
  <script src="/vendor/public/jquery.cookie/jquery.cookie.min.js" defer></script>
  <script src="/skins/default/js/script.min.js?v=<?=$vF?>" defer></script>
</head>

<body>
<header>
  <div class="header-block">
    <a class="logo" href="<?=$link_lang?>"><img src="/skins/default/img/logo.png" alt="Children's Dream" title="Children's Dream"></a>
    <?php foreach(Core::$LINK_LANG as $k => $v){ ?>
      <a class="lang_<?=$v?> <?=(($lang == $v)? 'act-lang' : '')?>" href="<?=(($v == 'ua')? '/' : '/'.$v.'/').Core::$SITE_DIR?>"><?=strtoupper($v)?></a>
    <?php } ?>
    <a class="mobile-basket" href="<?=$link_lang?>order/" rel="nofollow"><?=$mess['BASKET']?>
      <span><?=(int)$countG?></span></a>
    <div class="mob-menu" onclick="showHide(this);"><span class="icon-mob-menu"></span><?=$mess['MOBILE_MENU']?></div>
    <a class="call-us" href="<?=(isMobile()? 'tel' : 'callto')?>:38-098-570-43-77"><?=$mess['CONTACT_INFO']?> +38 (098) 570-43-77</a>

    <nav class="top-menu">
      <ul>
        <li><a href="<?=$link_lang?>#about"><?=$mess['ABOUT_US']?></a></li>
        <li><a href="<?=$link_lang?>products/"><?=$mess['PRODUCTION']?></a></li>
        <li><a href="<?=$link_lang?>#payment"><?=$mess['SERVICES']?></a></li>
        <li><a href="<?=$link_lang?>#call"><?=$mess['CONTACTS']?></a></li>
        <li><a href="<?=$link_lang?>comments/"><?=$mess['OTZUVU']?></a></li>
        <li><a href="<?=$link_lang?>order/"><?=$mess['BASKET']?> <span><?=(int)$countG?></span></a></li>
      </ul>
      <span class="menu-icon"></span>
    </nav>

    <div class="toTop"><?=$mess['TO_TOP']?></div>
  </div>
</header>

<main>
  <div class="i_Error"><?=$status_error?></div>
</main>

<footer itemscope itemtype="http://schema.org/WPFooter">
  <div class="footer-block">
    <div class="development-site">
      <img class="logo-img" src="/skins/default/img/cd-static.png" alt="Children's Dream" title="Children's Dream">
      <p><?=$mess['GOOD_ACCES']?></p>
      <p>&copy;<?=data(Core::$DATA)?></p>
      <p><?=$mess['FOOTER_TOP']?></p>
    </div>
    <div class="soc-link error">
      <a rel="nofollow" href="<?=$link_lang?>oferta/">Оферта</a>
      <p><?=$mess['SOC_LINK']?></p>
      <a href="//www.facebook.com/tmchildrensdream" target="_blank" class="icon-facebook"></a>
      <a href="//vk.com/tmchildrensdream" target="_blank" class="icon-vkontakte"></a>
      <a href="//plus.google.com/101299485141835241705" target="_blank" class="icon-google-plus3" rel="publisher"></a>
      <a href="//www.instagram.com/tm_childrens_dream" target="_blank" class="icon-instagram"></a>
    </div>
  </div>
</footer>
</body>
</html>