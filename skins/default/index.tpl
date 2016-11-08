<!DOCTYPE html>
<html lang="<?=(($lang == 'ua')? 'uk' : $lang)?>" <?=(isset($contentOG)? 'prefix="og: http://ogp.me/ns#"' : "")?>>
<head>
  <meta charset="UTF-8">
  <title><?=Core::$META['title']?></title>
  <meta name="apple-mobile-web-app-title" content="<?=Core::$META['title']?>">
  <meta name="description" content="<?=Core::$META['description']?>">
  <meta name="keywords" content="<?=Core::$META['keywords']?>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="author" content="Савіцький Андрій">
  <meta name="robots" content="index, follow">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="format-detection" content="address=no">
  <meta name="wot-verification" content="bcd94738f88b9e4b84cc">
  <meta name="yandex-verification" content="5854273bd6955a00">
  <meta name="google-site-verification" content="NG_BJLREDe6ifpCdXCwIABOgW_P7cRVrcl8lNueh3os">

  <?php foreach(Core::$META['dns-prefetch'] as $v){ ?>
    <link rel="dns-prefetch" href="<?=$v?>">
  <?php } ?>
  <link rel="canonical" href="<?=Core::$META['canonical']?>">

  <link rel="alternate" href="<?=Core::$META['alternate']?>" hreflang="x-default">
  <?php foreach(Core::$LINK_LANG as $k => $v){
    echo '<link rel="alternate" href="'.Core::$META['alternate_'.$v].'" hreflang="'.(($v == 'ua')? 'uk' : $v).'">';
  } ?>

  <?=(isset($contentOG)? $contentOG : "")?>

  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon" href="/touch-icon-iphone.png">
  <link rel="apple-touch-icon" sizes="76x76" href="/touch-icon-ipad.png">
  <link rel="apple-touch-icon" sizes="120x120" href="/touch-icon-iphone-retina.png">
  <link rel="apple-touch-icon" sizes="152x152" href="/touch-icon-ipad-retina.png">

  <link rel="publisher" href="//plus.google.com/+ChildrensdreamUaRU">
  <style><?=$style?></style>
  <!--[if lt IE 9]>
  <script src="/skins/default/js/ielt9.min.js" defer></script><![endif]-->

  <script src="/vendor/public/jquery/dist/jquery.min.js" defer></script>
  <script src="/vendor/public/jquery.cookie/jquery.cookie.min.js" defer></script>
  <?=(count(Core::$JS)? implode("\n", Core::$JS) : '')?>
  <script src="/skins/default/js/script.min.js?v=<?=$vF?>" defer></script>

  <script type="application/ld+json">
    {
      "@context": "http://schema.org",
      "@type": "Organization",
      "url" : "<?=$arMainParam['url_http_site'].$link_lang?>",
      "logo" : "<?=$arMainParam['url_http_site']?>/skins/default/img/logo.png",
      "name": "Children's Dream",
      "telephone": "+38 (098) 57-04-377",
      "email": "cdmatrasses@gmail.com",
      "address": {
        "@type": "PostalAddress",
        "addressLocality": "<?=$messG['ADDRES_LOCATION']?>",
        "postalCode": "	46000"
      }
    }
  </script>
</head>

<body itemscope itemtype="http://schema.org/WebPage">
<meta itemprop="description" content="<?=Core::$META['description']?>">
<header itemscope itemtype="http://schema.org/WPHeader">
  <div class="header-block">
    <a class="logo" href="<?=$link_lang?>" title="Children's Dream">
      <img src="/skins/default/img/logo.png" alt="Children's Dream" title="Children's Dream"> </a>
    <?php foreach(Core::$LINK_LANG as $k => $v){ ?>
      <a class="lang_<?=$v?> <?=(($lang == $v)? 'act-lang' : '')?>" href="<?=(($v == 'ua')? '/' : '/'.$v.'/').Core::$SITE_DIR?>"><?=strtoupper($v)?></a>
    <?php } ?>
    <a class="mobile-basket" href="<?=$link_lang?>order/" rel="nofollow"><?=$messG['BASKET']?>
      <span><?=(int)$countG?></span></a>
    <div class="mob-menu" onclick="showHide(this);"><span class="icon-mob-menu"></span><?=$messG['MOBILE_MENU']?></div>
    <a class="call-us" href="<?=(isMobile()? 'tel' : 'callto')?>:38-098-570-43-77" title="<?=$messG['CN_SHOP']?>"><?=$messG['CONTACT_INFO']?> +38 (098) 570-43-77</a>

    <nav class="top-menu" itemscope itemtype="http://www.schema.org/SiteNavigationElement">
      <ul>
        <li><a href="<?=$link_lang?>products/" title="<?=$messG['PRODUCTION_CH']?>" itemprop="url">
            <span itemprop="name"><?=$messG['PRODUCTION']?></span> </a></li>
        <li><a href="<?=$link_lang?>#payment" title="<?=$messG['SERVICES']?>" itemprop="url">
            <span itemprop="name"><?=$messG['SERVICES']?></span></a></li>
        <li><a href="<?=$link_lang?>#call" title="<?=$messG['Зв\'язатись з нами']?>" itemprop="url">
            <span itemprop="name"><?=$messG['Зв\'язатись з нами']?></span></a></li>
        <li><a href="<?=$link_lang?>comments/" title="<?=$messG['OTZUVU_SHOP']?>" itemprop="url">
            <span itemprop="name"><?=$messG['OTZUVU']?></span></a></li>
        <li><a href="<?=$link_lang?>order/" rel="nofollow"><?=$messG['BASKET']?>
            <span><?=(int)$countG?></span></a></li>
      </ul>
      <span class="menu-icon"></span>
    </nav>

    <div class="toTop"><?=$messG['TO_TOP']?></div>
  </div>
</header>

<main><?=$content?></main>

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
<!--      <li><a href="/contacts/" title="">Контакти</a></li>-->
    </ul>
  </div>
</footer>

<div class="fixed-overlay">
  <div class="modal">
    <div class="modal_container">
      <span class="icon-cross"></span> <span class="btnModal-right icon-top"></span>
      <div class="modalMain"></div>
      <span class="btnModal-left icon-bottom"></span>
    </div>
  </div>
</div>

<script>
  (function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r;
    i[r] = i[r] || function () {
        (i[r].q = i[r].q || []).push(arguments)
      }, i[r].l = 1 * new Date();
    a = s.createElement(o),
      m = s.getElementsByTagName(o)[0];
    a.async = 1;
    a.src = g;
    m.parentNode.insertBefore(a, m)
  })(window, document, 'script', '<?=$arMainParam['url_http_site']?>/skins/default/get-js/analytics.js', 'ga');
  ga('create', 'UA-78459198-1', 'auto');
  ga('send', 'pageview');
</script>
<!-- Yandex.Metrika counter -->
<script type="text/javascript"> (function (d, w, c) {
    (w[c] = w[c] || []).push(function () {
      try {
        w.yaCounter37623530 = new Ya.Metrika({
          id: 37623530,
          clickmap: true,
          trackLinks: true,
          accurateTrackBounce: true
        });
      } catch (e) {
      }
    });
    var n = d.getElementsByTagName("script")[0], s = d.createElement("script"), f = function () {
      n.parentNode.insertBefore(s, n);
    };
    s.type = "text/javascript";
    s.async = true;
    s.src = "<?=$arMainParam['url_http_site']?>/skins/default/get-js/watch.js";
    if (w.opera == "[object Opera]") {
      d.addEventListener("DOMContentLoaded", f, false);
    } else {
      f();
    }
  })(document, window, "yandex_metrika_callbacks"); </script>
<noscript>
  <div>
    <img src="https://mc.yandex.ru/watch/37623530" class="yandex-metrika" alt="Yandex Metrika love Children's Dream">
  </div>
</noscript>
</body>
</html>