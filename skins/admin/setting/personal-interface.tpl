<div class="section-interface-k2">
  <div class="line-custom-edit">
    <p class="header-name-edit">Персональні настройки адміністрування</p>
  </div>
  <!-- Menu tabs --->
  <ul class="tabs-panel">
    <li class="active-tab">Настройки</li>
  </ul>
  <form class="content-form" action="" method="post">
    <!-- Element tabs -->
    <div class="tabs active-block-tabs">
      <div class="header-line">Про систему</div>

      <div class="input-value">
        <div class="name-section">Система розроблена:</div>
        <textarea name="system_create"><?=((isset($error))? hsc($_POST['system_create']) : hsc($arResult['system_create']))?></textarea>
      </div>

      <div class="input-value">
        <div class="name-section">Версія PHP:</div>
        <input type="text" name="version_php" value="<?=(isset($error)? hsc($_POST['version_php']) : hsc($arResult['version_php']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Веб-сервер:</div>
        <input type="text" name="web_server" value="<?=(isset($error)? hsc($_POST['web_server']) : hsc($arResult['web_server']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Версія ядра:</div>
        <input type="text" name="version_core" value="<?=(isset($error)? hsc($_POST['version_core']) : hsc($arResult['version_core']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Адреса сайта:</div>
        <input type="text" name="address_site" value="<?=(isset($error)? hsc($_POST['address_site']) : hsc($arResult['address_site']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Сайт розроблений:</div>
        <input type="text" name="site_create" value="<?=(isset($error)? hsc($_POST['site_create']) : hsc($arResult['site_create']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Відповідальне лице:</div>
        <input type="text" name="responsible_face" value="<?=(isset($error)? hsc($_POST['responsible_face']) : hsc($arResult['responsible_face']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Підтримка SЕО:</div>
        <select name="support_seo">
          <?php foreach(explode(',', $adminParam['list_logic']) as $k => $v){ ?>
            <option value="<?=$k;?>" <?=(((isset($error) && $_POST['support_seo'] == $k) || ((int)$arResult['support_seo'] == $k && !isset($error)))? 'selected' : "")?>>
              <?=$v;?>
            </option>
          <?php } ?>
        </select>
      </div>

      <div class="input-value">
        <div class="name-section">Підтримка магазину:</div>
        <select name="support_shop">
          <?php foreach(explode(',', $adminParam['list_logic']) as $k => $v){ ?>
            <option value="<?=$k;?>" <?=(((isset($error) && $_POST['support_shop'] == $k) || ((int)$arResult['support_shop'] == $k && !isset($error)))? 'selected' : "")?>>
              <?=$v;?>
            </option>
          <?php } ?>
        </select>
      </div>

      <div class="input-value">
        <div class="name-section">Щомісячна плата:</div>
        <input type="text" name="monthly_fee" value="<?=(isset($error)? hsc($_POST['monthly_fee']) : hsc($arResult['monthly_fee']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Телефон:</div>
        <input type="text" name="phone" value="<?=(isset($error)? hsc($_POST['phone']) : hsc($arResult['phone']))?>">
      </div>

      <div class="input-value">
        <div class="name-section">Email:</div>
        <input type="text" name="email" value="<?=(isset($error)? hsc($_POST['email']) : hsc($arResult['email']))?>">
      </div>

      <div class="header-line">Адміністративна панель</div>

      <div class="input-value">
        <div class="name-section">Структура "MVC":</div>
        <textarea name="admin_panel"><?=((isset($error))? hsc($_POST['admin_panel']) : hsc($arResult['admin_panel']))?></textarea>
      </div>

      <div class="input-value upload_file" id="cAnonsPhoto" data-size="<?=$adminParam['logo_saviii_size']?>">
        <div class="name-section">Логотип "MVC":<span class="accent">*</span></div>

        <button class="icon-link <?=(isset($check['logo_system'])? $check['logo_system'] : '')?>" type="button" onclick="getInfoFile(this, '<?=$adminParam['logo_saviii_dir']?>')"><?=((isset($error))? (!empty($logo_system[0])? hsc($logo_system[0]) : "Вибрати файл") : ((empty($arResult['logo_system']))? ((isset($_POST['logo_system']))? '' : 'Вибрати файл') : hsc($arResult['logo_system'])))?>
        </button>

        <input name="logo_system" type="hidden" value="<?=((isset($error))? hsc($_POST['logo_system']) : hsc($arResult['logo_system']))?>">

        <input name="del[logo_system]" type="hidden" value="<?=((isset($error, $_POST['del']['logo_system']))? hsc($_POST['del']['logo_system']) : hsc($arResult['logo_system']))?>">

        <div class="photos <?=((!empty($_POST['logo_system']))? '' : ((!empty($arResult['logo_system']))? '' : "hidden"))?>">
          <img src="<?=((isset($_POST['logo_system']))? hsc($logo_system[0]) : hsc($arResult['logo_system']))?>">
        </div>
      </div>

      <div class="header-line">Про магазин</div>

      <div class="input-value">
        <div class="name-section">Марка магазину:</div>
        <input type="text" name="brand" value="<?=(isset($error)? hsc($_POST['brand']) : hsc($arResult['brand']))?>">
      </div>

      <div class="input-value upload_file" id="brandPhoto" data-size="<?=$adminParam['brand_size']?>">
        <div class="name-section">Логотип магазину:<span class="accent">*</span></div>

        <button class="icon-link <?=(isset($check['brandPhoto'])? $check['brandPhoto'] : '')?>" type="button" onclick="getInfoFile(this, '<?=$adminParam['logo_saviii_dir']?>')"><?=((isset($error))? (!empty($brandPhoto[0])? hsc($brandPhoto[0]) : "Вибрати файл") : ((empty($arResult['brandPhoto']))? ((isset($_POST['brandPhoto']))? '' : 'Вибрати файл') : hsc($arResult['brandPhoto'])))?>
        </button>

        <input name="brandPhoto" type="hidden" value="<?=((isset($error))? hsc($_POST['brandPhoto']) : hsc($arResult['brandPhoto']))?>">

        <input name="del[brandPhoto]" type="hidden" value="<?=((isset($error, $_POST['del']['brandPhoto']))? hsc($_POST['del']['brandPhoto']) : hsc($arResult['brandPhoto']))?>">

        <div class="photos <?=((!empty($_POST['brandPhoto']))? '' : ((!empty($arResult['brandPhoto']))? '' : "hidden"))?>">
          <img src="<?=((isset($_POST['brandPhoto']))? hsc($brandPhoto[0]) : hsc($arResult['brandPhoto']))?>">
        </div>
      </div>

    </div>
    <input type="submit" value="Зберегти" name="ok">
  </form>

  <form id="to_file">
    <input id="control" type="file" name="photo" onchange="addPhoto(this)" data-size="" data-set="" data-dir="">
  </form>
</div>