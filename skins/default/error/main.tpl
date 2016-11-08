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

  <link rel="publisher" href="//plus.google.com/+ChildrensdreamUaRU">
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
    <a class="mobile-basket" href="<?=$link_lang?>order/" rel="nofollow"><?=$messG['BASKET']?>
      <span><?=(int)$countG?></span></a>
    <div class="mob-menu" onclick="showHide(this);"><span class="icon-mob-menu"></span><?=$messG['MOBILE_MENU']?></div>
    <a class="call-us" href="<?=(isMobile()? 'tel' : 'callto')?>:38-098-570-43-77"><?=$messG['CONTACT_INFO']?> +38 (098) 570-43-77</a>

    <nav class="top-menu">
      <ul>
        <li>
          <a href="<?=$link_lang?>#about" title="<?=$messG['ABOUT_US']?>"><span itemprop="name"><?=$messG['ABOUT_US']?></span></a>
        </li>
        <li>
          <a href="<?=$link_lang?>products/" title="<?=$messG['PRODUCTION_CH']?>"><span itemprop="name"><?=$messG['PRODUCTION']?></span>
          </a></li>
        <li>
          <a href="<?=$link_lang?>#payment" title="<?=$messG['SERVICES']?>"><span itemprop="name"><?=$messG['SERVICES']?></span></a>
        </li>
        <li>
          <a href="<?=$link_lang?>#call" title="<?=$messG['CONTACTS']?>"><span itemprop="name"><?=$messG['CONTACTS']?></span></a>
        </li>
        <li>
          <a href="<?=$link_lang?>comments/" title="<?=$messG['OTZUVU_SHOP']?>"><span itemprop="name"><?=$messG['OTZUVU']?></span></a>
        </li>
        <li><a href="<?=$link_lang?>order/" rel="nofollow"><?=$messG['BASKET']?><span><?=(int)$countG?></span></a></li>
      </ul>
      <span class="menu-icon"></span>
    </nav>

    <div class="toTop"><?=$messG['TO_TOP']?></div>
  </div>
</header>

<main>
  <div class="i_Error"><?=$status_error?></div>
</main>


<footer itemscope itemtype="http://schema.org/WPFooter">
  <div class="fix-position">
    <p class="development-site">&copy; <?=data(Core::$DATA)?> Інтернет магазин дитячих матраців Children's Dream. Права на всі матеріали сайту захищені та охороняються законом України про авторське право, їх повне або часткове копіювання - заборонено.</p>
    <img class="logo-img" src="/skins/default/img/cd-static.png" alt="Children's Dream" title="Children's Dream">
    <div class="soc-link">
      <p><?=$messG['SOC_LINK']?></p>
      <a href="//www.facebook.com/tmchildrensdream" target="_blank" class="icon-facebook"></a>
      <a href="//vk.com/childrensdream" target="_blank" class="icon-vkontakte"></a>
      <a href="//plus.google.com/+ChildrensdreamUaRU" target="_blank" class="icon-google-plus3"></a>
      <a href="//www.instagram.com/tm_childrens_dream" target="_blank" class="icon-instagram"></a>
      <a href="//twitter.com/cdmatrasses" target="_blank" class="icon-twitter-with-circle"></a>
    </div>
    <div class="fb-right">
      <!--LiveInternet counter-->
      <script type="text/javascript">document.write("<a class='live-internet' rel='nofollow' href='//www.liveinternet.ru/click' target=_blank><img src='//counter.yadro.ru/hit?t27.19;r" + escape(document.referrer) + ((typeof(screen) == "undefined") ? "" : ";s" + screen.width + "*" + screen.height + "*" + (screen.colorDepth ? screen.colorDepth : screen.pixelDepth)) + ";u" + escape(document.URL) + ";" + Math.random() + "' alt='LiveInternet' title='LiveInternet: показано количество просмотров и посетителей'><\/a>")</script><!--/LiveInternet-->
    </div>
    <ul class="simple-menu">
      <li><a href="/privacy-policy/" title="">Політика конфіденційності</a></li>
      <li><a href="/oferta/" title="">Оферта покупця</a></li>
      <li><a href="/certification/" title="">Сертифікати</a></li>
      <li><a href="/contacts/" title="">Контакти</a></li>
    </ul>
  </div>
</footer>
</body>
</html>