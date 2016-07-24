<div class="section-interface-k2">
  <div class="line-custom-edit">
    <p class="header-name-edit"><?=$mess['Настройки сайту']?></p>
  </div>

  <!-- Menu tabs --->
  <ul class="tabs-panel">
    <li class="active-tab"><?=$messG['Настройки']?></li>
    <li><?=$mess['Переклад сайту']?></li>
  </ul>

  <form class="content-form" action="" method="post">

    <!-- Element tabs -->
    <div class="tabs active-block-tabs">
      <div class="header-line"><?=$mess['Кількість записів у пагінації']?></div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Кількість']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['records_pagination'])? $check['records_pagination'] : '')?> type="number" name="records_pagination" min="10" max="80" value="<?=(isset($error)? (int)$_POST['records_pagination'] : (int)$arResult['records_pagination'])?>">
      </div>

      <div class="header-line"><?=$mess['Розміри зображень']?></div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Логотип Saviii']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['logo_saviii_size'])? $check['logo_saviii_size'] : '')?> type="number" name="logo_saviii_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['logo_saviii_size'] : (int)$arResult['logo_saviii_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Логотип Магазину (адмінка)']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['brand_size'])? $check['brand_size'] : '')?> type="number" name="brand_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['brand_size'] : (int)$arResult['brand_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Головний баннер']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['banner_size'])? $check['banner_size'] : '')?> type="number" name="banner_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['banner_size'] : (int)$arResult['banner_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Анонс зображень товарів']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['anons_size'])? $check['anons_size'] : '')?> type="number" name="anons_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['anons_size'] : (int)$arResult['anons_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Зображення у колі товару']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['circle_size'])? $check['circle_size'] : '')?> type="number" name="circle_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['circle_size'] : (int)$arResult['circle_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Додаткові зображення товару']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['more_size'])? $check['more_size'] : '')?> type="number" name="more_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['more_size'] : (int)$arResult['more_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Зображення для RDFa']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['rdfa_size'])? $check['rdfa_size'] : '')?> type="number" name="rdfa_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['rdfa_size'] : (int)$arResult['rdfa_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Аватар користувача']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['user_avatar_size'])? $check['rdfa_size'] : '')?> type="number" name="user_avatar_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['user_avatar_size'] : (int)$arResult['user_avatar_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Аватар користувача']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['user_avatar_size'])? $check['rdfa_size'] : '')?> type="number" name="user_avatar_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['user_avatar_size'] : (int)$arResult['user_avatar_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Сертифікати магазину']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['certification_size'])? $check['certification_size'] : '')?> type="number" name="certification_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['certification_size'] : (int)$arResult['certification_size'])?>">
      </div>

      <div class="header-line"><?=$mess['Дерикторій для збереження файлів']?></div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Логотип Saviii']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['logo_saviii_dir'])? $check['logo_saviii_dir'] : '')?> type="text" name="logo_saviii_dir" value="<?=(isset($error)? hsc($_POST['logo_saviii_dir']) : $arResult['logo_saviii_dir'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Логотип Магазину (адмінка)']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['brandPhoto_dir'])? $check['brandPhoto_dir'] : '')?> type="text" name="brandPhoto_dir" value="<?=(isset($error)? hsc($_POST['brandPhoto_dir']) : $arResult['brandPhoto_dir'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Головний баннер']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['banner_dir'])? $check['banner_dir'] : '')?> type="text" name="banner_dir" value="<?=(isset($error)? hsc($_POST['banner_dir']) : $arResult['banner_dir'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Продукції']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['products_dir'])? $check['products_dir'] : '')?> type="text" name="products_dir" value="<?=(isset($error)? hsc($_POST['products_dir']) : $arResult['products_dir'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Аватар користувача']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['user_avatar_dir'])? $check['user_avatar_dir'] : '')?> type="text" name="user_avatar_dir" value="<?=(isset($error)? hsc($_POST['user_avatar_dir']) : $arResult['user_avatar_dir'])?>">
      </div>

      <div class="input-value">
        <div class="name-section">RDFa:<span class="accent">*</span></div>
        <input <?=(isset($check['rdfa_dir'])? $check['rdfa_dir'] : '')?> type="text" name="rdfa_dir" value="<?=(isset($error)? hsc($_POST['rdfa_dir']) : $arResult['rdfa_dir'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Сертифікати магазину']?>:<span class="accent">*</span></div>
        <input <?=(isset($check['certification_dir'])? $check['certification_dir'] : '')?> type="text" name="certification_dir" value="<?=(isset($error)? hsc($_POST['certification_dir']) : $arResult['certification_dir'])?>">
      </div>
    </div>

    <div class="tabs">
      <div class="header-line"><?=$mess['Список мов у адмін панелі']?></div>

      <div class="input-value">
        <div class="name-section"><span class="pop-info">i</span><?=$mess['Вибір мови для адмін панелі']?>:
          <div class="pop-window"><?=$messG['Видалити пункт']?></div>
        </div>
        <div class="right-position">
          <?php foreach((isset($error)? $_POST['list_length_admin'] : explode(',', $arResult['list_length_admin'])) as $k => $v){ ?>
            <input type="text" name="list_length_admin[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
          <?php } ?>
          <div class="add-el-list" data-name="list_length_admin[]" data-type="text" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
        </div>
      </div>
    </div>

    <input type="submit" value="<?=$messG['Зберегти']?>" name="ok">
  </form>
</div>