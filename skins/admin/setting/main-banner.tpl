<?php if(isset($_REQUEST['add'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Створити елемент']?></p>
      <a class="back-url" href="/admin/setting/main-banner/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="input-value">
          <div class="name-section"><?=$mess['Назва']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['name'])? $check['name'] : '')?> type="text" name="name" value="<?=(isset($error)? hsc($_POST['name']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$messG['Сортування']?>:</div>
          <input type="number" step="1" min="1" name="sort" value="<?=((isset($error))? hsc($_POST['sort']) : "100")?>">
        </div>

        <div class="header-line"><?=$messG['Увага!']?></div>
      </div>

      <input type="submit" value="<?=$messG['Створити']?>" name="ok">
    </form>
  </div>
<?php } elseif(isset($_REQUEST['edit'])) { ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Редагування елемента']?></p>
      <a class="back-url" href="/admin/setting/main-banner/"><?=$messG['Назад']?></a>
    </div>
    
    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
      <li>SEO</li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="input-value">
          <div class="name-section"><?=$messG['Активність']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['active']) || ($arResult['active'] == 1 && !isset($error)))? "checked" : "")?> name="active" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Назва']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['name'])? $check['name'] : '')?> type="text" name="name" value="<?=(isset($error)? hsc($_POST['name']) : $arResult['name'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$messG['Сортування']?>:</div>
          <input type="number" step="1" min="1" name="sort" value="<?=((isset($error))? hsc($_POST['sort']) : hsc($arResult['sort']))?>">
        </div>

        <div class="header-line"><?=$mess['Зображення для баннера']?></div>

        <div class="input-value upload_file" id="img_ua" data-size="<?=$adminParam['banner_size']?>">
          <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['banner_dir']?>')"><?=((isset($error))? (!empty($_POST['img_circle'])? hsc($_POST['img_circle']) : $messG['Вибрати файл']) : (!empty($arResult['img_ua'])? hsc($arResult['img_ua']) : $messG['Вибрати файл']))?>
          </button>
          <input name="img_ua" type="hidden" value="<?=(isset($_POST['img_ua'])? hsc($_POST['img_ua']) : hsc($arResult['img_ua']))?>">
          <input name="del[img_ua]" type="hidden" value="<?=(isset($_POST['del']['img_ua'])? hsc($_POST['del']['img_ua']) : hsc($arResult['img_ua']))?>">
          <div class="photos <?=((isset($_POST['img_ua']))? '' : ((!empty($arResult['img_ua']))? '' : "hidden"))?>">
            <img src="<?=(isset($_POST['img_ua'])? hsc($_POST['img_ua']) : hsc($arResult['img_ua']))?>">
          </div>
        </div>

        <div class="input-value upload_file" id="img_ru" data-size="<?=$adminParam['banner_size']?>">
          <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['banner_dir']?>')"><?=((isset($error))? (!empty($_POST['img_ru'])? hsc($_POST['img_ru']) : $messG['Вибрати файл']) : (!empty($arResult['img_ru'])? hsc($arResult['img_ru']) : $messG['Вибрати файл']))?>
          </button>
          <input name="img_ru" type="hidden" value="<?=(isset($_POST['img_ru'])? hsc($_POST['img_ru']) : hsc($arResult['img_ru']))?>">
          <input name="del[img_ru]" type="hidden" value="<?=(isset($_POST['del']['img_ru'])? hsc($_POST['del']['img_ru']) : hsc($arResult['img_ru']))?>">
          <div class="photos <?=((isset($_POST['img_ru']))? '' : ((!empty($arResult['img_ru']))? '' : "hidden"))?>">
            <img src="<?=(isset($_POST['img_ru'])? hsc($_POST['img_ru']) : hsc($arResult['img_ru']))?>">
          </div>
        </div>
      </div>

      <div class="tabs">
        <div class="header-line"><?=$mess['Настройки для картинок eлементів UA']?></div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Шаблон ALT']?>:</div>
          <input type="text" name="img_seo_alt_ua" value="<?=(isset($error)? hsc($_POST['img_seo_alt_ua']) : $arResult['img_seo_alt_ua'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Шаблон TITLE']?>:</div>
          <input type="text" name="img_seo_title_ua" value="<?=(isset($error)? hsc($_POST['img_seo_title_ua']) : $arResult['img_seo_title_ua'])?>">
        </div>

        <div class="header-line"><?=$mess['Настройки для картинок eлементів RU']?></div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Шаблон ALT']?>:</div>
          <input type="text" name="img_seo_alt_ru" value="<?=(isset($error)? hsc($_POST['img_seo_alt_ru']) : $arResult['img_seo_alt_ru'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Шаблон TITLE']?>:</div>
          <input type="text" name="img_seo_title_ru" value="<?=(isset($error)? hsc($_POST['img_seo_title_ru']) : $arResult['img_seo_title_ru'])?>">
        </div>
      </div>

      <input type="submit" value="<?=$messG['Зберегти']?>" name="ok">
    </form>

    <form id="to_file">
      <input id="control" type="file" name="photo" onchange="addPhoto(this)" data-size="" data-set="" data-dir="">
    </form>
  </div>
<?php } else { ?>
  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name"><?=$mess['Головний баннер']?></p>
    </div>

    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom-next">
        <a href="/admin/setting/main-banner/?add=ok" class="add-el icon-plus"><?=$messG['Створити елемент']?></a>
        <input type="submit" value="<?=$messG['Активувати']?>" name="activate" class="option-el">
        <input type="submit" value="<?=$messG['Деактивувати']?>" name="deactivate" class="option-el">
        <input type="submit" value="<?=$messG['Видалити']?>" name="delete" class="option-el">
        <div class="dynamicEdit" data-submit-lang="<?=$messG['Зберегти'].'|'.$messG['Відмінити']?>"></div>
      </div>

      <table class="illustration-table">
        <tr>
          <td><input type="checkbox" name="all_cheked"></td>
          <td></td>
          <td>ID</td>
          <td><?=$messG['Активність']?></td>
          <td><?=$mess['Назва']?></td>
          <td><?=$messG['Сортування']?></td>
          <td><?=$mess['Зображення']?></td>
          <td><?=$messG['Час оновлення']?></td>
          <td><?=$messG['Ким оновлений']?></td>
        </tr>

        <?php if($main_banner['result_DB']->num_rows > 0){
          while($arResult = hsc($main_banner['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/setting/main-banner/?edit=<?=$arResult['id']?>"><?=$messG['Редагувати']?></a>
                  <a href="/admin/setting/main-banner/?del=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
                </div>
              </td>
              <td><?=(int)$arResult['id']?></td>
              <td data-input="ex|checkbox|arr[<?=$arResult['id']?>][active]"><?=Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']][$arResult['active']]?>
              </td>
              <td data-input="ex|text|arr[<?=$arResult['id']?>][name]"><?=$arResult['name']?></td>
              <td data-input="ex|number|arr[<?=$arResult['id']?>][sort]"><?=$arResult['sort']?></td>
              <td>
                <?php if(!empty($arResult['img_ua'])){ ?>
                  <div class="panel-photo">
                    <img src="<?=$arResult['img_ua']?>" alt="<?=$arResult['img_alt_ua']?>">
                  </div>
                <?php } ?>
              </td>
              <td><?=$arResult['data_custom']?></td>
              <td><?=$arResult['user_custom']?></td>
            </tr>
          <?php }
        } else { ?>
          <tr>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
          </tr>
        <?php } ?>
      </table>
    </form>
    <div class="bottom-table">
      <?=$main_banner['pagination']?>
    </div>
  </div>
<?php } ?>