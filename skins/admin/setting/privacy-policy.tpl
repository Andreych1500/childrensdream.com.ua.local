<div class="section-interface-k2">
  <div class="line-custom-edit">
    <p class="header-name-edit"><?=$mess['Документація']?></p>
  </div>

  <!-- Menu tabs --->
  <ul class="tabs-panel"></ul>

  <form class="content-form" action="" method="post">

    <!-- Element tabs -->
    <div class="tabs active-block-tabs">
      <div class="header-line">UA</div>
      <div class="input-value redactor">
        <textarea <?=(isset($check['text_ua'])? $check['text_ua'] : '')?> name="text_ua"><?=((isset($error))? hsc($_POST['text_ua']) : $arResult['text_ua'])?></textarea>
      </div>

      <div class="header-line">RU</div>
      <div class="input-value redactor">
        <textarea <?=(isset($check['text_ru'])? $check['text_ru'] : '')?> name="text_ru"><?=((isset($error))? hsc($_POST['text_ru']) : $arResult['text_ru'])?></textarea>
      </div>
    </div>

    <input type="submit" value="<?=$messG['Зберегти']?>" name="ok">
  </form>
</div>