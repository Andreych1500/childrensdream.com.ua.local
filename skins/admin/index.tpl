<!--<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title><?php// echo hsc(Core::$META['title']);?></title>

  <link href="/skins/<?php// echo Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css">
  <script src="/vendor/public/jquery/dist/jquery.min.js"></script>
  <script src="/skins/admin/js/script.js"></script>
  <script src="/vendor/public/translit/dist/translit.js"></script>
  <script src="/skins/default/js/script.js?v=1"></script>
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

  <?php //if(count(Core::$CSS)){ echo implode("\n",Core::$CSS); } ?>
</head>

<body>

</body>
</html>-->

<!DOCTYPE html>
<html class="<?=((!isset($_SESSION['user']) || $_SESSION['user']['access'] !=  5)? "connect" : "admin")?>">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title><?=hsc(Core::$META['title'] = 'Адміністрування');?></title>
  <meta name="description" content="<?=hsc(Core::$META['descrition']); ?>">
  <meta name="keywords" content="<?=hsc(Core::$META['ketwords']); ?>">

  <link type="image/x-icon" rel="shortcut icon" href="/ico/big_smile.ico">
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

  <link href="/skins/<?=Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css">
  <?php if(count(Core::$CSS)){ echo implode("\n",Core::$CSS); } ?>

  <script src="/vendor/public/jquery/dist/jquery.min.js?v=1"></script>
  <script src="/skins/admin/js/script.js?v=1"></script>
  <script src="/vendor/public/translit/dist/translit.js?v=1"></script>
  <?php if(count(Core::$JS)){ echo implode("\n",Core::$JS); } ?>
</head>

<body>
<header>
  <?php if(!isset($_SESSION['user']) || $_SESSION['user']['access'] !=  5){?>
    <div class="topPanel no-active">
      <a href="//<?=$_SERVER['HTTP_HOST']?>"><span class="icon-circle-left">www.<?=$_SERVER['HTTP_HOST']?></span></a>
    </div>
  <?php } else { ?>
    <div class="admin-panel">
      <div class="left-panel">
        <a target="_blank" href="//<?=$_SERVER['HTTP_HOST']?>">Сайт</a>
        <a href="//<?=$_SERVER['HTTP_HOST']?>/admin">Адміністрування</a>
      </div>
      <div class="right-panel">
        <span class="icon-user-tie"><?=$_SESSION['user']['FIO']?></span>
        <a href="/cab/exit/">Вихід</a>
      </div>
      <div class="adm-header-bottom"></div>
    </div>
    <div class="admin-left-panel">
      <ul>
        <li><a href="/admin/main-banner"><span class="icon-window"></span>Баннер на головній</a><span class="hov-animation"></span></li>
        <li><a href="/admin/catalog"><span class="icon-content"></span>Продукція</a><span class="hov-animation"></span></li>
        <?/*<li><a href="/admin/student-life"><span class="icon-pictures"></span>Cтудентське життя</a><span class="hov-animation"></span></li>
        <li><a href="/admin/academic"><span class="icon-academic"></span>Викладачі</a><span class="hov-animation"></span></li>
        <li><a href="/admin/call_me"><span class="icon-form"></span>Зв'язатись з нами</a><span class="hov-animation"></span></li>
        <li><a href="/admin/news"><span class="icon-news"></span>Новини</a><span class="hov-animation"></span></li>*/?>
      </ul>
    </div>
  <?php } ?>
</header>

<main <?=(isset($_SESSION['user'])? "class='ok-auth'" : "");?>><?=$content; ?></main>

<footer>
  <div class="bottom-panel <?=(isset($_SESSION['user'])? "new-position" : "no-active");?>">
    <p>Адміністраторська панель. &copy; <?=data(2015);?> </p>
  </div>
</footer>
</body>
</html>