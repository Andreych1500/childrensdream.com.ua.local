<div class="section-interface-k2">
  <div class="line-custom-edit">
    <p class="header-name-edit">Настройки сайту</p>
  </div>
  <!-- Menu tabs --->
  <ul class="tabs-panel">
    <li class="active-tab">Настройки</li>
    <li>Перелік списків</li>
  </ul>
  <form class="content-form" action="" method="post">
    <!-- Element tabs -->

    <div class="tabs active-block-tabs">
      <div class="header-line">Кількість записів у пагінації</div>

      <div class="input-value">
        <div class="name-section">Кількість:<span class="accent">*</span></div>
        <input <?=(isset($check['records_pagination'])? $check['records_pagination'] : '')?> type="number" name="records_pagination" min="10" max="80" value="<?=(isset($error)? (int)$_POST['records_pagination'] : (int)$arResult['records_pagination'])?>">
      </div>

      <div class="header-line">Розміри зображень</div>

      <div class="input-value">
        <div class="name-section">Логотип Saviii:<span class="accent">*</span></div>
        <input <?=(isset($check['logo_saviii_size'])? $check['logo_saviii_size'] : '')?> type="number" name="logo_saviii_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['logo_saviii_size'] : (int)$arResult['logo_saviii_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section">Логотип Магазину (адмінка):<span class="accent">*</span></div>
        <input <?=(isset($check['brand_size'])? $check['brand_size'] : '')?> type="number" name="brand_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['brand_size'] : (int)$arResult['brand_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section">Головний баннер:<span class="accent">*</span></div>
        <input <?=(isset($check['banner_size'])? $check['banner_size'] : '')?> type="number" name="banner_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['banner_size'] : (int)$arResult['banner_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section">Анонс зображень товарів:<span class="accent">*</span></div>
        <input <?=(isset($check['anons_size'])? $check['anons_size'] : '')?> type="number" name="anons_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['anons_size'] : (int)$arResult['anons_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section">Зображення у колі товару:<span class="accent">*</span></div>
        <input <?=(isset($check['circle_size'])? $check['circle_size'] : '')?> type="number" name="circle_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['circle_size'] : (int)$arResult['circle_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section">Додаткові зображення товару:<span class="accent">*</span></div>
        <input <?=(isset($check['cmore_size'])? $check['cmore_size'] : '')?> type="number" name="cmore_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['cmore_size'] : (int)$arResult['cmore_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section">Зображення для RDFa:<span class="accent">*</span></div>
        <input <?=(isset($check['rdfa_size'])? $check['rdfa_size'] : '')?> type="number" name="rdfa_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['rdfa_size'] : (int)$arResult['rdfa_size'])?>">
      </div>

      <div class="input-value">
        <div class="name-section">Аватар користувача:<span class="accent">*</span></div>
        <input <?=(isset($check['user_avatar_size'])? $check['rdfa_size'] : '')?> type="number" name="user_avatar_size" min="1" max="1200" value="<?=(isset($error)? (int)$_POST['user_avatar_size'] : (int)$arResult['user_avatar_size'])?>">
      </div>


      <div class="header-line">Дерикторій для збереження файлів</div>

      <div class="input-value">
        <div class="name-section">Логотип Saviii:<span class="accent">*</span></div>
        <input <?=(isset($check['logo_saviii_dir'])? $check['logo_saviii_dir'] : '')?> type="text" name="logo_saviii_dir" value="<?=(isset($error)? hsc($_POST['logo_saviii_dir']) : hsc($arResult['logo_saviii_dir']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Логотип Магазину (адмінка):<span class="accent">*</span></div>
        <input <?=(isset($check['brandPhoto_dir'])? $check['brandPhoto_dir'] : '')?> type="text" name="brandPhoto_dir" value="<?=(isset($error)? hsc($_POST['brandPhoto_dir']) : hsc($arResult['brandPhoto_dir']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Головний баннер:<span class="accent">*</span></div>
        <input <?=(isset($check['banner_dir'])? $check['banner_dir'] : '')?> type="text" name="banner_dir" value="<?=(isset($error)? hsc($_POST['banner_dir']) : hsc($arResult['banner_dir']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Продукції:<span class="accent">*</span></div>
        <input <?=(isset($check['products_dir'])? $check['products_dir'] : '')?> type="text" name="products_dir" value="<?=(isset($error)? hsc($_POST['products_dir']) : hsc($arResult['products_dir']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Аватар користувача:<span class="accent">*</span></div>
        <input <?=(isset($check['user_avatar_dir'])? $check['user_avatar_dir'] : '')?> type="text" name="user_avatar_dir" value="<?=(isset($error)? hsc($_POST['user_avatar_dir']) : hsc($arResult['user_avatar_dir']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">RDFa:<span class="accent">*</span></div>
        <input <?=(isset($check['rdfa_dir'])? $check['rdfa_dir'] : '')?> type="text" name="rdfa_dir" value="<?=(isset($error)? hsc($_POST['rdfa_dir']) : hsc($arResult['rdfa_dir']))?>">
      </div>
    </div>

    <div class="tabs">

      <div class="input-value">
        <div class="name-section"><span class="pop-info">i</span>Режим виведення помилок:
          <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
        </div>
        <div class="right-position">
          <?php foreach((isset($error)? $_POST['list_error_reporting'] : explode(',', $arResult['list_error_reporting'])) as $k => $v){ ?>
            <input type="text" name="list_error_reporting[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
          <?php } ?>
          <div class="add-el-list" data-name="list_error_reporting[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
        </div>
      </div>

      <div class="input-value">
        <div class="name-section"><span class="pop-info">i</span>Логічне так або ні:
          <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
        </div>
        <div class="right-position">
          <?php foreach((isset($error)? $_POST['list_logic'] : explode(',', $arResult['list_logic'])) as $k => $v){ ?>
            <input type="text" name="list_logic[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
          <?php } ?>
          <div class="add-el-list" data-name="list_logic[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
        </div>
      </div>

      <div class="input-value">
        <div class="name-section"><span class="pop-info">i</span>Стан елемента:
          <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
        </div>
        <div class="right-position">
          <?php foreach((isset($error)? $_POST['list_active'] : explode(',', $arResult['list_active'])) as $k => $v){ ?>
            <input type="text" name="list_active[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
          <?php } ?>
          <div class="add-el-list" data-name="list_active[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
        </div>
      </div>

      <div class="input-value">
        <div class="name-section"><span class="pop-info">i</span>Вибір мови для панелі:
          <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
        </div>
        <div class="right-position">
          <?php foreach((isset($error)? $_POST['list_length_admin'] : explode(',', $arResult['list_length_admin'])) as $k => $v){ ?>
            <input type="text" name="list_length_admin[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
          <?php } ?>
          <div class="add-el-list" data-name="list_length_admin[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
        </div>
      </div>

      <div class="input-value">
        <div class="name-section"><span class="pop-info">i</span>Вибір статі:
          <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
        </div>
        <div class="right-position">
          <?php foreach((isset($error)? $_POST['list_male_admin'] : explode(',', $arResult['list_male_admin'])) as $k => $v){ ?>
            <input type="text" name="list_male_admin[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
          <?php } ?>
          <div class="add-el-list" data-name="list_male_admin[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
        </div>
      </div>

    </div>

    <input type="submit" value="Зберегти" name="ok">
  </form>
</div>