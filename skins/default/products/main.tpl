<?php if($_GET['page'] == 'main'){ ?>
<div class="products" itemscope itemtype="http://schema.org/ItemList">
  <div class="block-title">
    <span class="line"></span>
    <h1><?=$mess['DETSKIE_MATRACI'];?></h1>
    <span class="line"></span>
  </div>

  <?php if($products->num_rows > 0){ ?>
    <?php while($arResult = $products->fetch_assoc()){ ?>
    <div class="mattress" itemprop="itemListElement" itemscope itemtype="http://schema.org/Product">
      <a class="photos" href="<?=$link_langs?>products/<?=$arResult['seo_name']?>/" itemprop="url">
        <img src="<?=hsc($arResult['cAnonsPhoto'])?>" alt="<?=hsc($arResult['img_seo_alt_'.$lang])?>" itemprop="image">
      </a>
      <a class="links" href="<?=$link_langs?>products/<?=$arResult['seo_name']?>/"  itemprop="url">
        <span itemprop="name"><?=hsc($arResult['name_'.$lang])?></span>
      </a>
      <p class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        <span itemprop="price" content="<?=hsc($arResult['price'])?>.00"><?=number_format(hsc($arResult['price']), 0, ',', ' ')?></span>
        <span itemprop="priceCurrency" content="UAH"><?=$mess['PRICE'];?></span>
      </p>
      <p class="aviability" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        <span class="<?=(((int)$arResult['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
        <?=(((int)$arResult['availability'] == 1)? '<link itemprop="availability" href="http://schema.org/InStock">' : '<link itemprop="availability" href="http://schema.org/OutOfStock">')?>
        <span><?=(((int)$arResult['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
      </p>
      <meta itemprop="description" content="<?=hsc($arResult['description_'.$lang])?>">
      <meta itemprop="brand" content="Children's Dream">
    </div>
    <?php } ?>
  <?php } else { ?>
  <div class="no-element"><?=$mess['NO_ELEMETN']?></div>
  <?php } ?>
</div>

<?php } else { ?>

<div class="mattress-detail" itemscope itemtype="http://schema.org/Product">
  <meta itemprop="name" content="<?=hsc($arResult['name_'.$lang])?>">
  <meta itemprop="description" content="<?=hsc($arResult['description_'.$lang])?>">
  <meta itemprop="brand" content="Children's Dream">
  <?php if(isset($photos)){ ?>
  <div class="slider-detail">
    <div class="slider-nav <?=((count($photos) > 3)? 'center-photo' : 'currenc')?>">
      <?php foreach($photos as $key => $value){ ?>
        <div class="items-photo"><img src="<?=hsc($value[0])?>" alt="<?=hsc($arResult['img_seo_alt_'.$lang])?>"></div>
      <?php } ?>
    </div>

    <div class="slider-for <?=((count($photos) > 3)? '' : 'good-top')?>">
      <?php foreach($photos as $key => $value){ ?>
        <div class="item-photo" onclick="modalPhoto();"><img <?=(($key == 0)? 'itemprop="image"' : '')?> src="<?=hsc($value[0])?>" alt="<?=hsc($arResult['img_seo_alt_'.$lang])?>" title="<?=hsc($arResult['name_'.$lang])?>"></div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>

  <div class="goods <?=(!isset($photos)? 'good-view' : '')?>" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
    <h1 itemprop="name"><?=hsc($arResult['name_'.$lang])?></h1>
    <p>
      <span class="<?=(((int)$arResult['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
      <?=(((int)$arResult['availability'] == 1)? '<link itemprop="availability" href="http://schema.org/InStock">' : '<link itemprop="availability" href="http://schema.org/OutOfStock">')?>
      <span><?=(((int)$arResult['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
    </p>
    <p><?=hsc($arResult['description_'.$lang])?></p>

    <?php if($arResult['availability'] == 1){ ?>
    <p class="price">
      <span itemprop="price" content="<?=hsc($arResult['price'])?>.00"><?=number_format(hsc($arResult['price']), 0, ',', ' ')?></span>
      <span itemprop="priceCurrency" content="UAH"><?=$mess['PRICE'];?></span>
    </p>
    <div class="add-shop <?=(!empty($basket)? $basket : '')?>" <?php if(empty($basket)){ ?> onclick="addToCard(<?=(int)$arResult['id']?>,'<?=$mess['BASKETOK']?>','1')"<?php }?>>
        <?=(empty($basket)? '<span class="icon-basket"></span>' : '')?>
        <?=(!empty($basket)? $mess['BASKETOK'] : $mess['ADDSHOP'])?>
    </div>
    <?php } ?>
  </div>
</div>

<div class="description">
  <div class="description-block">
    <div class="block-title">
      <span class="line"></span>
      <p><?=$mess['MIN_OPUS']?></p>
      <span class="line"></span>
    </div>
    <div class="description-text" itemprop="description"><?=nl2br(hsc($arResult['text_'.$lang]))?></div>
    <div class="circle-photo"><img src="<?=hsc($arResult['cCirklePhoto'])?>" alt="<?=hsc($arResult['name_'.$lang])?>" title="<?=hsc($arResult['img_seo_alt_'.$lang])?>"></div>
  </div>
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
      <td><?=((empty(hsc($arResult['form_'.$lang])))? '-' : hsc($arResult['form_'.$lang]))?></td>
    </tr>
    <tr>
      <td><?=$mess['TYPE']?></td>
      <td><?=((empty(hsc($arResult['type_'.$lang])))? '-' : hsc($arResult['type_'.$lang]))?></td>
    </tr>
    <tr>
      <td><?=$mess['SIZE']?></td>
      <td><?=((empty($arResult['size']))? '-' : hsc($arResult['size']))?></td>
    </tr>
    <tr>
      <td><?=$mess['WEIGHT']?></td>
      <td><?=((empty($arResult['weight']))? '-' : (int)$arResult['weight'].' '.$mess['KG'])?></td>
    </tr>
    <tr>
      <td><?=$mess['HEIGHT']?></td>
      <td><?=((empty($arResult['height']))? '-' : (int)$arResult['height'].' '.$mess['SM'])?></td>
    </tr>
    <tr>
      <td><?=$mess['RIGIDITY']?></td>
      <td><?=((empty(hsc($arResult['rigidity_'.$lang])))? '-' : hsc($arResult['rigidity_'.$lang]))?></td>
    </tr>
    <tr>
      <td><?=$mess['ANATOMING']?></td>
      <td><?=((empty($arResult['anatoming']))? '-' : (((int)$arResult['anatoming'] == 1)? $mess['NO'] : $mess['YES'] ))?></td>
    </tr>
    <tr>
      <td><?=$mess['ORTOPEDING']?></td>
      <td><?=((empty($arResult['ortopeding']))? '-' : (((int)$arResult['ortopeding'] == 1)? $mess['NO'] : $mess['YES'] ))?></td>
    </tr>
    <tr>
      <td><?=$mess['GARANTY']?></td>
      <td><?=((empty($arResult['garanty']))? '-' : (int)$arResult['garanty'].' '.$mess['MONTH'])?></td>
    </tr>
  </table>
</div>

<div class="fixed-overlay">
  <div class="modal">
    <div class="modal_container">
      <span class="icon-close"></span>
      <span class="btnModal-right icon-top"></span>
      <div class="modalMain"></div>
      <span class="btnModal-left icon-bottom"></span>
    </div>
  </div>
</div>
<?php } ?>