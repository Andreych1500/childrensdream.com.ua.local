<?php if(isset($_REQUEST['add'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Створити елемент']?></p>
      <a class="back-url" href="/admin/setting/policy-certification/"><?=$messG['Назад']?></a>
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

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span><?=$messG['Мови']?>:
            <div class="pop-window"><?=$messG['Видалити пункт']?></div>
          </div>
          <div class="right-position">
            <?php foreach((isset($error)? $_POST['list_length'] : explode(',', 'ua')) as $k => $v){ ?>
              <input type="text" name="list_length[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="list_length[]" data-type="text" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
          </div>
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
      <a class="back-url" href="/admin/setting/policy-certification/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
      <li><?=$messG['Фото']?></li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="input-value">
          <div class="name-section"><?=$mess['Активність']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['active']) || ($arResult['active'] == 1 && !isset($error)))? "checked" : "")?> name="active" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Назва']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['name'])? $check['name'] : '')?> type="text" name="name" value="<?=(isset($error)? hsc($_POST['name']) : hsc($arResult['name']))?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$messG['Сортування']?>:</div>
          <input type="number" step="1" min="1" name="sort" value="<?=((isset($error))? hsc($_POST['sort']) : hsc($arResult['sort']))?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span><?=$messG['Мови']?>:
            <div class="pop-window"><?=$messG['Видалити пункт']?></div>
          </div>
          <div class="right-position">
            <?php foreach((isset($error)? $_POST['list_length'] : explode(',', $arResult['list_length'])) as $k => $v){ ?>
              <input type="text" name="list_length[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="list_length[]" data-type="text" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
          </div>
        </div>

        <div class="header-line"><?=$mess['Додаткові налаштування']?></div>
        <?php $list = (isset($error)? $_POST['list_length'] : explode(',', $arResult['list_length'])) ?>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Title img:<span class="accent">*</span>
            <div class="pop-window"><?=$messG['Видалити пункт']?></div>
          </div>

          <div class="right-position">
            <?php foreach($list as $k => $v){ ?>
              <input <?=(isset($check['list_title'])? $check['list_title'] : '')?> type="text" name="list_title[<?=$k?>]" value="<?=(isset($error))? (empty($_POST['list_title'][$k])? $v : $_POST['list_title'][$k]) : (!isset($arResult['list_title'][$k])? $v : explode('#|#', $arResult['list_title'])[$k])?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="list_title[]" data-type="text" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
          </div>
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Alt img:<span class="accent">*</span>
            <div class="pop-window"><?=$messG['Видалити пункт']?></div>
          </div>
          <div class="right-position">
            <?php foreach($list as $k => $v){ ?>
              <input <?=(isset($check['list_alt'])? $check['list_alt'] : '')?> type="text" name="list_alt[<?=$k?>]" value="<?=(isset($error))? (empty($_POST['list_alt'][$k])? $v : $_POST['list_alt'][$k]) : (!isset($arResult['list_alt'][$k])? $v : explode('#|#', $arResult['list_alt'])[$k])?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="list_alt[]" data-type="text" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
          </div>
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span><?=$mess['Текст']?>:<span class="accent">*</span>
            <div class="pop-window"><?=$messG['Видалити пункт']?></div>
          </div>

          <div class="right-position redactor">
            <?php foreach($list as $k => $v){ ?>
              <textarea <?=(isset($check['text'])? $check['text'] : '')?> name="text[<?=$k?>]" onkeyup="deleteList(this)"><?=(isset($error))? (empty($_POST['text'][$k])? $v : $_POST['text'][$k]) : (!isset($arResult['text'][$k])? $v : explode('#|#', $arResult['text'])[$k])?></textarea>
            <?php } ?>
            <div class="add-el-list" data-name="text[]" data-type="textarea" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
          </div>
        </div>
      </div>

      <div class="tabs">
        <div class="header-line"><?=$mess['Сертифікати магазину']?></div>

        <div class="input-value upload_file" id="img_certification" data-size="<?=$adminParam['certification_size']?>">
          <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['certification_dir']?>')"><?=((isset($error))? (!empty($_POST['img_certification'])? hsc($_POST['img_certification']) : 'Вибрати файл') : (!empty($arResult['img_certification'])? hsc($arResult['img_certification']) : 'Вибрати файл'))?>
          </button>
          <input name="img_certification" type="hidden" value="<?=(isset($_POST['img_certification'])? hsc($_POST['img_certification']) : hsc($arResult['img_certification']))?>">
          <input name="del[img_certification]" type="hidden" value="<?=(isset($_POST['del']['img_certification'])? hsc($_POST['del']['img_certification']) : hsc($arResult['img_certification']))?>">
          <div class="photos <?=((isset($_POST['img_certification']))? '' : ((!empty($arResult['img_certification']))? '' : "hidden"))?>">
            <img src="<?=(isset($_POST['img_certification'])? hsc($_POST['img_certification']) : hsc($arResult['img_certification']))?>">
          </div>
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
      <p class="header-name"><?=$mess['Список сертифікатів']?></p>
    </div>

    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom-next">
        <a href="/admin/setting/policy-certification/?add=ok" class="add-el icon-plus"><?=$messG['Створити елемент']?></a>
        <input type="submit" value="<?=$messG['Активувати']?>" name="activate" class="option-el">
        <input type="submit" value="<?=$messG['Деактивувати']?>" name="deactivate" class="option-el">
        <input type="submit" value="<?=$messG['Видалити']?>" name="delete" class="option-el">
        <div class="dynamicEdit" data-submit-lang="<?=$messG['Зберегти']?>|<?=$messG['Відмінити']?>"></div>
      </div>

      <table class="illustration-table">
        <tr>
          <td><input type="checkbox" name="all_cheked"></td>
          <td></td>
          <td>ID</td>
          <td><?=$messG['Активність']?></td>
          <td><?=$mess['Назва']?></td>
          <td><?=$messG['Сортування']?></td>
          <td><?=$messG['Час оновлення']?></td>
          <td><?=$messG['Ким оновлений']?></td>
        </tr>
        <?php if($certification['result_DB']->num_rows > 0){
          while($arResult = hsc($certification['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/setting/policy-certification/?edit=<?=$arResult['id']?>"><?=$messG['Редагувати']?></a>
                  <a href="/admin/setting/policy-certification/?del=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
                </div>
              </td>
              <td><?=(int)$arResult['id']?></td>
              <td data-input="ex|checkbox|arr[<?=$arResult['id']?>][active]"><?=Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']][$arResult['active']]?>
              </td>
              <td data-input="ex|text|arr[<?=$arResult['id']?>][name]"><?=$arResult['name']?></td>
              <td data-input="ex|number|arr[<?=$arResult['id']?>][sort]"><?=$arResult['sort']?></td>
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
      <?=$certification['pagination']?>
    </div>
  </div>
<?php } ?>