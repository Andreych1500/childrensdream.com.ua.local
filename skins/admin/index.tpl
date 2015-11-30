<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css">
  <title><?php echo hsc(Core::$META['title'] = 'admin');?></title>
  <meta name="description" content="<?php echo hsc(Core::$META['descrition']); ?>">
  <meta name="keywords" content="<?php echo hsc(Core::$META['ketwords']); ?>">
  <?php if(count(Core::$CSS)){ echo implode("\n",Core::$CSS); } ?>
  <?php if(count(Core::$JS)){ echo implode("\n",Core::$JS); } ?> 
</head>

<body>
  <div id="mod_win" style="display:none;">
    <div>
      <span onClick="clicks()">X</span>
      <h2>Привіт Адміністратор!</h2>
      <p>Це меню призначене для адміністраторів сайту!</p>
      <p>Ви вомеже редагувати, видаляти і добавляти товари чи іншу інформацію... Бажаю успіхів)</p>
    </div>
  </div>
  <div class="header-border">
    <div class="conteiner-1">
    <div id="in_ad" onClick="clicks()">Information</div>
      <div class="block-1">
        <div class="leftblock-1">
          <p class="logo">
            <a style="color:#FFF; text-decoration:none;" href="/index.php">АДМІНКА</a>
          </p>
        </div>
        <div class="rightblock-2">
        <?php if(isset($_SESSION['user']) && $_SESSION['user']['access'] == 5){ ?>
          <div class="blokssd">
            <a class="list" href="/admin/news">NEWS</a>
          </div>
          <div class="blokssd">
            <a class="list" href="/admin/products">PRODUCTS</a>
          </div>
          <div class="blokssd">
            <a class="list" href="/admin/user">USER</a>
          </div>
          <div class="blokssd">
            <a class="list" href="/admin/book">BOOK</a>
          </div>
          <div class="blokssd">
            <a class="list" href="/cab/exit">EXIT</a>
          </div>
          <div class="clear"></div>
        </div>
       <?php } ?> 
      </div>
    </div> 
  </div>
</div>
<?php echo $content; ?>
<div class="footer">
  <div class="conteiner-4">
    <div class="footerlast">
      <div class="copy">
        &copy; <?php echo data(CORE::$CREATED); ?> | <a href="" class="company"> PRIVAT SITE</a>
      </div>
    </div>    
  </div>
</div>
</body>
</html>