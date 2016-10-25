<div class="main-banner">
  <div class="slide-list">
    <?php
    $j = 0;
    while($arResult = $main_banner->fetch_assoc()){ ?>
      <div class="slide-item <?=(($j == 0)? 'active-slide' : '')?>">
        <img src="<?=hsc($arResult['img_'.$lang])?>" alt="<?=hsc($arResult['img_seo_alt_'.$lang])?>">
      </div>
      <?php ++$j;
    } ?>
    <div class="row-slide">
      <?php for($i = 0; $i < $j; ++$i){ ?>
        <span class="<?=(($i == 0)? 'active-row' : '')?>"></span>
      <?php } ?>
    </div>
  </div>
</div>

<div class="about-text" id="about">
  <div class="about-block">
    <div class="block-title">
      <span class="line"></span>
      <p class="title-text"><?=$messG['ABOUT_US']?></p>
      <span class="line"></span>
    </div>
    <?=$mess['ABOUT_TEXT']?>
    <img src="/skins/default/img/cd-static.png" alt="Children's Dream" title="Children's Dream">
  </div>
</div>

<div class="products" itemscope itemtype="http://schema.org/ItemList">
  <div class="block-title">
    <span class="line"></span>
    <p itemprop="name"><?=$mess['DETSKIE_MATRACI']?></p>
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
    <?php } ?>
    <div class="block-title">
      <span class="line"></span>
      <p class="more-el"><?=$mess['MORE']?>
        <span class="icon-bottom"></span><input type="hidden" name="more-el" value="3|<?=$lang?>"></p>
      <span class="line"></span>
    </div>
  <?php } else { ?>
    <div class="no-element"><?=$mess['NO_ELEMETN']?></div>
  <?php } ?>
</div>

<div class="information-shop">
  <div class="information-block">
    <h1 itemprop="name"><?=$mess['MAIN_TEXT_H1']?></h1>
    <?=$mess['MAIN_TEXT']?>
    <ul>
      <li><?=$mess['MAIN_TEXT_LIST1']?></li>
      <li><?=$mess['MAIN_TEXT_LIST2']?></li>
      <li><?=$mess['MAIN_TEXT_LIST3']?></li>
    </ul>
  </div>
</div>

<div class="delivery-payment" id="payment">
  <div class="delivery-block">
    <div class="block-title">
      <span class="line"></span>
      <p><?=$mess['SERVICES_TEXT0']?></p>
      <span class="line"></span>
    </div>
    <p><strong><?=$mess['SERVICES_TEXT1']?></strong></p>
    <p><?=$mess['SERVICES_TEXT2']?></p>
    <ul>
      <li><?=$mess['SERVICES_TEXT3']?></li>
      <li><?=$mess['SERVICES_TEXT4']?></li>
      <li><?=$mess['SERVICES_TEXT5']?></li>
      <li><?=$mess['SERVICES_TEXT6']?></li>
    </ul>
    <p><strong><?=$mess['SERVICES_TEXT7']?></strong></p>
    <p><?=$mess['SERVICES_TEXT8']?></p>
    <p><?=$mess['SERVICES_TEXT9']?></p>
    <ul>
      <li><?=$mess['SERVICES_TEXT10']?></li>
      <li><?=$mess['SERVICES_TEXT11']?></li>
      <li><?=$mess['SERVICES_TEXT12']?></li>
      <li><?=$mess['SERVICES_TEXT13']?></li>
    </ul>
    <img src="/skins/default/img/car.png" alt="<?=$mess['SERVICES_TEXT0']?>" title="<?=$mess['SERVICES_TEXT0']?>">
  </div>
</div>

<div class="contact" id="call">
  <div class="block-title">
    <span class="line"></span>
    <p><?=$mess['CONTACTS']?></p>
    <span class="line"></span>
  </div>

  <?php if(isset($info) && $info['text'] == '#call_me'){ ?>
    <p class="info-call this-ok"><?=$mess['OK_MESSAGE1']?></p><p><?=$mess['OK_MESSAGE2']?></p>
  <?php } else { ?>
    <p class="info-call"><?=$mess['MAIN_CALL_TEXT']?></p>
    <form name="contact" action="#call" method="post" onsubmit="return checkForm('contact');">
      <div class="name-email">
        <p><?=$mess['CALL_NAME']?><span>*</span></p>
        <input <?=(isset($check['name'])? $check['name'] : '')?> type="text" name="name" value="<?=(isset($_POST['name'])? hsc($_POST['name']) : "")?>">
      </div>
      <div class="name-email">
        <p><?=$mess['CALL_EMAIL']?><span>*</span></p>
        <input <?=(isset($check['email'])? $check['email'] : '')?> type="email" name="email" value="<?=(isset($_POST['email'])? hsc($_POST['email']) : "")?>">
      </div>
      <p class="them"><?=$mess['CALL_THEM']?><span>*</span></p>
      <input <?=(isset($check['them'])? $check['them'] : '')?> type="text" name="them" value="<?=(isset($_POST['them'])? hsc($_POST['them']) : "")?>">
      <p class="form-text"><?=$mess['CALL_TEXT']?><span>*</span></p>
      <textarea <?=(isset($check['text'])? $check['text'] : '')?> name="text"><?=(isset($_POST['text'])? hsc($_POST['text']) : "")?></textarea>
      <img class="capcha" alt="capcha" src="/modules/static/captcha.php">
      <div class="acces-capcha">
        <p><?=$mess['CAPCHA']?><span>*</span></p>
        <input <?=(isset($check['capcha'])? $check['capcha'] : '')?> type="text" name="capcha" value="">
      </div>
      <input type="submit" value="<?=$mess['SUBMIT']?>" name="ok">
      <?php if(isset($limit) && $limit == 'N'){ ?>
        <p class="limit"><?=$mess['LIMIT']?></p>
      <?php } ?>
    </form>
  <?php } ?>
</div>