<?php if($_GET['page'] == 'main'){ ?>

<div class="product">
  <div class="product-list">
    <div class="block-title">
      <span class="line"></span>
      <h1><?=$mess['DETSKIE_MATRACI'];?></h1>
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

<?php } else { ?>
<?/*
<div class="mattress-detail">
  <?php if(isset($photos)){ ?>
  <div class="slider-detail">
    <div class="slider-nav <?=((count($photos) > 3)? 'center-photo' : 'currenc')?>">
      <?php foreach($photos as $key => $value){ ?>
          <div class="items-photo"><img src="<?=hsc($value[0])?>" alt="<?=hsc($el['img_seo_alt_'.$lang])?>"></div>
      <?php } ?>
    </div>

    <div class="slider-for <?=((count($photos) > 3)? '' : 'good-top')?>">
      <?php foreach($photos as $key => $value){ ?>
      <div class="item-photo" onclick="modalPhoto();"><img src="<?=hsc($value[0])?>" alt="<?=hsc($el['img_seo_alt_'.$lang])?>" title="<?=hsc($el['name_'.$lang])?>"></div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>

  <div class="el-text <?=(!isset($photos)? 'good-view' : '')?>">
    <h1 class="name-el"><?=hsc($el['name_'.$lang])?></h1>
    <p class="aviability">
      <span class="<?=(((int)$el['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
      <span><?=(((int)$el['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
    </p>
    <p class="desc-el"><?=hsc($el['description_'.$lang])?></p>

    <?php if($el['availability'] == 1){ ?>
    <div class="el-shop">
      <p><?=number_format(hsc($el['price']), 0, ',', ' ')?> <?=$mess['PRICE'];?></p>
      <div class="add-shop <?=(!empty($basket)? $basket : '')?>" <?php if(empty($basket)){ ?> onclick="addToCard(<?=(int)$el['id']?>,'<?=$mess['BASKETOK']?>','1')"<?php }?>>
          <?=(empty($basket)? '<span class="icon-basket"></span>' : '')?>
          <?=(!empty($basket)? $mess['BASKETOK'] : $mess['ADDSHOP'])?>
      </div>
    </div>
    <?php } ?>
  </div>
</div>
*/?>
<div class="description">
  <div class="block-title">
    <span class="line"></span>
    <p><?=$mess['MIN_OPUS']?></p>
    <span class="line"></span>
  </div>
  <div class="description-text"><?=nl2br(hsc($el['text_'.$lang]))?></div>
  <div class="circle-photo"><img src="<?=hsc($el['cCirklePhoto'])?>" alt="<?=hsc($el['name_'.$lang])?>" title="<?=hsc($el['img_seo_alt_'.$lang])?>"></div>
</div>

<div class="haracteristic">
  <div class="block-title">
    <span class="line"></span>
    <p><?=$mess['HARAKTERISTIC']?></p>
    <span class="line"></span>
  </div>
  <table>
    <tr>
      <td><?=$mess['FORMA']?></td>
      <td><?=((empty(hsc($el['form_'.$lang])))? '-' : hsc($el['form_'.$lang]))?></td>
    </tr>
    <tr>
      <td><?=$mess['TYPE']?></td>
      <td><?=((empty(hsc($el['type_'.$lang])))? '-' : hsc($el['type_'.$lang]))?></td>
    </tr>
    <tr>
      <td><?=$mess['SIZE']?></td>
      <td><?=((empty($el['size']))? '-' : hsc($el['size']))?></td>
    </tr>
    <tr>
      <td><?=$mess['WEIGHT']?></td>
      <td><?=((empty($el['weight']))? '-' : (int)$el['weight'].' '.$mess['KG'])?></td>
    </tr>
    <tr>
      <td><?=$mess['HEIGHT']?></td>
      <td><?=((empty($el['height']))? '-' : (int)$el['height'].' '.$mess['SM'])?></td>
    </tr>
    <tr>
      <td><?=$mess['RIGIDITY']?></td>
      <td><?=((empty(hsc($el['rigidity_'.$lang])))? '-' : hsc($el['rigidity_'.$lang]))?></td>
    </tr>
    <tr>
      <td><?=$mess['ANATOMING']?></td>
      <td><?=((empty($el['anatoming']))? '-' : (((int)$el['anatoming'] == 1)? $mess['NO'] : $mess['YES'] ))?></td>
    </tr>
    <tr>
      <td><?=$mess['ORTOPEDING']?></td>
      <td><?=((empty($el['ortopeding']))? '-' : (((int)$el['ortopeding'] == 1)? $mess['NO'] : $mess['YES'] ))?></td>
    </tr>
    <tr>
      <td><?=$mess['GARANTY']?></td>
      <td><?=((empty($el['garanty']))? '-' : (int)$el['garanty'].' '.$mess['MONTH'])?></td>
    </tr>
  </table>
</div>

    <?/*
<div class="fixed-overlay">
  <div class="modal">
    <div class="modal_container">
      <span class="icon-close"></span>
      <span class="btnModal-right icon-top"></span>
      <div class="modalMain"></div>
      <span class="btnModal-left icon-bottom"></span>
    </div>
  </div>
</div>*/?>

<?php } ?>