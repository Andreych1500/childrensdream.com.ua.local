<div class="background-content">
  <div class="position-width">
    <div class="sliders-line">
      <div class="slide-list">
        <div class="next-slide">
          <span class="icon-left"></span>
        </div>
        <div class="slide-wrap">
          <?php for($i=1; $i<=3; ++$i){  ?>
            <div class="slide-item">
              <img src="/skins/default/img/lang/<?=$langs?>/slide<?=$i?>.png" alt="Childrens-dream">
            </div>
          <?php } ?>
        </div>
        <div class="prev-slide">
          <span class="icon-right"></span>
        </div>
        <div class="clear"></div>
      </div>
    </div>
  </div>
</div>


<div class="staticText st-1" id="about">
  <div class="text-item">
    <div class="hText">
      <table>
        <tr>
          <td><span class="line"></span></td>
          <td><span><?=$mess['ABOUT_US'];?></span></td>
          <td><span class="line"></span></td>
        </tr>
      </table>
    </div>
    <div class="descriptinText">
      <div class="item-left">
        <p><?=$mess['ABOUT_TEXT1'];?></p>
        <p><?=$mess['ABOUT_TEXT2'];?></p>
        <p><?=$mess['ABOUT_TEXT3'];?></p>
        <p><?=$mess['ABOUT_TEXT4'];?></p>
        <p><?=$mess['ABOUT_TEXT5'];?></p>
      </div>
      <div class="item-right">
        <img src="/skins/default/img/cd-static.png" alt="Childrens-dream" title="Childrens-dream">
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>


<div class="catalog st-1" id="catalog">
  <div class="text-item">
    <div class="hText">
      <table>
        <tr>
          <td><span class="line"></span></td>
          <td><span><?=$mess['CATALOG'];?></span></td>
          <td><span class="line"></span></td>
        </tr>
      </table>
    </div>
  </div>
  <div class="catalog-list">
    <?php if($catalog->num_rows > 0){
      while($el = $catalog->fetch_assoc()){ ?>
        <div class="el-item">
          <div class="photos">
            <a href="<?=(isset($lang)? '/ru/' : '/')?>catalog/<?=$el['seo_name']?>"><img src="<?=hsc($el['anons_photo'])?>" alt="Childreans-dream" title="Childreans-dream"></a>
          </div>
          <div class="desk-info">
            <a href="<?=(isset($lang)? '/ru/' : '/')?>catalog/<?=$el['seo_name']?>"><span><?=hsc($el['name'])?></span></a>
            <p><?=hsc($el['price'])?> <?=$mess['PRICE'];?></p>
            <p class="aviability">
              <span class="<?=(((int)$el['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
              <span><?=(((int)$el['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
            </p>
          </div>
        </div>
    <?php
      }
     } else { ?>
    <div class="no-element"><?=$mess['NO_ELEMETN']?></div>
    <?php } ?>
    <div class="clear"></div>
  </div>
</div>


<div class="staticText st-2" id="payment">
  <div class="text-item">
    <div class="hText">
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
        <img src="/skins/default/img/car.png" alt="Childrens-dream" title="Childrens-dream">
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>


<div class="call-me st-1" id="call">
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
  <div class="form-call">
    <? if(isset($info)){?>
    <p class="info-call this-ok"><?=$mess['OK_MESSAGE']?></p>
    <? } else { ?>
    <p class="info-call"><?=$mess['CALL_TEXT1']?><b><?=$mess['CALL_TEXT2']?></b><?=$mess['CALL_TEXT3']?><b><?=$mess['CALL_TEXT4']?></b>, <b><?=$mess['CALL_TEXT5']?></b></p>
    <? } ?>
    <form action="#call" method="post" onsubmit="return callMe();">
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
        <img src="/modules/static/captcha.php">
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
    <div class="clear"></div>
  </div>
</div>