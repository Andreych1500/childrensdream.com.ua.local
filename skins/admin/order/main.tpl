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
<?/*<div class="commentview">
    <?=((isset($info))? '<p class="h1">'.$info.'</p>' :  "");?>
    <span class="line-silver"></span>
    <div class="comment-list">
        <form method="post" action="" onsubmit="return okFrom();">
            <?php if($res->num_rows){ ?>
                <?php while($row = $res->fetch_assoc()){ ?>
                    <div class="comment-item <?=(($row['active'] == 1)? 'grean' : 'red')?>">
                        <span>Замовлення №<?=(int)$row['id']?></span>
                        <span><?=hsc($row['date']);?></span>
                        <table class="order-table">
                          <tr>
                            <td>Контактна особа:</td>
                            <td>Телефон:</td>
                            <td>Email:</td>
                            <td>Доставка:</td>
                            <td>Місто:</td>
                            <td>Адреса:</td>
                            <td>Оплата:</td>
                            <td>Коментар:</td>
                          </tr>
                          <tr>
                            <td><?=hsc($row['name'])?></td>
                            <td><?=hsc($row['phone'])?></td>
                            <td><?=hsc($row['email'])?></td>
                            <td><?=hsc($row['delivery'])?></td>
                            <td><?=hsc($row['city'])?></td>
                            <td><?=hsc($row['adres'])?></td>
                            <td><?=hsc($row['payment'])?></td>
                            <td><?=hsc($row['comment'])?></td>
                          </tr>
                          <?php if($row['active'] == 0){ ?>
                          <tr>
                            <td>Назва товару:</td>
                            <td>Кількість:</td>
                            <td>Ціна:</td>
                            <td>Просумована ціна:</td>
                            <td>Повна ціна:</td>
                          </tr>
                          <tr>
                            <td>
                              <ul>
                                <?php foreach(explode(',', hsc($row['name_el'])) as $key => $val){ ?>
                                <li><?=$val?></li>
                                <?php } ?>
                              </ul>
                            </td>
                            <td>
                              <ul>
                                <?php foreach($count_el = explode(',', hsc($row['count_el'])) as $key => $val){ ?>
                                <li><?=$val?></li>
                                <?php } ?>
                              </ul>
                            </td>
                            <td>
                              <ul>
                                <?php foreach(explode(',', hsc($row['price_el'])) as $key => $val){ ?>
                                <li><?=number_format($val, 0, '', ' ')?> грн.</li>
                                <?php } ?>
                              </ul>
                            </td>
                            <td>
                              <ul>
                                  <?php foreach(explode(',', hsc($row['price_el'])) as $key => $val){ ?>
                                      <li><?=number_format(($val * $count_el[$key]), 0, '', ' ')?> грн.</li>
                                  <?php } ?>
                              </ul>
                            </td>
                            <td><?=number_format($row['all_price'], 0, '', ' ')?> грн.</td>
                          </tr>
                        <?php } ?>
                        </table>
                        <div class="editWindow">
                            <input type="checkbox" name="ids[]" value="<?=(int)$row['id']?>">
                        </div>
                    </div>
                    <span class="line"><span></span></span>
                <?php } ?>
            <?php } else { ?>
                <div class="comment-item">
                    <p class="no-item"><?=$mess['NO_COMMENT']?></p>
                </div>
                <span class="line"><span></span></span>
            <?php } ?>
            <input type="submit" value="Видалити" name="delete">
            <input type="submit" value="Деактивувати" name="deactive">
            <input type="submit" value="Активувати" name="active">
        </form>
    </div>
</div>
*/?>