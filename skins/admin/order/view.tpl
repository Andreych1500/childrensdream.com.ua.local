<div class="add-content">
    <span class="add-element">Замовлення №<?=(int)$arResult['id']?></span>
    <span class="date"><?=hsc($arResult['date_create'])?></span>
    <a href="/admin/order/" class="back-menu">Усі замовлення</a>
    <div class="add-block-form">
      <form action="" method="post" enctype="multipart/form-data">
        <div class="spec-list">

            <p class="st-form">
                <span>Контактна особа:</span>
                <span><?=hsc($arResult['name'])?></span>
            </p>
            <p class="st-form">
                <span>Телефон:</span>
                <span><?=hsc($arResult['phone'])?></span>
            </p>
            <p class="st-form">
                <span>Email:</span>
                <span><?=hsc($arResult['email'])?></span>
            </p>
            <p class="st-form">
                <span>Доставка:</span>
                <span><?=hsc($arResult['delivery'])?></span>
            </p>
            <p class="st-form">
                <span>Місто:</span>
                <span><?=hsc($arResult['city'])?></span>
            </p>
            <p class="st-form">
                <span>Адреса:</span>
                <span><?=hsc($arResult['adres'])?></span>
            </p>
            <p class="st-form">
                <span>Оплата:</span>
                <span><?=hsc($arResult['payment'])?></span>
            </p>
            <p class="st-form">
                <span>Коментар:</span>
                <span><?=nl2br(hsc($arResult['comment']))?></span>
            </p>

            <div class="line-goods">Замовлення</div>


            <table class="order-table">
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
                    <?php foreach(explode(',', hsc($arResult['name_el'])) as $key => $val){ ?>
                        <li><?=$val?></li>
                    <?php } ?>
                  </ul>
                </td>
                <td>
                  <ul>
                    <?php foreach($count_el = explode(',', hsc($arResult['count_el'])) as $key => $val){ ?>
                        <li><?=$val?></li>
                    <?php } ?>
                  </ul>
                </td>
                <td>
                  <ul>
                    <?php foreach(explode(',', hsc($arResult['price_el'])) as $key => $val){ ?>
                        <li><?=number_format($val, 0, '', ' ')?> грн.</li>
                    <?php } ?>
                  </ul>
                </td>
                <td>
                  <ul>
                    <?php foreach(explode(',', hsc($arResult['price_el'])) as $key => $val){ ?>
                        <li><?=number_format(($val * $count_el[$key]), 0, '', ' ')?> грн.</li>
                    <?php } ?>
                  </ul>
                </td>
                <td><?=number_format($arResult['all_price'], 0, '', ' ')?> грн.</td>
              </tr>
            </table>

        </div>
      </form>
    </div>
</div>