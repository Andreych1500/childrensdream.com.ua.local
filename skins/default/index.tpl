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
        <p>Контактна інформація:</p>
        <p><a href="tel: +3800000006"><span class="icon-phone"></span> +380-(00)<b>000-00-00</b></a></p>
        <p><a href="skype: skepenikename"><span class="icon-skype"></span> skepenikename</a></p>
      </div>
      <div class="basket">
        <span class="basketIcon">
          <span class="icon-basket"></span>
        </span>
        <span class="basketDesc">Корзина пуста</span>
      </div>
    </div>
    <div class="top-menu">
      <ul>
        <li><a href="#">ПРО НАС <span></span></a></li>
        <li><a href="#">ПРОДУКЦIЯ <span></span></a></li>
        <li><a href="#">ОПЛАТА I ДОСТАВКА <span></span></a></li>
        <li><a href="#">ВIДГУКИ <span></span></a></li>
        <li><a href="#">КОНТАКТИ <span></span></a></li>
      </ul>
    </div>

    <!-- Open mobile menu -->
    <div class="site-overlay"></div>
    <div id="container">
      <div class="menu-btn"><span class="icon-mob-menu"></span>Меню</div>
    </div>

    <nav class="pushy pushy-left">
      <ul>
        <li><a href="#">ПРО НАС</a></li>
        <li><a href="#">ПРОДУКЦIЯ</a></li>
        <li><a href="#">ОПЛАТА I ДОСТАВКА</a></li>
        <li><a href="#">ВIДГУКИ</a></li>
        <li><a href="#">КОНТАКТИ</a></li>
      </ul>
    </nav>









  </header>
  <div class="content">

  </div>
  <div class="clear"></div>
  <footer>
    <div class="info-link">
      <p>Сайт "Childrensdream" - спи спокійно.</p>
      <p>Розробка: school-php student &copy; 2015</p>
      <p>
        <a href="https://www.facebook.com"><span class="icon-facebook"></span></a>
        <a href="https://www.google.ua"><span class="icon-google"></span></a>
        <a href="https://twitter.com"> <span class="icon-twitter"></span></a>
      </p>
    </div>
  </footer>
</body>
</html>