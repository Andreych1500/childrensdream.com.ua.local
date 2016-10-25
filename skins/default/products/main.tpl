<?php if($_GET['page'] == 'main'){ ?>
  <meta itemprop="name" content="<?=$mess['PRODUCTS_CD']?>">
  <div class="products" itemscope itemtype="http://schema.org/ItemList">
    <div class="block-title">
      <span class="line"></span>
      <h2 itemprop="name"><?=$mess['DETSKIE_MATRACI']?></h2>
      <span class="line"></span>
    </div>

    <?php if($products->num_rows > 0){
      while($el = $products->fetch_assoc()){ ?>
        <div class="mattress" itemprop="itemListElement" itemscope itemtype="http://schema.org/Product">
          <a class="photos" href="<?=$link_lang?>products/<?=hsc($el['symbol_code'])?>/" itemprop="url">
            <img src="<?=hsc($el['img_anons'])?>" alt="<?=hsc($el['img_seo_alt_'.$lang])?>" itemprop="image"> </a>
          <a class="links" href="<?=$link_lang?>products/<?=hsc($el['symbol_code'])?>/">
            <span itemprop="name"><?=hsc($el['name_'.$lang])?></span> </a>
          <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
            <p class="price"><?=number_format(hsc($el['price']), 0, ',', ' ')?> <?=$mess['PRICE']?></p>
            <p class="aviability">
              <span class="<?=(((int)$el['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
              <?=(((int)$el['availability'] == 1)? '<link itemprop="availability" href="http://schema.org/InStock">' : '<link itemprop="availability" href="http://schema.org/OutOfStock">')?>
              <span><?=(((int)$el['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
            </p>
            <link itemprop="itemCondition" href="http://schema.org/NewCondition">
            <meta itemprop="seller" content="Children's Dream">
            <meta itemprop="price" content="<?=hsc($el['price'])?>.00">
            <meta itemprop="priceCurrency" content="UAH">
          </div>
          <meta itemprop="description" content="<?=hsc($el['description_'.$lang])?>">
          <meta itemprop="brand" content="Children's Dream">
        </div>
      <?php }
    } else { ?>
      <div class="no-element"><?=$mess['NO_ELEMETN']?></div>
    <?php } ?>
  </div>
  <section class="information-shop sec-product">
    <div class="information-block">
      <h1><?=$mess['PRODUCTS_CD']?></h1>
      <?=$mess['TEXT_PRODUCTS_CD']?>
    </div>
  </section>

<?php } else { ?>

  <div class="mattress-detail" itemscope itemtype="http://schema.org/Product">
    <meta itemprop="name" content="<?=hsc($arResult['name_'.$lang])?>">
    <meta itemprop="description" content="<?=hsc($arResult['description_'.$lang])?>">
    <meta itemprop="brand" content="Children's Dream">
    <meta itemprop="category" content="<?=$mess['MATRASES']?>">
    <meta itemprop="weight" content="<?=(int)$arResult['weight'].' '.$mess['KG']?>">

    <?php if(isset($photos)){ ?>
      <div class="slider-detail">
        <div class="slider-nav <?=((count($photos) > 3)? 'center-photo' : 'currenc')?>">
          <?php foreach($photos as $key => $value){ ?>
            <div class="items-photo"><img src="<?=hsc($value[0])?>" alt="<?=hsc($arResult['img_seo_alt_'.$lang])?>">
            </div>
          <?php } ?>
        </div>

        <div class="slider-for <?=((count($photos) > 3)? '' : 'good-top')?>">
          <?php foreach($photos as $key => $value){ ?>
            <div class="item-photo">
              <img <?=(($key == 0)? 'itemprop="image"' : '')?> src="<?=hsc($value[0])?>" alt="<?=hsc($arResult['img_seo_alt_'.$lang])?>" title="<?=hsc($arResult['name_'.$lang])?>" onclick="modalPhoto(this,'Y');">
            </div>
          <?php } ?>
        </div>
      </div>
    <?php } ?>

    <div class="goods <?=(!isset($photos)? 'good-view' : '')?>" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
      <h1><?=hsc($arResult['name_'.$lang])?></h1>
      <p>
        <span class="<?=(((int)$arResult['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
        <?=(((int)$arResult['availability'] == 1)? '<link itemprop="availability" href="http://schema.org/InStock">' : '<link itemprop="availability" href="http://schema.org/OutOfStock">')?>
        <span><?=(((int)$arResult['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
      </p>
      <p><?=hsc($arResult['description_'.$lang])?></p>

      <?php if($arResult['availability'] == 1){ ?>
        <p class="price"><?=number_format(hsc($arResult['price']), 0, ',', ' ')?> <?=$mess['PRICE']?></p>
        <div class="add-shop <?=(!empty($basket)? $basket : '')?>" <?php if(empty($basket)){ ?> onclick="addToCard(<?=(int)$arResult['id']?>,'<?=$mess['BASKETOK']?>','1')"<?php } ?>>
          <?=(empty($basket)? '<span class="icon-basket"></span>' : '')?>
          <?=(!empty($basket)? $mess['BASKETOK'] : $mess['ADDSHOP'])?>
        </div>
      <?php } ?>
      <meta itemprop="price" content="<?=hsc($arResult['price'])?>.00">
      <meta itemprop="priceCurrency" content="UAH">
      <link itemprop="itemCondition" href="http://schema.org/NewCondition">
      <meta itemprop="seller" content="Children's Dream">
      <meta itemprop="warranty" content="<?=(int)$arResult['garanty'].' '.$mess['MONTH']?>">
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
      <div class="circle-photo">
        <img src="<?=hsc($arResult['img_circle'])?>" alt="<?=hsc($arResult['name_'.$lang])?>" title="<?=hsc($arResult['img_seo_alt_'.$lang])?>">
      </div>
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
        <td><?=((empty($arResult['anatoming']))? '-' : (((int)$arResult['anatoming'] == 1)? $mess['NO'] : $mess['YES']))?></td>
      </tr>
      <tr>
        <td><?=$mess['ORTOPEDING']?></td>
        <td><?=((empty($arResult['ortopeding']))? '-' : (((int)$arResult['ortopeding'] == 1)? $mess['NO'] : $mess['YES']))?></td>
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
        <span class="icon-cross"></span> <span class="btnModal-right icon-top"></span>
        <div class="modalMain"></div>
        <span class="btnModal-left icon-bottom"></span>
      </div>
    </div>
  </div>
<?php } ?>