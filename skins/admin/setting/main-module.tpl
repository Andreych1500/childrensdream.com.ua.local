<div class="section-interface-k2">
  <div class="line-custom-edit">
    <p class="header-name-edit">Головний модуль</p>
  </div>
  <!-- Menu tabs --->
  <ul class="tabs-panel">
    <li class="active-tab">Настройки</li>
  </ul>
  <form class="content-form" action="" method="post">
    <!-- Element tabs -->
    <div class="tabs active-block-tabs">

      <div class="input-value">
        <div class="name-section">Email відправки листів:<span class="accent">*</span></div>
        <input <?=(isset($check['from_email'])? $check['from_email'] : '')?> type="text" name="from_email" value="<?=(isset($error)? hsc($_POST['from_email']) : hsc($arResult['from_email']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Виведення помилок (error_reporting):</div>
        <select name="error_reporting">
          <?php foreach(explode(',', $adminParam['list_error_reporting']) as $k => $v){ ?>
            <option value="<?=$k;?>" <?=(((isset($error) && $_POST['error_reporting'] == $k) || ((int)$arResult['error_reporting'] == $k && !isset($error)))? 'selected' : "")?>>
              <?=$v;?>
            </option>
          <?php } ?>
        </select>
      </div>

      <div class="input-value">
        <div class="name-section">Дата створення сайту:<span class="accent">*</span></div>
        <input <?=(isset($check['site_data_create'])? $check['site_data_create'] : '')?> type="number" name="site_data_create" value="<?=(isset($error)? hsc($_POST['site_data_create']) : hsc($arResult['site_data_create']))?>" min="2000">
      </div>

      <div class="input-value">
        <div class="name-section">Url сайту без http:<span class="accent">*</span></div>
        <input <?=(isset($check['url_site'])? $check['url_site'] : '')?> type="text" name="url_site" value="<?=(isset($error)? hsc($_POST['url_site']) : hsc($arResult['url_site']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Url сайту з http:<span class="accent">*</span></div>
        <input <?=(isset($check['url_http_site'])? $check['url_http_site'] : '')?> type="text" name="url_http_site" value="<?=(isset($error)? hsc($_POST['url_http_site']) : hsc($arResult['url_http_site']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Мова у адміністративній панелі:</div>
        <select name="length_admin">
          <?php foreach(explode(',', $adminParam['list_length_admin']) as $k => $v){ ?>
            <option value="<?=$v;?>" <?=(((isset($error) && $_POST['length_admin'] == $v) || ($arResult['length_admin'] == $v && !isset($error)))? 'selected' : "")?>>
              <?=$v;?>
            </option>
          <?php } ?>
        </select>
      </div>

      <div class="technik-off-onn">
        Тимчасове закриття публічної частини сайту:
        <div class="procedure-section">
          <?php if($arResult['access_publick_page']){ ?>
            <p class="color-green">Доступ до публічної частини відкритий</p>
            <a href="/admin/setting/main-module/?access_publick_page=0">Закрити доступ</a>
          <?php } else { ?>
            <p class="color-red">Доступ до публічної частини закритий</p>
            <a href="/admin/setting/main-module/?access_publick_page=1">Відкрити доступ</a>
          <?php } ?>
        </div>
      </div>

    </div>
    <input type="submit" value="Зберегти" name="ok">
  </form>
</div>