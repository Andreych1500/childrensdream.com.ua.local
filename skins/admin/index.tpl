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

  <script src="/vendor/public/jquery/dist/jquery.min.js?v=<?=$version?>"></script>
  <script src="/skins/admin/js/script.js?v=<?=$version?>"></script>
  <script src="/vendor/public/translit/dist/translit.js?v=<?=$version?>"></script>
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

        <!-- new info -->
        <?php if(count($new_el) > 0){ ?>
        <div class="new-info">
          <span class="icon-info"></span>
          <?=count($new_el)?>
        </div>
        <div class="info-open-click">
          <div class="adm-informer-header">Нові сповіщення</div>
          <?php foreach($new_el as $key => $value){ ?>
          <div class="informer-item">
            <span class="icon-<?=(($key == 'order')? "truck" : "form")?>"></span>
            <a href="/admin/<?=$key?>/?editIfno=<?=$key?>"><?=$value?></a>
          </div>
          <?php } ?>
        </div>
        <?php } ?>
        <!-- end new info -->

      </div>
      <div class="right-panel">
        <span class="icon-user-tie"><?=$_SESSION['user']['FIO']?></span>
        <a href="/cab/exit/">Вихід</a>
      </div>
      <div class="adm-header-bottom"></div>
    </div>
    <div class="admin-left-panel">
      <ul>
        <li><a href="/admin/main-banner/"><span class="icon-window"></span>Баннер на головній</a><span class="hov-animation"></span></li>
        <li><a href="/admin/products/"><span class="icon-content"></span>Продукція</a><span class="hov-animation"></span></li>
        <li><a href="/admin/call-me/"><span class="icon-academic"></span>Зворотній зв'язок</a><span class="hov-animation"></span></li>
        <li><a href="/admin/comments/"><span class="icon-form"></span>Відгуки на сайті</a><span class="hov-animation"></span></li>
        <li><a href="/admin/order/"><span class="icon-truck"></span>Замовлення</a><span class="hov-animation"></span></li>
        <li><a href="/admin/mails/"><span class="icon-mail4"></span>Листи</a><span class="hov-animation"></span></li>
        <li><a href="/admin/main-module/"><span class="icon-settings"></span>Настройки</a><span class="hov-animation"></span></li>
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