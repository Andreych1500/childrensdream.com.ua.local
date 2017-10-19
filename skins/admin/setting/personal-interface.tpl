<div class="section-interface-k2">
  <div class="line-custom-edit">
    <p class="header-name-edit"><?=$mess['Персональні настройки адміністрування']?></p>
  </div>

  <!-- Menu tabs --->
  <ul class="tabs-panel">
    <li class="active-tab"><?=$messG['Настройки']?></li>
  </ul>

  <form class="content-form" action="" method="post">

    <!-- Element tabs -->
    <div class="tabs active-block-tabs">
      <div class="header-line"><?=$mess['Про систему']?></div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Версія PHP']?>:</div>
        <input type="text" name="version_php" value="<?=(isset($error)? hsc($_POST['version_php']) : $arResult['version_php'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Веб-сервер']?>:</div>
        <input type="text" name="web_server" value="<?=(isset($error)? hsc($_POST['web_server']) : $arResult['web_server'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Версія ядра']?>:</div>
        <input type="text" name="version_core" value="<?=(isset($error)? hsc($_POST['version_core']) : $arResult['version_core'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Адреса сайта']?>:</div>
        <input type="text" name="address_site" value="<?=(isset($error)? hsc($_POST['address_site']) : $arResult['address_site'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Сайт розроблений']?>:</div>
        <input type="text" name="site_create" value="<?=(isset($error)? hsc($_POST['site_create']) : $arResult['site_create'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Відповідальне лице']?>:</div>
        <input type="text" name="responsible_face" value="<?=(isset($error)? hsc($_POST['responsible_face']) : $arResult['responsible_face'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Підтримка SЕО']?>:</div>
        <select name="support_seo">
          <?php foreach(Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']] as $k => $v){ ?>
            <option value="<?=$k;?>" <?=(((isset($error) && $_POST['support_seo'] == $k) || ((int)$arResult['support_seo'] == $k && !isset($error)))? 'selected' : "")?>>
              <?=$v;?>
            </option>
          <?php } ?>
        </select>
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Підтримка магазину']?>:</div>
        <select name="support_shop">
          <?php foreach(Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']] as $k => $v){ ?>
            <option value="<?=$k;?>" <?=(((isset($error) && $_POST['support_shop'] == $k) || ((int)$arResult['support_shop'] == $k && !isset($error)))? 'selected' : "")?>>
              <?=$v;?>
            </option>
          <?php } ?>
        </select>
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Щомісячна плата']?>:</div>
        <input type="text" name="monthly_fee" value="<?=(isset($error)? hsc($_POST['monthly_fee']) : $arResult['monthly_fee'])?>">
      </div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Телефон']?>:</div>
        <input type="text" name="phone" value="<?=(isset($error)? hsc($_POST['phone']) : $arResult['phone'])?>">
      </div>

      <div class="input-value">
        <div class="name-section">Email:</div>
        <input type="text" name="email" value="<?=(isset($error)? hsc($_POST['email']) : $arResult['email'])?>">
      </div>

      <div class="header-line"><?=$mess['Адміністративна панель']?></div>


      <div class="input-value">
        <div class="name-section"><?=$mess['Блок магазину']?>:</div>
        <input type="checkbox" <?=((isset($error, $_POST['active_shop']) || ($arResult['active_shop'] == 1 && !isset($error)))? "checked" : "")?> name="active_shop" value="1">
      </div>

      <div class="input-value upload_file" id="logo_system" data-size="<?=$adminParam['logo_saviii_size']?>">
        <div class="name-section"><?=$mess['Логотип \'MVC\'']?>:<span class="accent">*</span></div>
        <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['logo_saviii_dir']?>')"><?=((isset($error))? (!empty($_POST['logo_system'])? hsc($_POST['logo_system']) : $messG['Вибрати файл']) : (!empty($arResult['logo_system'])? $arResult['logo_system'] : $messG['Вибрати файл']))?>
        </button>
        <input name="logo_system" type="hidden" value="<?=(isset($_POST['logo_system'])? hsc($_POST['logo_system']) : $arResult['logo_system'])?>">
        <input name="del[logo_system]" type="hidden" value="<?=(isset($_POST['del']['logo_system'])? hsc($_POST['del']['logo_system']) : $arResult['logo_system'])?>">
        <div class="photos <?=((isset($_POST['logo_system']))? '' : ((!empty($arResult['logo_system']))? '' : "hidden"))?>">
          <img src="<?=(isset($_POST['logo_system'])? hsc($_POST['logo_system']) : $arResult['logo_system'])?>">
        </div>
      </div>

      <div class="header-line"><?=$mess['Про магазин']?></div>

      <div class="input-value">
        <div class="name-section"><?=$mess['Марка магазину']?>:</div>
        <input type="text" name="brand" value="<?=(isset($error)? hsc($_POST['brand']) : $arResult['brand'])?>">
      </div>

      <div class="input-value upload_file" id="brandPhoto" data-size="<?=$adminParam['brand_size']?>">
        <div class="name-section"><?=$mess['Логотип магазину']?>:<span class="accent">*</span></div>
        <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['brandPhoto_dir']?>')"><?=((isset($error))? (!empty($_POST['brandPhoto'])? hsc($_POST['brandPhoto']) : $messG['Вибрати файл']) : (!empty($arResult['brandPhoto'])? $arResult['brandPhoto'] : $messG['Вибрати файл']))?>
        </button>
        <input name="brandPhoto" type="hidden" value="<?=(isset($_POST['brandPhoto'])? hsc($_POST['brandPhoto']) : $arResult['brandPhoto'])?>">
        <input name="del[brandPhoto]" type="hidden" value="<?=(isset($_POST['del']['brandPhoto'])? hsc($_POST['del']['brandPhoto']) : $arResult['brandPhoto'])?>">
        <div class="photos <?=((isset($_POST['brandPhoto']))? '' : ((!empty($arResult['brandPhoto']))? '' : "hidden"))?>">
          <img src="<?=(isset($_POST['brandPhoto'])? hsc($_POST['brandPhoto']) : $arResult['brandPhoto'])?>">
        </div>
      </div>

    </div>
    <input type="submit" value="<?=$messG['Зберегти']?>" name="ok">
  </form>

  <form id="to_file">
    <input id="control" type="file" name="photo" onchange="addPhoto(this)" data-size="" data-set="" data-dir="">
  </form>
</div>