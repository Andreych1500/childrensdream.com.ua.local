<?php if(count($cookies) > 0){ ?>
  <div class="order">
    <p class="h-title"><?=$mess['ORDERH1']?></p>
    <form name="order" method="post" action="" onsubmit="return checkForm('order');">
      <div class="table-count">
        <div class="headers-tab">
          <p><?=$mess['PHOTO']?></p>
          <p><?=$mess['NAME']?></p>
          <p><?=$mess['COUNT']?></p>
          <p><?=$mess['PRICE']?></p>
          <p></p>
        </div>
        <table class="line-tab-goods">
          <?php foreach($goods as $key => $val){ ?>
            <tr>
              <td>
                <img src="<?=hsc($val['img_anons'])?>" alt="<?=hsc($val['img_seo_alt_'.$lang])?>" title="<?=hsc($val['img_seo_alt_'.$lang])?>">
              </td>
              <td>
                <?=hsc($val['name_'.$lang])?>
                <input type="hidden" name="names_el[]" value="<?=hsc($val['name_'.$lang])?>">
              </td>
              <td>
                <input onchange="edit_price(this);" type="number" min="1" max="99" step="1" name="count[<?=$val['id']?>]" value="<?=(isset($error)? (!isset($_POST['count'][$val['id']])? '1' : (($_POST['count'][$val['id']] > 99)? '99' : $_POST['count'][$val['id']])) : '1')?>">
              </td>
              <td>
                <span class="edJsPrice"><?=number_format($val['all_price'], 0, ',', ' ')?></span> <?=$mess['PRICEVAL']?>
                <input type="hidden" name="prices_el[]" class="el_prive_hidden" rel_aep="<?=(int)$val['all_price']?>" value="<?=(int)$val['price']?>">
              </td>
              <td class="del-good"><span rel_id="<?=(int)$val['id']?>" class="icon-cross"></span></td>
            </tr>
          <?php } ?>
        </table>
      </div>
      <div class="sum-price">
        <?=$mess['SUMTEXT1']?> <span class="all-goods-price"><?=number_format($all_goods_price, 0, ',', ' ')?></span>
        <span><?=$mess['PRICEVAL']?></span> <?=$mess['SUMTEXT2']?>
      </div>
      <div class="order-form">
        <p><?=$mess['FORM_NAME']?><span>*</span></p>
        <input type="text" <?=(isset($check['name'])? $check['name'] : '')?> name="name" value="<?=(isset($_POST['name'])? hsc($_POST['name']) : "")?>">

        <p><?=$mess['PHONE']?><span>*</span></p>
        <input type="text" <?=(isset($check['phone'])? $check['phone'] : '')?> name="phone" value="<?=(isset($_POST['phone'])? hsc($_POST['phone']) : "")?>">

        <p><?=$mess['EMAIL']?><span>*</span></p>
        <input type="email" <?=(isset($check['email'])? $check['email'] : '')?> name="email" value="<?=(isset($_POST['email'])? hsc($_POST['email']) : "")?>">

        <p><?=$mess['DELIVERY']?><span>*</span></p>
        <select name="delivery" <?=(isset($check['delivery'])? $check['delivery'] : '')?>">
        <?php while($arrRes = $delivery->fetch_assoc()){ ?>
          <option value="<?=$arrRes['symbol_code']?>" <?=((isset($error) && $_POST['delivery'] == $arrRes['symbol_code'])? 'selected="selected"' : "")?>>
            <?=$mess[$arrRes['name']]?>
          </option>
        <?php } ?>
        </select>

        <p><?=$mess['CITY']?><span>*</span></p>
        <input type="text" <?=(isset($check['city'])? $check['city'] : '')?> name="city" value="<?=(isset($_POST['city'])? hsc($_POST['city']) : "")?>">

        <p><?=$mess['ADRES']?><span>*</span></p>
        <input type="text" <?=(isset($check['address'])? $check['address'] : '')?> name="address" value="<?=(isset($_POST['address'])? hsc($_POST['address']) : "")?>">
        <p><?=$mess['PAYMENT']?><span>*</span></p>
        <select name="payment" <?=(isset($check['payment'])? $check['payment'] : '')?>>
          <?php while($arrRes = $payment->fetch_assoc()){ ?>
            <option value="<?=$arrRes['symbol_code']?>" <?=((isset($error) && $_POST['payment'] == $arrRes['symbol_code'])? 'selected="selected"' : "")?>>
              <?=$mess[$arrRes['name']]?>
            </option>
          <?php } ?>
        </select>

        <p><?=$mess['COMMENT']?></p>
        <input type="text" data-no-checked="ok" name="comment" value="<?=(isset($error)? hsc($_POST['comment']) : '')?>">

        <p><?=$mess['CAPCHA']?><span>*</span></p>
        <input <?=(isset($check['capcha'])? $check['capcha'] : '')?> type="text" name="capcha" value="<?=(isset($_POST['capha'])? hsc($_POST['capha']) : "")?>">
        <img class="capcha" src="/modules/static/captcha.php">

        <div class="oferta">
          <input <?=(isset($check['oferta'])? $check['oferta'] : '')?> type="checkbox" name="oferta" value="ok"><span>*</span><?=$mess['Оферта']?>
          <a target="_blank" rel="nofollow" href="<?=$arMainParam['url_http_site'].$link_lang.'oferta/'?>"><?=$arMainParam['url_http_site'].$link_lang.'oferta/'?></a>
        </div>
      </div>
      
      <input type="submit" name="ok" value="<?=$mess['SUBMIT']?>">
    </form>
    <p class="care"><?=$mess['CARE']?></p>
  </div>
<?php } else { ?>
  <div class="no-goods">
    <?php if(isset($info)){ ?>
      <p><?=$mess['SENKS1']?></p><p><?=$mess['SENKS2']?></p><p><?=$mess['SENKS3']?></p><p><?=$mess['SENKS4']?></p>
    <?php } else { ?>
      <p><?=$mess['BASKETNULL']?></p>
    <?php } ?>
    <a href="<?=$link_lang?>products/"><?=$mess['GOSHOP']?></a>
  </div>
<?php } ?>
