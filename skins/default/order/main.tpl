<div class="catalog-order">
  <?php if(count($cookies) > 0){ ?>
  <p class="hText"><?=$mess['ORDERH1']?></p>
  <div class="order">
      <form method="post" action="">
        <div class="table-count">
          <div class="headers-tab">
            <p class="bt"><?=$mess['PHOTO']?></p>
            <p class="bt"><?=$mess['NAME']?></p>
            <p class="bt"><?=$mess['COUNT']?></p>
            <p class="bt"><?=$mess['PRICE']?></p>
            <p class="bt"></p>
          </div>
          <table class="line-tab-goods">
          <?php foreach($goods as $key => $val){ ?>
              <tr>
                  <td><img src="<?=hsc($val['anons_photo'])?>" alt="Childrean-dream"></td>
                  <td><?=(isset($lang)? hsc($val['name_ru']) : hsc($val['name']))?></td>
                  <td>
                      <input type="number" min="1" max="99" step="1" name="count[<?=$val['id']?>]" value="<?=(isset($errors)? $_POST['count'][$val['id']] : '1')?>">
                  </td>
                  <td><?=number_format($val['all_price'], 0, ',', ' ')?> <?=$mess['PRICEVAL']?></td>
                  <td class="del-good"><span rel_id="<?=(int)$val['id']?>" class="icon-cross"></span></td>
              </tr>
          <?php } ?>
          </table>
        </div>
        <div class="sum-goods">
          <p><?=$mess['SUMTEXT1']?> <span class="all-goods-price"><?=number_format($all_goods_price, 0, ',', ' ')?> <?=$mess['PRICEVAL']?></span> <?=$mess['SUMTEXT2']?></p>
        </div>
        <div class="order-form"></div>
        <input type="submit" name="ok" value="надіслати">
      </form>
  </div>
  <p class="care"><?=$mess['CARE']?></p>
  <?php } else { ?>
  <div class="no-goods">
      <p><?=$mess['BASKETNULL']?></p>
      <p><a href="<?=(isset($lang)? '/ru/' : '/')?>catalog"><?=$mess['GOSHOP']?></a></p>
  </div>
  <?php } ?>
</div>