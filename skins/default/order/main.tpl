<div class="catalog-order">
  <?php if(count($cookies) > 0){ ?>
  <p class="hText"><?=$mess['ORDERH1']?></p>
  <div class="order">
      <form method="post" action="" onsubmit="return myOrder();">
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
                <td>
                  <?=(isset($lang)? hsc($val['name_ru']) : hsc($val['name']))?>
                  <input type="hidden" name="names_el[]" value="<?=(isset($lang)? hsc($val['name_ru']) : hsc($val['name']))?>">
                </td>
                <td>
                  <input class="<?=(isset($errors['count'][$key])? 'errors' : '')?>" onchange="edit_price(this);" type="number" min="1" max="99"  step="1" name="count[<?=$val['id']?>]" value="<?=(isset($errors)? (($_POST['count'][$val['id']] > 99)? '99' : $_POST['count'][$val['id']] ) : '1')?>">
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
        <div class="sum-goods">
          <p><?=$mess['SUMTEXT1']?> <span class="all-goods-price"><?=number_format($all_goods_price, 0, ',', ' ')?></span> <span class="currency"><?=$mess['PRICEVAL']?></span> <?=$mess['SUMTEXT2']?></p>
        </div>
        <div class="order-form">
          <table>
            <tr>
              <td><?=$mess['FORM_NAME']?><span>*</span></td>
              <td><input type="text" class="<?=(isset($errors['name'])? $errors['name'] : '')?>" name="name" value="<?=(isset($errors)? hsc($_POST['name']) : '' )?>"></td>
            </tr>
            <tr>
              <td><?=$mess['PHONE']?><span>*</span></td>
              <td><input type="text" class="<?=(isset($errors['phone'])? $errors['phone'] : '')?>" name="phone" value="<?=(isset($errors)? hsc($_POST['phone']) : '' )?>"></td>
            </tr>
            <tr>
              <td><?=$mess['EMAIL']?><span>*</span></td>
              <td><input type="email" class="<?=(isset($errors['email'])? $errors['email'] : '')?>" name="email" value="<?=(isset($errors)? hsc($_POST['email']) : '' )?>"></td>
            </tr>
            <tr>
              <td><?=$mess['DELIVERY']?><span>*</span></td>
              <td>
                <select name="delivery" class="<?=(isset($errors['delivery'])? $errors['delivery'] : '')?>">
                  <?php foreach(Core::$DEVELORY as $k=>$v){ ?>
                    <option value="<?=$k;?>" <?=((isset($errors) && $_POST['delivery'] == $k)? 'selected="selected"' : "")?>>
                      <?=$mess['DEVELORY'.$k]?>
                    </option>
                  <?php } ?>
                </select>
              </td>
            </tr>
            <tr>
              <td><?=$mess['CITY']?><span>*</span></td>
              <td><input type="text" class="<?=(isset($errors['city'])? $errors['city'] : '')?>" name="city" value="<?=(isset($errors)? hsc($_POST['city']) : '' )?>"></td>
            </tr>
            <tr>
              <td><?=$mess['ADRES']?><span>*</span></td>
              <td><input type="text" class="<?=(isset($errors['adres'])? $errors['adres'] : '')?>" name="adres" value="<?=(isset($errors)? hsc($_POST['adres']) : '' )?>"></td>
            </tr>
            <tr>
              <td><?=$mess['PAYMENT']?><span>*</span></td>
              <td>
                <select name="payment">
                  <?php foreach(Core::$PAYMANT as $k=>$v){ ?>
                    <option value="<?=$k;?>" <?=((isset($errors) && $_POST['payment'] == $k)? 'selected="selected"' : "")?>>
                    <?=$mess['PAYMANT'.$k]?>
                    </option>
                  <?php } ?>
                </select>
              </td>
            </tr>
            <tr>
              <td><?=$mess['COMMENT']?></td>
              <td><input type="text" class="<?=(isset($errors['comment'])? $errors['comment'] : '')?>" name="comment" value="<?=(isset($errors)? hsc($_POST['comment']) : '' )?>"></td>
            </tr>
            <tr>
              <td><img src="/modules/static/captcha.php"></td>
              <td>
                <p><?=$mess['CAPCHA']?><span>*</span></p>
                <input class="<?=((isset($errors['capcha']))? 'error' : '')?>" type="text" name="capcha" value="<?=(isset($_POST['capha'])? hsc($_POST['capha']):"")?>">
              </td>
            </tr>
          </table>
        </div>
        <input type="submit" name="ok" value="<?=$mess['SUBMIT']?>">
      </form>
  </div>
  <p class="care"><?=$mess['CARE']?></p>
  <?php } else { ?>
  <div class="no-goods">
    <?php if(isset($info)){ ?>
    <p><?=$mess['SENKS1']?></p>
    <p><?=$mess['SENKS2']?></p>
    <p><?=$mess['SENKS3']?></p>
    <p><?=$mess['SENKS4']?></p>
    <?php } else { ?>
    <p><?=$mess['BASKETNULL']?></p>
    <?php } ?>
    <p><a href="<?=(isset($lang)? '/ru/' : '/')?>catalog"><?=$mess['GOSHOP']?></a></p>
  </div>
  <?php } ?>
</div>