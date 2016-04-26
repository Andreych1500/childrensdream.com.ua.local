<div class="main-view-content">
  <div class="custom-content-form">
    <form action="" method="post" onsubmit="return okFrom();">
    <div class="line-custom">
        <input type="submit" value="Виконаний" name="active">
        <input type="submit" value="Невиконаний" name="deactive">
        <input type="submit" value="Видалити" name="delete">
    </div>
      <table class="edFormEdit">
        <tr>
            <td><input type="checkbox" name="all_cheked"></td>
            <td></td>
            <td>Замовлення</td>
            <td>Оброблено</td>
            <td>Контактна особа</td>
            <td>Місто</td>
            <td>Ціна</td>
            <td>Дата замовлення</td>
            <td>Email</td>
        </tr>
        <?php while($arResult = $order->fetch_assoc()){ ?>
        <tr>
            <td>
                <input type="checkbox" name="ids[]" value="<?=$arResult['id']?>">
            </td>
            <td>
              <span class="icon-mob-menu" onclick="openEdit(this);"></span>
              <div class="menu-edit">
                <a href="/admin/order/view?id=<?=(int)$arResult['id']?>">
                    <span class="icon-content"></span>
                    Відкрити
                </a>
                <span class="delete icon-cross" onclick="deleteElement(<?=(int)$arResult['id']?>, this, '<?=Core::$DIR_PHOTOS_AND_DB_TABLE_NAME['comments']?>')">Видалити</span>
              </div>
            </td>

            <td>№ <?=(int)$arResult['id']?></td>
            <td><span class="<?=(($arResult['active'] == 0)? 'icon-cross' : 'icon-good')?>"></span></td>
            <td><?=hsc($arResult['name'])?></td>
            <td><?=hsc($arResult['city'])?></td>
            <td><?=hsc($arResult['all_price'])?> грн.</td>
            <td><?=hsc($arResult['date_create'])?></td>
            <td><?=hsc($arResult['email'])?></td>
        </tr>
        <?php } ?>
      </table>
    </form>
  </div>
</div>