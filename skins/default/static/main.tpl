<div class="main-banner">
  <div class="slide-list">
    <div class="next-slide icon-right"></div>
    <div class="slide-wrap">
      <?php while($arResult = $main_banner->fetch_assoc()){ ?>
        <div class="slide-item">
          <img src="<?=hsc($arResult['img_'.$lang])?>" alt="<?=hsc($arResult['img_seo_alt_'.$lang])?>">
        </div>
      <?php } ?>
    </div>
    <div class="prev-slide icon-left"></div>
  </div>
</div>

<div class="about-text" id="about">
  <div class="block-title">
    <span class="line"></span>
    <p class="title-text"><?=$mess['ABOUT_US'];?></p>
    <span class="line"></span>
  </div>
  <p><?=$mess['ABOUT_TEXT1'];?></p>
  <p><?=$mess['ABOUT_TEXT2'];?></p>
  <p><?=$mess['ABOUT_TEXT3'];?></p>
  <p><?=$mess['ABOUT_TEXT4'];?></p>
  <p><?=$mess['ABOUT_TEXT5'];?></p>
  <img src="/skins/default/img/cd-static.png" alt="Children's Dream" title="Children's Dream">
</div>

<div class="product">
  <div class="product-list">
    <div class="block-title">
      <span class="line"></span>
      <p><?=$mess['DETSKIE_MATRACI'];?></p>
      <span class="line"></span>
    </div>

    <?php if($product->num_rows > 0){ ?>
      <?php while($el = $product->fetch_assoc()){ ?>
        <div class="mattress">
          <a class="photos" href="<?=$link_langs?>product/<?=$el['seo_name']?>"><img src="<?=hsc($el['cAnonsPhoto'])?>" alt="<?=hsc($el['img_seo_alt_'.$lang])?>"></a>
          <a class="links" href="<?=$link_langs?>product/<?=$el['seo_name']?>"><span><?=hsc($el['name_'.$lang])?></span></a>
          <p class="price"><?=number_format(hsc($el['price']), 0, ',', ' ')?> <?=$mess['PRICE'];?></p>
          <p class="aviability">
            <span class="<?=(((int)$el['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
            <span><?=(((int)$el['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
          </p>
        </div>
      <?php } ?>
    <?php } else { ?>
    <div class="no-element"><?=$mess['NO_ELEMETN']?></div>
    <?php } ?>
  </div>
</div>


<div class="information-shop">
  <?/*<div class="text-item">
    <div class="hTextMain">
      <h1><?=$mess['MAIN_TEXT_H1'];?></h1>
      <p><?=$mess['MAIN_TEXT1'];?><strong><?=$mess['MAIN_TEXT2'];?></strong> <?=$mess['MAIN_TEXT3'];?></p>
      <p><?=$mess['MAIN_TEXT4'];?></p>
      <p><?=$mess['MAIN_TEXT5'];?></p>
      <ul>
        <li><span><strong><?=$mess['MAIN_TEXT_LIST1'];?></strong><?=$mess['MAIN_TEXT_LIST2'];?></span></li>
        <li><span><strong><?=$mess['MAIN_TEXT_LIST3'];?></strong><?=$mess['MAIN_TEXT_LIST4'];?></span></li>
        <li><span><strong><?=$mess['MAIN_TEXT_LIST5'];?></strong><?=$mess['MAIN_TEXT_LIST6'];?></span></li>
      </ul>
    </div>

    <div class="hText" id="payment">
      <table>
        <tr>
          <td><span class="line"></span></td>
          <td><span><?=$mess['SERVICES_TEXT0'];?></span></td>
          <td><span class="line"></span></td>
        </tr>
      </table>
    </div>
    <div class="descriptinText">
      <div class="item-left">
        <p><strong><?=$mess['SERVICES_TEXT1'];?></strong></p>
        <p><?=$mess['SERVICES_TEXT2'];?></p>
        <ul>
          <li><span><?=$mess['SERVICES_TEXT3'];?></span></li>
          <li><span><?=$mess['SERVICES_TEXT4'];?></span></li>
          <li><span><?=$mess['SERVICES_TEXT5'];?></span></li>
          <li><span><?=$mess['SERVICES_TEXT6'];?></span></li>
        </ul>
        <p><strong><?=$mess['SERVICES_TEXT7'];?></strong></p>
        <p><?=$mess['SERVICES_TEXT8'];?></p>
        <p><?=$mess['SERVICES_TEXT9'];?></p>
        <ul>
          <li><span><?=$mess['SERVICES_TEXT10'];?></span></li>
          <li><span><?=$mess['SERVICES_TEXT11'];?></span></li>
          <li><span><?=$mess['SERVICES_TEXT12'];?></span></li>
          <li><span><?=$mess['SERVICES_TEXT13'];?><strong><?=$mess['SERVICES_TEXT14'];?></strong></span></li>
        </ul>
      </div>
      <div class="item-right">
        <img src="/skins/default/img/car.png" alt="<?=$mess['SERVICES_TEXT0'];?>" title="<?=$mess['SERVICES_TEXT0'];?>">
      </div>
    </div>
  </div>
*/?>
</div>

<?/*
<div class="contact st-1" id="call">
  <div class="text-item">
    <div class="hText">
      <table>
        <tr>
          <td><span class="line"></span></td>
          <td><span><?=$mess['CONTACTS'];?></span></td>
          <td><span class="line"></span></td>
        </tr>
      </table>
    </div>
  </div>
  <div class="form-contact">
    <? if(isset($info)){?>
    <p class="info-call this-ok"><?=$mess['OK_MESSAGE1']?></p>
    <p><?=$mess['OK_MESSAGE2']?></p>
    <? } else { ?>
    <p class="info-call"><?=$mess['CALL_TEXT1']?><b><?=$mess['CALL_TEXT2']?></b><?=$mess['CALL_TEXT3']?><b><?=$mess['CALL_TEXT4']?></b>, <b><?=$mess['CALL_TEXT5']?></b></p>
    <form action="#call" method="post" onsubmit="return checkForm('.form-contact', 'form-contact');">
      <div>
        <p><?=$mess['CALL_NAME']?><span>*</span></p>
        <input class="<?=((isset($errors['name']))? 'errors' : '')?>" type="text" name="name" value="<?=(isset($_POST['name'])? hsc($_POST['name']):"")?>">
      </div>
      <div>
        <p><?=$mess['CALL_EMAIL']?><span>*</span></p>
        <input class="<?=((isset($errors['email']))? 'errors' : '')?>" type="email" name="email" value="<?=(isset($_POST['email'])? hsc($_POST['email']):"")?>">
      </div>
      <div class="clear"></div>
      <div>
        <p><?=$mess['CALL_THEMS']?><span>*</span></p>
        <input class="<?=((isset($errors['thems']))? 'errors' : '')?>" type="text" name="thems" value="<?=(isset($_POST['thems'])? hsc($_POST['thems']):"")?>">
      </div>
      <div>
        <p><?=$mess['CALL_TEXT']?><span>*</span></p>
        <textarea class="<?=((isset($errors['text']))? 'errors' : '')?>" name="text"><?=(isset($_POST['text'])? hsc($_POST['text']):"")?></textarea>
      </div>
      <div class="capcha">
        <img alt="capcha" src="/modules/static/captcha.php">
      </div>
      <div>
        <p><?=$mess['CAPCHA']?><span>*</span></p>
        <input class="<?=((isset($errors['capcha']))? 'errors' : '')?>" type="text" name="capcha" value="<?=(isset($_POST['capha'])? hsc($_POST['capha']):"")?>">
      </div>
      <div class="clear"></div>
      <input type="submit" value="<?=$mess['SUBMIT']?>" name="ok">
      <?php if(isset($next_error['limit']) && $next_error['limit'] == 'Y'){ ?>
        <p class="limit"><?=$mess['LIMIT']?></p>
      <? } ?>
    </form>
    <? } ?>
  </div>
</div>
*/?>