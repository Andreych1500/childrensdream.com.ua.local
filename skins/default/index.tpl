<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css">
  <link href="/skins/<?php echo Core::$SKIN; ?>/css/media_style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="/vendor/public/pushy/css/pushy.css">
  <title><?php echo hsc(Core::$META['title']);?></title>
  <meta name="description" content="<?php echo hsc(Core::$META['descrition']); ?>">
  <meta name="keywords" content="<?php echo hsc(Core::$META['ketwords']); ?>">
  <script src="/vendor/public/jquery/dist/jquery.min.js"></script>
  <script src="/vendor/public/pushy/js/pushy.js"></script>
  <link rel="icon" type="image/icon" href="/skins/default/img/moon.ico">
  <?php if(count(Core::$CSS)){ echo implode("\n",Core::$CSS); } ?>
  <?php if(count(Core::$JS)){ echo implode("\n",Core::$JS); } ?>
</head>

<body>
  <header>
    <div class="HcItem">
      <div class="logo">
        <a href="/">
          <img src="/skins/default/img/logo.png" alt="childrensdream" title="childrensdream">
        </a>
      </div>
      <div class="information">
        <p><?=$mess['CONTACT_INFO'];?></p>
        <p><a href="tel: +380962634728"><span class="icon-phone"></span> +380-(96)<b>263-47-28</b></a></p>
        <p><a href="skype: andrioshka_i"><span class="icon-skype"></span> andrioshka_i</a></p>
      </div>
      <div class="basket">
        <span class="basketIcon">
          <span class="icon-basket"></span>
        </span>
        <span class="basketDesc"><?=$mess['BASKET'];?></span>
      </div>

      <div class="langs">
        <a class="<?=(!isset($lang)? 'act-lang' : '')?>" href="/<?=Core::$SITE_DIR?>">UA</a>
        <a class="<?=((isset($lang)? 'act-lang' : ''))?>" href="/ru/<?=Core::$SITE_DIR?>">RU</a>
      </div>
    </div>

    <div class="top-menu">
      <ul>
        <li><a href="#about"><?=$mess['ABOUT_US']?> <span></span></a></li>
        <li><a href="#"><?=$mess['PRODUCTION']?> <span></span></a></li>
        <li><a href="#payment"><?=$mess['SERVICES']?> <span></span></a></li>
        <li><a href="#"><?=$mess['OTZUVU']?> <span></span></a></li>
        <li><a href="#"><?=$mess['CONTACTS']?> <span></span></a></li>
      </ul>
    </div>

    <!-- Open mobile menu -->
    <div class="site-overlay"></div>
    <div id="container">
      <div class="menu-btn"><span class="icon-mob-menu"></span>Меню</div>
    </div>

    <nav class="pushy pushy-left">
      <ul>
        <li><a href="#about"><?=$mess['ABOUT_US']?></a></li>
        <li><a href="#"><?=$mess['PRODUCTION']?></a></li>
        <li><a href="#payment"><?=$mess['SERVICES']?></a></li>
        <li><a href="#"><?=$mess['OTZUVU']?></a></li>
        <li><a href="#"><?=$mess['CONTACTS']?></a></li>
      </ul>
    </nav>
  </header>


  <div class="content">
    <?=$content?>
  </div>


  <div class="clear"></div>
  <footer>
    <div class="info-link">
      <p><?=$mess['FOOTER_TOP'];?></p>
      <p><?=$mess['WORKING']?>: school-php student &copy; 2015</p>
      <p>
        <a href="https://www.facebook.com"><span class="icon-facebook"></span></a>
        <a href="https://www.google.ua"><span class="icon-google"></span></a>
        <a href="https://twitter.com"> <span class="icon-twitter"></span></a>
      </p>
    </div>
  </footer>
</body>
</html>