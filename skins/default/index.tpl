<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title><?php echo hsc(Core::$META['title']);?></title>
  <meta name="description" content="<?php echo hsc(Core::$META['descrition']); ?>">
  <meta name="keywords" content="<?php echo hsc(Core::$META['ketwords']); ?>">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

  <?php if(count(Core::$CSS)){ echo implode("\n",Core::$CSS); } ?>
  <link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet">
  <link href="/skins/<?php echo Core::$SKIN; ?>/css/media_style.css" rel="stylesheet">
  <link rel="stylesheet" href="/vendor/public/pushy/css/pushy.css">
</head>

<body>
  <header>
    <div class="item">
      <div class="logo">
        <a href="<?=(isset($lang)? '/ru/' : '/')?>">
          <img src="/skins/default/img/logo.png" alt="childrensdream" title="childrensdream">
        </a>
      </div>
      <div class="information">
        <p><?=$mess['CONTACT_INFO'];?><span> +38 (098) 570-43-77</span></p>
      </div>
      <div class="langs">
        <a class="<?=(!isset($lang)? 'act-lang' : '')?>" href="/<?=Core::$SITE_DIR?>">UA</a>
        <a class="<?=((isset($lang)? 'act-lang' : ''))?>" href="/ru/<?=Core::$SITE_DIR?>">RU</a>
      </div>
      <div class="top-menu">
        <ul>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>#about"><?=$mess['ABOUT_US']?></a></li>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>#catalog"><?=$mess['PRODUCTION']?></a></li>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>#payment"><?=$mess['SERVICES']?></a></li>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>#call"><?=$mess['CONTACTS']?></a></li>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>comments"><?=$mess['OTZUVU']?></a></li>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>order"><?=$mess['BASKET']?> <span><?=(int)$countG?></span></a></li>
        </ul>
        <span class="menu-icon"></span>
      </div>
      <div class="mobile-basket">
        <a href="<?=(isset($lang)? '/ru/' : '/')?>order"><?=$mess['BASKET']?> <span><?=(int)$countG?></span></a>
      </div>

      <!-- Open mobile menu -->
      <div class="site-overlay"></div>
      <div id="container">
        <div class="menu-btn"><span class="icon-mob-menu"></span><?=$mess['MOBILE_MENU']?></div>
      </div>

      <nav class="pushy pushy-left">
        <ul>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>#about"><?=$mess['ABOUT_US']?></a></li>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>#catalog"><?=$mess['PRODUCTION']?></a></li>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>#payment"><?=$mess['SERVICES']?></a></li>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>#call"><?=$mess['CONTACTS']?></a></li>
          <li><a href="<?=(isset($lang)? '/ru/' : '/')?>comments"><?=$mess['OTZUVU']?></a></li>
        </ul>
      </nav>
    </div>
    <div class="toTop"><span><?=$mess['TO_TOP']?></span></div>
  </header>

  <div class="content"><?=$content?></div>

  <footer>
    <script src="/vendor/public/jquery/dist/jquery.min.js" defer></script>
    <script src="/vendor/public/pushy/js/pushy.js" defer></script>
    <script src="/skins/default/js/script.js?v=1" defer></script>
    <?php if(count(Core::$JS)){ echo implode("\n",Core::$JS); } ?>
    <div class="item">
      <div class="footer-logo">
        <div  class="logo-img">
          <img src="/skins/default/img/footer-logo.png" alt="childrensdream" title="childrensdream">
        </div>
        <div class="development-site">
          <p>&copy;<?=data(Core::$CREATED).$mess['FOOTER_TOP']?></p>
          <p><?=$mess['GOOD_ACCES']?></p>
        </div>
      </div>
      <div class="soc-link">
        <p><?=$mess['SOC_LINK']?></p>
        <a href="//www.facebook.com/tmchildrensdream" target="_blank" class="icon-facebook" rel="nofollow"></a>
        <a href="//vk.com/tmchildrensdream" target="_blank" class="icon-vkontakte" rel="nofollow"></a>
        <a href="//www.instagram.com/tm_childrens_dream" target="_blank" class="icon-instagram" rel="nofollow"></a>
      </div>
    </div>
  </footer>

</body>
</html>