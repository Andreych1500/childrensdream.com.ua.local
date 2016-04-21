<div class="order">
  <?php if(count($cookies) > 0){ ?>
  <p class="h-title"><?=$mess['ORDERH1']?></p>
  <form method="post" action="" onsubmit="return checkForm('.order', 'form-order');">
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
          <td><img src="<?=hsc($val['cAnonsPhoto'])?>" alt="<?=hsc($val['img_seo_alt_'.$lang])?>" title="<?=hsc($val['img_seo_alt_'.$lang])?>"></td>
          <td>
            <?=hsc($val['name_'.$lang])?>
            <input type="hidden" name="names_el[]" value="<?=hsc($val['name_'.$lang])?>">
          </td>
          <td>
            <input class="<?=(isset($errors['count'][$val['id']])? 'errors' : '')?>" onchange="edit_price(this);" type="number" min="1" max="99"  step="1" name="count[<?=$val['id']?>]" value="<?=(isset($errors)? (($_POST['count'][$val['id']] > 99)? '99' : $_POST['count'][$val['id']] ) : '1')?>">
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
      <?=$mess['SUMTEXT1']?> <span class="all-goods-price"><?=number_format($all_goods_price, 0, ',', ' ')?></span> <span><?=$mess['PRICEVAL']?></span> <?=$mess['SUMTEXT2']?>
    </div>
    <div class="order-form">
      <p><?=$mess['FORM_NAME']?><span>*</span></p>
      <input type="text" class="<?=(isset($errors['name'])? $errors['name'] : '')?>" name="name" value="<?=(isset($errors)? hsc($_POST['name']) : '' )?>">
      <p><?=$mess['PHONE']?><span>*</span></p>
      <input type="text" class="<?=(isset($errors['phone'])? $errors['phone'] : '')?>" name="phone" value="<?=(isset($errors)? hsc($_POST['phone']) : '' )?>">
      <p><?=$mess['EMAIL']?><span>*</span></p>
      <input type="email" class="<?=(isset($errors['email'])? $errors['email'] : '')?>" name="email" value="<?=(isset($errors)? hsc($_POST['email']) : '' )?>">
      <p><?=$mess['DELIVERY']?><span>*</span></p>
      <select name="delivery" class="<?=(isset($errors['delivery'])? $errors['delivery'] : '')?>">
        <?php foreach(Core::$DEVELORY as $k=>$v){ ?>
          <option value="<?=$k;?>" <?=((isset($errors) && $_POST['delivery'] == $k)? 'selected="selected"' : "")?>>
            <?=$mess['DEVELORY'.$k]?>
          </option>
        <?php } ?>
      </select>
      <p><?=$mess['CITY']?><span>*</span></p>
      <input type="text" class="<?=(isset($errors['city'])? $errors['city'] : '')?>" name="city" value="<?=(isset($errors)? hsc($_POST['city']) : '' )?>">
      <p><?=$mess['ADRES']?><span>*</span></p>
      <input type="text" class="<?=(isset($errors['adres'])? $errors['adres'] : '')?>" name="adres" value="<?=(isset($errors)? hsc($_POST['adres']) : '' )?>">
      <p><?=$mess['PAYMENT']?><span>*</span></p>
      <select name="payment">
        <?php foreach(Core::$PAYMANT as $k=>$v){ ?>
          <option value="<?=$k;?>" <?=((isset($errors) && $_POST['payment'] == $k)? 'selected="selected"' : "")?>>
            <?=$mess['PAYMANT'.$k]?>
          </option>
        <?php } ?>
      </select>
      <p><?=$mess['COMMENT']?></p>
      <input type="text" class="<?=(isset($errors['comment'])? $errors['comment'] : '')?>" name="comment" value="<?=(isset($errors)? hsc($_POST['comment']) : '' )?>">
      <p><?=$mess['CAPCHA']?><span>*</span></p>
      <input class="<?=((isset($errors['capcha']))? $errors['capcha'] : '')?>" type="text" name="capcha" value="<?=(isset($_POST['capha'])? hsc($_POST['capha']):"")?>">
      <img class="capcha" src="/modules/static/captcha.php">
    </div>
    <input type="submit" name="ok" value="<?=$mess['SUBMIT']?>">
  </form>
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
      <a href="<?=$link_langs?>product/"><?=$mess['GOSHOP']?></a>
    </div>
  <?php } ?>
</div>