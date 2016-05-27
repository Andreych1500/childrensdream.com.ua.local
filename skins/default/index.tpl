<!DOCTYPE html>
<html lang="<?=(($lang == 'ua')? 'uk' : $lang)?>" <?=(isset($contentOG)? 'prefix="og: http://ogp.me/ns#"' : "");?>>
<head>
  <meta charset="UTF-8">
  <title><?=hsc(Core::$META['title']);?></title>
  <meta name="apple-mobile-web-app-title" content="<?=hsc(Core::$META['title']);?>">
  <meta name="description" content="<?=hsc(Core::$META['description']);?>">
  <meta name="keywords" content="<?=hsc(Core::$META['keywords']);?>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="author" content="Савіцький Андрій">
  <meta name="robots" content="index, follow">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="format-detection" content="address=no">
  <meta name="wot-verification" content="bcd94738f88b9e4b84cc">
  <meta name="yandex-verification" content="5854273bd6955a00">
  <meta name="google-site-verification" content="NG_BJLREDe6ifpCdXCwIABOgW_P7cRVrcl8lNueh3os">

  <?=(isset($contentOG) ? $contentOG : "");?>

  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon" href="/touch-icon-iphone.png">
  <link rel="apple-touch-icon" sizes="76x76" href="/touch-icon-ipad.png">
  <link rel="apple-touch-icon" sizes="120x120" href="/touch-icon-iphone-retina.png">
  <link rel="apple-touch-icon" sizes="152x152" href="/touch-icon-ipad-retina.png">

  <link href="/skins/<?=Core::$SKIN; ?>/css/style.min.css?v=<?=$vF?>" rel="stylesheet">
  <!--[if lt IE 9]><script src="/skins/default/js/ielt9.min.js" defer></script><![endif]-->

  <script src="/vendor/public/jquery/dist/jquery.min.js" defer></script>
  <?php if(count(Core::$JS)){ echo implode("\n",Core::$JS); } ?>
  <script src="/skins/default/js/script.min.js?v=<?=$vF?>" defer></script>

  <script type="application/ld+json">
    {
      "@context": "http://schema.org",
      "@type": "Organization",
      "url" : "<?=Core::$DOCUMENT_ROOT.(($link_langs == '/')? '/' : '/ru/');?>",
      "logo" : "<?=Core::$DOCUMENT_ROOT;?>/skins/default/img/logo.png",
      "name": "Children's Dream",
      "telephone": "+38 (098) 57-04-377",
      "email": "cdmatrasses@gmail.com",
      "address": {
        "@type": "PostalAddress",
        "addressLocality": "<?=$mess['ADDRES_LOCATION']?>",
        "postalCode": "	46000"
      }
    }
  </script>
</head>

<body itemscope itemtype="http://schema.org/WebPage">
  <meta itemprop="description" content="<?=Core::$META['description'];?>">
  <header itemscope itemtype="http://schema.org/WPHeader">
    <div class="header-block">
      <a class="logo" href="<?=$link_langs?>"><img src="/skins/default/img/logo.png" alt="Children's Dream" title="Children's Dream"></a>
      <a class="lang_ua <?=(($link_langs == '/')? 'act-lang' : '')?>" href="/<?=Core::$SITE_DIR?>">UA</a>
      <a class="lang_ru <?=(($link_langs == '/ru/')? 'act-lang' : '')?>" href="/ru/<?=Core::$SITE_DIR?>">RU</a>
      <a class="mobile-basket" href="<?=$link_langs?>order/" rel="nofollow"><?=$mess['BASKET']?> <span><?=(int)$countG?></span></a>
      <div class="mob-menu" onclick="showHide(this);"><span class="icon-mob-menu"></span><?=$mess['MOBILE_MENU']?></div>
      <a class="call-us" href="<?=(isMobile() ? 'tel' : 'callto')?>:38-098-570-43-77"><?=$mess['CONTACT_INFO']?> +38 (098) 570-43-77</a>

      <nav class="top-menu" itemscope itemtype="http://www.schema.org/SiteNavigationElement">
        <ul>
          <li><a href="<?=$link_langs?>#about"    itemprop="url"><span itemprop="name"><?=$mess['ABOUT_US']?></span></a></li>
          <li><a href="<?=$link_langs?>products/" itemprop="url"><span itemprop="name"><?=$mess['PRODUCTION']?></span></a></li>
          <li><a href="<?=$link_langs?>#payment"  itemprop="url"><span itemprop="name"><?=$mess['SERVICES']?></span></a></li>
          <li><a href="<?=$link_langs?>#call"     itemprop="url"><span itemprop="name"><?=$mess['CONTACTS']?></span></a></li>
          <li><a href="<?=$link_langs?>comments/" itemprop="url"><span itemprop="name"><?=$mess['OTZUVU']?></span></a></li>
          <li><a href="<?=$link_langs?>order/"    itemprop="url" rel="nofollow"><?=$mess['BASKET']?><span><?=(int)$countG?></span></a></li>
        </ul>
        <span class="menu-icon"></span>
      </nav>

      <div class="toTop"><?=$mess['TO_TOP']?></div>
    </div>
  </header>

  <main><?=$content?></main>

  <footer itemscope itemtype="http://schema.org/WPFooter">
    <div class="footer-block">
      <img class="logo-img" src="/skins/default/img/footer-logo.png" alt="Children's Dream" title="Children's Dream">
      <div class="development-site">
        <p>&copy;<?=data(Core::$CREATED).$mess['FOOTER_TOP']?></p>
        <p><?=$mess['GOOD_ACCES']?></p>
      </div>
      <div class="soc-link">
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