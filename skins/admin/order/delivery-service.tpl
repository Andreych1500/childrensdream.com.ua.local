<?php if(isset($_REQUEST['add'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Створити елемент']?></p>
      <a class="back-url" href="/admin/order/delivery-service/"><?=$messG['Назад']?></a>
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
          <div class="name-section"><?=$messG['Символьний код']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['symbol_code'])? $check['symbol_code'] : '')?> type="text" name="symbol_code" value="<?=(isset($error)? hsc($_POST['name']) : "")?>">
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
      <a class="back-url" href="/admin/order/delivery-service/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
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
          <div class="name-section"><?=$messG['Символьний код']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['symbol_code'])? $check['symbol_code'] : '')?> type="text" name="symbol_code" value="<?=(isset($error)? hsc($_POST['symbol_code']) : $arResult['symbol_code'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$messG['Сортування']?>:</div>
          <input type="number" step="1" min="1" name="sort" value="<?=((isset($error))? hsc($_POST['sort']) : hsc($arResult['sort']))?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Додаткова інформація']?>:</div>
          <textarea name="text"><?=((isset($error))? hsc($_POST['text']) : $arResult['text'])?></textarea>
        </div>
      </div>

      <input type="submit" value="<?=$messG['Зберегти']?>" name="ok">
    </form>
  </div>
<?php } else { ?>
  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name"><?=$mess['Служби доставки']?></p>
    </div>

    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom-next">
        <a href="/admin/order/delivery-service/?add=ok" class="add-el icon-plus"><?=$messG['Створити елемент']?></a>
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
          <td><?=$messG['Символьний код']?></td>
          <td><?=$messG['Сортування']?></td>
          <td><?=$messG['Час оновлення']?></td>
          <td><?=$messG['Ким оновлений']?></td>
        </tr>

        <?php if($service['result_DB']->num_rows > 0){
          while($arResult = hsc($service['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/order/delivery-service/?edit=<?=$arResult['id']?>"><?=$messG['Редагувати']?></a>
                  <a href="/admin/order/delivery-service/?del=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
                </div>
              </td>
              <td><?=(int)$arResult['id']?></td>
              <td data-input="ex|checkbox|arr[<?=$arResult['id']?>][active]"><?=Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']][$arResult['active']]?>
              </td>
              <td data-input="ex|text|arr[<?=$arResult['id']?>][name]"><?=$arResult['name']?></td>
              <td data-input="ex|text|arr[<?=$arResult['id']?>][symbol_code]"><?=$arResult['symbol_code']?></td>
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
            <td>-</td>
          </tr>
        <?php } ?>
      </table>
    </form>
    <div class="bottom-table">
      <?=$service['pagination']?>
    </div>
  </div>
<?php } ?>