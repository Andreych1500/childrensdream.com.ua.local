<?php if(isset($_REQUEST['view'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$mess['Замовлення'].' № '?><?=(int)$_REQUEST['view']?></p>
      <a class="back-url" href="/admin/order/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Перегляд']?></li>
    </ul>

    <form class="content-form" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="header-line"><?=$mess['Інформація замовлення']?></div>

        <div class="spec-list">
          <p class="p-td"><span><?=$mess['Дата замовлення']?>:</span><?=$arResult['data_create']?></p>
          <p class="p-td"><span><?=$mess['Контактна особа']?>:</span><?=$arResult['name']?></p>
          <p class="p-td"><span><?=$mess['Телефон']?>:</span><?=$arResult['phone']?></p>
          <p class="p-td"><span>Email:</span><?=$arResult['email']?></p>
          <p class="p-td"><span><?=$mess['Доставка']?>:</span><?=$arResult['delivery']?></p>
          <p class="p-td"><span><?=$mess['Місто']?>:</span><?=$arResult['city']?></p>
          <p class="p-td"><span><?=$mess['Адреса']?>:</span><?=$arResult['address']?></p>
          <p class="p-td"><span><?=$mess['Оплата']?>:</span><?=$arResult['payment']?></p>
          <p class="p-td"><span><?=$mess['Коментар']?>:</span><?=$arResult['comment']?></p>
        </div>

        <div class="header-line"><?=$mess['Замовлення']?></div>

        <div class="flex-spec-list-first">
          <b><?=$mess['Назва товару']?>:</b> <b><?=$mess['Кількість']?>:</b> <b><?=$mess['Ціна']?>:</b> <b><?=$mess['Просумована ціна']?>:</b>
        </div>
        <div class="flex-spec-list-last">
          <?php foreach(explode(',', $arResult['name_el']) as $k => $name){ ?>
            <div class="div-td">
              <p><?=$name?></p>
              <p><?=$arResult['count_el'][$k]?></p>
              <p><?=$arResult['price_el'][$k]?> грн.</p>
              <p><?=number_format(($arResult['price_el'][$k] * $arResult['count_el'][$k]), 0, '', ' ')?> грн.</p>
            </div>
          <?php } ?>
          <div class="all_price"><b><?=$mess['Повна ціна']?>: </b><?=number_format($arResult['all_price'], 0, '', ' ')?> грн.</div>
        </div>
      </div>

    </form>
  </div>
<?php } else { ?>
  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name"><?=$messG['Список замовлень']?></p>
    </div>

    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom-next">
        <input type="submit" value="<?=$messG['Активувати']?>" name="activate" class="option-el">
        <input type="submit" value="<?=$messG['Деактивувати']?>" name="deactivate" class="option-el">
        <input type="submit" value="<?=$messG['Видалити']?>" name="delete" class="option-el">
      </div>

      <table class="illustration-table">
        <tr>
          <td><input type="checkbox" name="all_cheked"></td>
          <td></td>
          <td><?=$mess['Замовлення']?> №</td>
          <td><?=$mess['Оброблено']?></td>
          <td><?=$mess['Контактна особа']?></td>
          <td><?=$mess['Місто']?></td>
          <td><?=$mess['Ціна']?></td>
          <td>Email</td>
          <td><?=$mess['Дата замовлення']?></td>
        </tr>
        <?php if($order['result_DB']->num_rows > 0){
          while($arResult = hsc($order['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/order/?view=<?=$arResult['id']?>"><?=$messG['Переглянути']?></a>
                  <a href="/admin/order/?del=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
                </div>
              </td>
              <td><?=(int)$arResult['id']?></td>
              <td><span class="<?=(($arResult['active'] == 0)? 'icon-cross' : 'icon-good')?>"></span></td>
              <td><?=$arResult['name']?></td>
              <td><?=$arResult['city']?></td>
              <td><?=$arResult['all_price']?></td>
              <td><?=$arResult['email']?></td>
              <td><?=$arResult['data_create']?></td>
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
      <?=$order['pagination']?>
    </div>
  </div>
<?php } ?>