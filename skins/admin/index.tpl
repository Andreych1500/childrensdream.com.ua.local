<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css">
  <link rel="icon" type="image/icon" href="/skins/default/img/moon.ico">
  <title><?php echo hsc(Core::$META['title']);?></title>
  <script src="/vendor/public/jquery/dist/jquery.min.js"></script>
  <script src="/skins/admin/js/script.js"></script>
  <script src="/vendor/public/translit/dist/translit.js"></script>
  <script src="/skins/default/js/script.js?v=1"></script>
  <?php if(count(Core::$CSS)){ echo implode("\n",Core::$CSS); } ?>
</head>

<body>
  <header>
    <div class="HcItem">
      <div class="logo">
        <a href="/<?=Core::$CONT['admin']?>/">
          <img src="/skins/default/img/logo.png" alt="childrensdream" title="childrensdream">
        </a>
      </div>
    </div>
    <?php if(isset($_SESSION['user']) && $_SESSION['user']['access'] == 5){ ?>
    <div class="top-menu">
      <ul>
        <li><a href="/<?=Core::$CONT['admin']?>/catalog/"><?=$mess['PRODUCTION']?> <span></span></a></li>
        <li><a class="active" href="/<?=Core::$CONT['admin']?>/static/call">Зворотній зв'язок <span></span></a></li>
        <li><a href="/<?=Core::$CONT['admin']?>/comments/"><?=$mess['OTZUVU']?> <span></span></a></li>
        <li><a href="/<?=Core::$CONT['admin']?>/order/">Замовлення <span></span></a></li>
        <li><a href="/" target="_blank">Нa сайт<span></span></a></li>
        <li><a href="/cab/exit">Вихід <span></span></a></li>
      </ul>
    </div>
    <?php } ?>
  </header>

  <?php echo $content; ?>

  <div class="clear"></div>
  <footer>
    <div class="info-link">
      <p><?=$mess['WORKING']?>: school-php student &copy; 2015</p>
    </div>
  </footer>
</body>
</html>