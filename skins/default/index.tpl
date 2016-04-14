<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title><?=hsc(Core::$META['title']);?></title>
  <meta name="description" content="<?=hsc(Core::$META['description']); ?>">
  <meta name="keywords" content="<?=hsc(Core::$META['keywords']); ?>">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

  <link href="/skins/<?=Core::$SKIN; ?>/css/style.css" rel="stylesheet">
  <?php if(count(Core::$CSS)){ echo implode("\n",Core::$CSS); } ?>

  <!--[if lt IE 9]><script src="/skins/default/js/ielt9.js?v=1" defer></script><![endif]-->

  <script src="/vendor/public/jquery/dist/jquery.min.js" defer></script>
  <script src="/skins/default/js/index.js?v=1" defer></script>
  <script src="/skins/default/js/script.js?v=1" defer></script>
  <?php if(count(Core::$JS)){ echo implode("\n",Core::$JS); } ?>
</head>

<body>
  <header>
    <a class="logo" href="<?=$link_langs?>"><img src="/skins/default/img/logo.png" alt="Children's Dream" title="Children's Dream"></a>
    <a class="lang_ua <?=(($link_langs == '/')? 'act-lang' : '')?>" href="/<?=Core::$SITE_DIR?>">UA</a>
    <a class="lang_ru <?=(($link_langs == '/ru/')? 'act-lang' : '')?>" href="/ru/<?=Core::$SITE_DIR?>">RU</a>
    <a class="mobile-basket" href="<?=$link_langs?>order"><?=$mess['BASKET']?> <span><?=(int)$countG?></span></a>
    <div class="mob-menu" onclick="showHide(this);"><span class="icon-mob-menu"></span><?=$mess['MOBILE_MENU']?></div>
    <a class="call-us" href="<?=(isMobile() ? 'tel' : 'callto')?>:38-098-570-43-77"><?=$mess['CONTACT_INFO']?> +38 (098) 570-43-77</a>

    <nav class="top-menu">
      <ul>
        <li><a href="<?=$link_langs?>#about"><?=$mess['ABOUT_US']?></a></li>
        <li><a href="<?=$link_langs?>catalog"><?=$mess['PRODUCTION']?></a></li>
        <li><a href="<?=$link_langs?>#payment"><?=$mess['SERVICES']?></a></li>
        <li><a href="<?=$link_langs?>#call"><?=$mess['CONTACTS']?></a></li>
        <li><a href="<?=$link_langs?>comments"><?=$mess['OTZUVU']?></a></li>
        <li><a href="<?=$link_langs?>order"><?=$mess['BASKET']?> <span><?=(int)$countG?></span></a></li>
      </ul>
      <span class="menu-icon"></span>
    </nav>

    <div class="toTop"><?=$mess['TO_TOP']?></div>
  </header>

  <main><? //=$content?></main>

  <footer>
    <img class="logo-img" src="/skins/default/img/footer-logo.png" alt="Children's Dream" title="Children's Dream">
    <div class="development-site">
      <p>&copy;<?=data(Core::$CREATED).$mess['FOOTER_TOP']?></p>
      <p><?=$mess['GOOD_ACCES']?></p>
    </div>
    <div class="soc-link">
      <p><?=$mess['SOC_LINK']?></p>
      <a href="//www.facebook.com/tmchildrensdream" target="_blank" class="icon-facebook"></a>
      <a href="//vk.com/tmchildrensdream" target="_blank" class="icon-vkontakte"></a>
      <a href="//plus.google.com/u/0/101299485141835241705" target="_blank" class="icon-google-plus3" rel="publisher"></a>
      <a href="//www.instagram.com/tm_childrens_dream" target="_blank" class="icon-instagram"></a>
    </div>
  </footer>
</body>
</html>