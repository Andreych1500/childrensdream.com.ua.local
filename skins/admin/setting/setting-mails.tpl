<div class="section-interface-k2">
  <div class="line-custom-edit">
    <p class="header-name-edit"><?=$mess['Настройка листів']?></p>
  </div>

  <!-- Menu tabs --->
  <ul class="tabs-panel">
    <li class="active-tab"><?=$messG['Настройки']?></li>
  </ul>

  <form class="content-form" action="" method="post">

    <!-- Element tabs -->
    <div class="tabs active-block-tabs">
      <div class="input-value">
        <div class="name-section"><?=$mess['Url сайту з WWW']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['wwwSite'])? $check['wwwSite'] : '')?> type="text" name="wwwSite" value="<?=(isset($error)? hsc($_POST['wwwSite']) : hsc($arResult['wwwSite']))?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Телефон у футері листа']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['phone'])? $check['phone'] : '')?> type="text" name="phone" value="<?=(isset($error)? hsc($_POST['phone']) : hsc($arResult['phone']))?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Email футері листа']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['email'])? $check['email'] : '')?> type="text" name="email" value="<?=(isset($error)? hsc($_POST['email']) : hsc($arResult['email']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">
          <span class="pop-info">i</span><?=$mess['Товари у листі']?>:<span class="accent">*</span>
          <div class="pop-window"><?=$messG['Перечислюємо через кому']?></div>
        </div>
        <input <?=(isset($check['ids_goods'])? $check['ids_goods'] : '')?> type="text" name="ids_goods" value="<?=(isset($error)? hsc($_POST['ids_goods']) : hsc($arResult['ids_goods']))?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Email для тестових відправок або листів']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['email'])? $check['email'] : '')?> type="text" name="email" value="<?=(isset($error)? hsc($_POST['email']) : hsc($arResult['email']))?>">
      </div>
    </div>

    <input type="submit" value="<?=$messG['Зберегти']?>" name="ok">
  </form>
</div>