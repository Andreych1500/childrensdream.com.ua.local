<?php if(isset($_REQUEST['add'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit">Створення типу шаблону листа</p>
      <a class="back-url" href="/admin/setting/type-mails/">Назад</a>
    </div>
    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab">Настройки</li>
    </ul>
    <form class="content-form" action="" method="post">
      <!-- Element tabs -->
      <div class="tabs active-block-tabs">

        <div class="input-value">
          <div class="name-section">Активність:</div>
          <input type="checkbox" <?=((isset($error, $_POST['active']))? "checked" : "")?> name="active" value="1">
        </div>

        <div class="input-value">
          <div class="name-section">Назва:<span class="accent">*</span></div>
          <input <?=(isset($check['name'])? $check['name'] : '')?> type="text" name="name" value="<?=(isset($error)? hsc($_POST['name']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section">Символьний код:<span class="accent">*</span></div>
          <input <?=(isset($check['symbol_code'])? $check['symbol_code'] : '')?> type="text" name="symbol_code" value="<?=(isset($error)? hsc($_POST['symbol_code']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Прихована копія:
            <div class="pop-window">Приховані копії перечислюємо через <b>кому</b></div>
          </div>
          <input type="text" name="hidden_copy" value="<?=(isset($error)? hsc($_POST['hidden_copy']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Мови:
            <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
          </div>
          <div class="right-position">
            <?php foreach((isset($error)? $_POST['list_length'] : explode(',', 'ua')) as $k => $v){ ?>
              <input type="text" name="list_length[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="list_length[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
          </div>
        </div>

        <div class="header-line">Увага! Основні налаштування листа будуть доступні після створення його у редагувані!</div>

        <input type="submit" value="Зберегти" name="ok">
    </form>
  </div>
<?php } elseif(isset($_REQUEST['edit'])) { ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit">Зміна типу шаблону листа</p>
      <a class="back-url" href="/admin/setting/type-mails/">Назад</a>
    </div>
    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab">Настройки</li>
    </ul>
    <form class="content-form" action="" method="post">
      <!-- Element tabs -->

      <div class="tabs active-block-tabs">

        <div class="input-value">
          <div class="name-section">Активність:</div>
          <input type="checkbox" <?=((isset($error, $_POST['active']) || ($arResult['active'] == 1 && !isset($error)))? "checked" : "")?> name="active" value="1">
        </div>

        <div class="input-value">
          <div class="name-section">Назва:<span class="accent">*</span></div>
          <input <?=(isset($check['name'])? $check['name'] : '')?> type="text" name="name" value="<?=(isset($error)? hsc($_POST['name']) : hsc($arResult['name']))?>">
        </div>

        <div class="input-value">
          <div class="name-section">Символьний код:<span class="accent">*</span></div>
          <input <?=(isset($check['symbol_code'])? $check['symbol_code'] : '')?> type="text" name="symbol_code" value="<?=(isset($error)? hsc($_POST['symbol_code']) : hsc($arResult['symbol_code']))?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Прихована копія:
            <div class="pop-window">Приховані копії перечислюємо через <b>кому</b></div>
          </div>
          <input type="text" name="hidden_copy" value="<?=(isset($error)? hsc($_POST['hidden_copy']) : hsc($arResult['hidden_copy']))?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Мови:
            <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
          </div>
          <div class="right-position">
            <?php foreach((isset($error)? $_POST['list_length'] : explode(',', $arResult['list_length'])) as $k => $v){ ?>
              <input type="text" name="list_length[<?=$k?>]" value="<?=hsc($v)?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="list_length[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
          </div>
        </div>

        <div class="header-line">Додаткові налаштування</div>
        <?php $list = (isset($error)? $_POST['list_length'] : explode(',', $arResult['list_length'])) ?>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Тема листа:<span class="accent">*</span>
            <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
          </div>

          <div class="right-position">
            <?php foreach($list as $k => $v){ ?>
              <input <?=(isset($check['theme_list'])? $check['theme_list'] : '')?> type="text" name="theme_list[<?=$k?>]" value="<?=(isset($error))? (empty($_POST['theme_list'][$k])? $v : $_POST['theme_list'][$k]) : (!isset($arResult['theme_list'][$k])? $v : explode('#|#', $arResult['theme_list'])[$k])?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="theme_list[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
          </div>
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Назва листа:<span class="accent">*</span>
            <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
          </div>
          <div class="right-position">
            <?php foreach($list as $k => $v){ ?>
              <input <?=(isset($check['name_list'])? $check['name_list'] : '')?> type="text" name="name_list[<?=$k?>]" value="<?=(isset($error))? (empty($_POST['name_list'][$k])? $v : $_POST['name_list'][$k]) : (!isset($arResult['name_list'][$k])? $v : explode('#|#', $arResult['name_list'])[$k])?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="name_list[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
          </div>
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Причина листа:<span class="accent">*</span>
            <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
          </div>

          <div class="right-position">
            <?php foreach($list as $k => $v){ ?>
              <input <?=(isset($check['why_list'])? $check['why_list'] : '')?> type="text" name="why_list[<?=$k?>]" value="<?=(isset($error))? (empty($_POST['why_list'][$k])? $v : $_POST['why_list'][$k]) : (!isset($arResult['why_list'][$k])? $v : explode('#|#', $arResult['why_list'])[$k])?>" onkeyup="deleteList(this)">
            <?php } ?>
            <div class="add-el-list" data-name="why_list[]" data-type="text" data-attr='onkeyup="deleteList(this)"'>Додати</div>
          </div>
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span>Текст листа:<span class="accent">*</span>
            <div class="pop-window">Щоб видалити пункт з списку нажміть <b>shift + delete</b></div>
          </div>

          <div class="right-position redactor">
            <?php foreach($list as $k => $v){ ?>
              <textarea <?=(isset($check['text'])? $check['text'] : '')?> name="text[<?=$k?>]" onkeyup="deleteList(this)"><?=(isset($error))? (empty($_POST['text'][$k])? 'Текст листа '.$v : $_POST['text'][$k]) : (!isset($arResult['text'][$k])? 'Текст листа '.$v : explode('#|#', $arResult['text'])[$k])?></textarea>
            <?php } ?>
            <div class="add-el-list" data-name="text[]" data-type="textarea" data-attr='onkeyup="deleteList(this)"'>Додати</div>
          </div>
        </div>

        <input type="submit" value="Зберегти" name="ok">
    </form>
  </div>
<?php } else { ?>
  <div class="filter">
    <div class="filter-name">Фільтр</div>
    <form action="" method="post">
      <div class="add-field-filter icon-plus"></div>
      <div class="filter-option-list">
        <?php foreach($htmlFilter['filter_option'] as $k => $name){ ?>
          <div class="<?=(isset($_COOKIE['filter']) && in_array($k, (array)json_decode($_COOKIE['filter']))? 'act-option' : '')?>"><?=$name?></div>
        <?php } ?>
      </div>
      <?=$htmlFilter['filter_inputs']?>
      <input type="submit" name="search" value="Знайти"><a href="/admin/setting/type-mails/?filterReset=ok">Відмінити</a>
    </form>
  </div>

  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name">Шаблони листів</p>
    </div>
    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom-next">
        <a href="/admin/setting/type-mails/?add=ok" class="add-el icon-plus">Створити тип шаблону</a>
        <input type="submit" value="Активувати" name="activate" class="option-el">
        <input type="submit" value="Деактивувати" name="deactivate" class="option-el">
        <input type="submit" value="Видалити" name="delete" class="option-el">
        <div class="dynamicEdit"></div>
      </div>
      <table class="illustration-table">
        <tr>
          <td><input type="checkbox" name="all_cheked"></td>
          <td></td>
          <td>ID</td>
          <td>Активність</td>
          <td>Назва</td>
          <td>Символьний код</td>
          <td>Дата створення</td>
          <td>Ким зроблена</td>
        </tr>
        <?php if($type_mails['result_DB']->num_rows > 0){
          while($arResult = hsc($type_mails['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/setting/type-mails/?edit=<?=$arResult['id']?>">Змінити</a>
                  <a href="/admin/setting/type-mails/?del=<?=$arResult['id']?>">Видалити</a>
                </div>
              </td>
              <td><?=(int)$arResult['id']?></td>
              <td data-input="ex|checkbox|arr[<?=$arResult['id']?>][active]">
                <?=explode(',', $adminParam['list_logic'])[$arResult['active'] + 1]?>
              </td>
              <td data-input="ex|text|arr[<?=$arResult['id']?>][name]"><?=$arResult['name']?></td>
              <td data-input="ex|text|arr[<?=$arResult['id']?>][symbol_code]"><?=$arResult['symbol_code']?></td>
              <td><?=$arResult['data_create']?></td>
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
      <?=$type_mails['pagination']?>
    </div>
  </div>
<?php } ?>