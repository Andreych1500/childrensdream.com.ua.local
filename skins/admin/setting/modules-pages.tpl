<?php if(isset($_REQUEST['add'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Створити елемент']?></p>
      <a class="back-url" href="/admin/setting/modules-pages/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="input-value">
          <div class="name-section"><?=$mess['Активність']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['active']))? "checked" : "")?> name="active" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Модуль']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['module'])? $check['module'] : '')?> type="text" name="module" value="<?=(isset($error)? hsc($_POST['module']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Детальні сторінки']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['detail_page']))? "checked" : "")?> name="detail_page" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Динамічна сторінка']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['dinamic_page']))? "checked" : "")?> name="dinamic_page" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span><?=$messG['Мови']?>:
            <div class="pop-window"><?=$messG['Видалити пункт']?>:</div>
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
      <a class="back-url" href="/admin/setting/modules-pages/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">

        <div class="input-value">
          <div class="name-section"><?=$mess['Активність']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['active']) || ($arResult['active'] == 1 && !isset($error)))? "checked" : "")?> name="active" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Модуль']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['module'])? $check['module'] : '')?> type="text" name="module" value="<?=(isset($error)? hsc($_POST['module']) : $arResult['module'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Детальні сторінки']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['detail_page']) || ($arResult['detail_page'] == 1 && !isset($error)))? "checked" : "")?> name="detail_page" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Динамічна сторінка']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['dinamic_page']) || ($arResult['dinamic_page'] == 1 && !isset($error)))? "checked" : "")?> name="dinamic_page" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span><?=$messG['Мови']?>:
            <div class="pop-window"><?=$messG['Видалити пункт']?>:</div>
          </div>
          <div class="right-position">
            <?php foreach((isset($error)? $_POST['list_length'] : explode(',', $arResult['list_length'])) as $k => $v){ ?>
              <input type="text" name="list_length[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="list_length[]" data-type="text" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
          </div>
        </div>

        <div class="header-line"><?=$mess['Настройки модуля']?></div>
        <?php $list = (isset($error)? $_POST['list_length'] : explode(',', $arResult['list_length'])) ?>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Meta title:<span class="accent">*</span>
            <div class="pop-window"><?=$messG['Видалити пункт']?>:</div>
          </div>

          <div class="right-position">
            <?php foreach($list as $k => $v){ ?>
              <input <?=(isset($check['meta_title'])? $check['meta_title'] : '')?> type="text" name="meta_title[<?=$k?>]" value="<?=(isset($error))? (empty($_POST['meta_title'][$k])? $v : $_POST['meta_title'][$k]) : (!isset($arResult['meta_title'][$k])? $v : explode('#|#', $arResult['meta_title'])[$k])?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="meta_title[]" data-type="text" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
          </div>
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Meta keywords:<span class="accent">*</span>
            <div class="pop-window"><?=$messG['Видалити пункт']?>:</div>
          </div>

          <div class="right-position redactor">
            <?php foreach($list as $k => $v){ ?>
              <textarea <?=(isset($check['meta_keywords'])? $check['meta_keywords'] : '')?> name="meta_keywords[<?=$k?>]" onkeyup="deleteList(this)"><?=(isset($error))? (empty($_POST['meta_keywords'][$k])? $v : $_POST['meta_keywords'][$k]) : (!isset($arResult['meta_keywords'][$k])? $v : explode('#|#', $arResult['meta_keywords'])[$k])?></textarea>
            <?php } ?>
            <div class="add-el-list" data-name="meta_keywords[]" data-type="textarea" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
          </div>
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Meta description:<span class="accent">*</span>
            <div class="pop-window"><?=$messG['Видалити пункт']?>:</div>
          </div>

          <div class="right-position redactor">
            <?php foreach($list as $k => $v){ ?>
              <textarea <?=(isset($check['meta_description'])? $check['meta_description'] : '')?> name="meta_description[<?=$k?>]" onkeyup="deleteList(this)"><?=(isset($error))? (empty($_POST['meta_description'][$k])? $v : $_POST['meta_description'][$k]) : (!isset($arResult['meta_description'][$k])? $v : explode('#|#', $arResult['meta_description'])[$k])?></textarea>
            <?php } ?>
            <div class="add-el-list" data-name="meta_description[]" data-type="textarea" data-attr='onkeyup="deleteList(this)"'><?=$messG['Додати']?></div>
          </div>
        </div>

        <div class="header-line"><?=$mess['Мікророзмітка Open Graph']?></div>

        <div class="input-value">
          <div class="name-section">Open Graph:</div>
          <input type="checkbox" <?=((isset($error, $_POST['open_graph_page']) || ($arResult['open_graph_page'] == 1 && !isset($error)))? "checked" : "")?> name="open_graph_page" value="1">
        </div>

        <div class="input-value">
          <div class="name-section">Og type:</div>
          <input type="text" name="og_type" value="<?=(isset($error)? hsc($_POST['og_type']) : $arResult['og_type'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Og url:
            <div class="pop-window"><?=$messG['Посилання від корня сайту']?></div>
          </div>
          <textarea name="og_url"><?=(isset($error)? hsc($_POST['og_url']) : $arResult['og_url'])?></textarea>
        </div>

        <div class="input-value upload_file" id="og_image" data-size="<?=$adminParam['rdfa_size']?>">
          <div class="name-section">Og Photo:</div>
          <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['rdfa_dir']?>')"><?=((isset($error))? (!empty($og_image[0])? hsc($og_image[0]) : $messG['Вибрати файл']) : ((empty($arResult['og_image']))? ((isset($_POST['og_image']))? '' : $messG['Вибрати файл']) : hsc($arResult['og_image'])))?>
          </button>
          <input name="og_image" type="hidden" value="<?=((isset($error))? hsc($_POST['og_image']) : hsc($arResult['og_image']))?>">
          <input name="del[og_image]" type="hidden" value="<?=((isset($error, $_POST['del']['og_image']))? hsc($_POST['del']['og_image']) : hsc($arResult['og_image']))?>">
          <div class="photos <?=((!empty($_POST['og_image']))? '' : ((!empty($arResult['og_image']))? '' : "hidden"))?>">
            <img src="<?=((isset($_POST['og_image']))? hsc($og_image[0]) : hsc($arResult['og_image']))?>">
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
  <div class="filter">
    <div class="filter-name"><?=$messG['Фільтр']?></div>
    <form action="" method="post">
      <div class="add-field-filter icon-plus"></div>
      <div class="filter-option-list">
        <?php foreach($htmlFilter['filter_option'] as $k => $name){ ?>
          <div class="<?=(isset($_COOKIE['filter']) && in_array($k, (array)json_decode($_COOKIE['filter']))? 'act-option' : '')?>"><?=$name?></div>
        <?php } ?>
      </div>
      <?=$htmlFilter['filter_inputs']?>
      <input type="submit" name="search" value="<?=$messG['Пошук']?>"><a href="/admin/setting/modules-pages/?filterReset=ok"><?=$messG['Відмінити']?></a>
    </form>
  </div>

  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name"><?=$mess['Модулі сайту']?></p>
    </div>

    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom-next">
        <a href="/admin/setting/modules-pages/?add=ok" class="add-el icon-plus"><?=$messG['Створити елемент']?></a>
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
          <td><?=$mess['Модуль']?></td>
          <td><?=$mess['Детальні сторінки']?></td>
          <td><?=$messG['Час оновлення']?></td>
          <td><?=$messG['Ким оновлений']?></td>
        </tr>
        <?php if($module['result_DB']->num_rows > 0){
          while($arResult = hsc($module['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/setting/modules-pages/?edit=<?=$arResult['id']?>"><?=$messG['Редагувати']?></a>
                  <a href="/admin/setting/modules-pages/?del=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
                </div>
              </td>
              <td><?=(int)$arResult['id']?></td>
              <td data-input="ex|checkbox|arr[<?=$arResult['id']?>][active]"><?=Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']][$arResult['active']]?>
              </td>
              <td data-input="ex|text|arr[<?=$arResult['id']?>][module]"><?=$arResult['module']?></td>
              <td><?=Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']][$arResult['detail_page']]?></td>
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
      <?=$module['pagination']?>
    </div>
  </div>
<?php } ?>