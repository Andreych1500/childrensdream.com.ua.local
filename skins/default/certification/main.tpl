<div class="fix-position">
  <div class="block-title">
    <span class="line"></span>
    <h2 itemprop="name"><?=$mess['Сертифікати']?></h2>
    <span class="line"></span>
  </div>
  <div class="certification">
    <?php while($arResult = hsc($certification->fetch_assoc())){ ?>
      <img src="<?=$arResult['img_certification']?>" alt="<?=explode('#|#', $arResult['alt_img'])[$key_lang]?>" onclick="modalPhoto(this,'N');">
    <?php } ?>
  </div>
</div>