<div class="add-content">
    <span class="add-element"><?=hsc($arResult['name'])?></span>
    <a href="/admin/mails/" class="back-menu">Інші Листи</a>
    <div class="bottom-line"></div>
    <div class="add-block-form">
      <div class="white-block">
        <!-- tabs -->
        <input type="radio" name="tabs" id="tabs1" checked>
        <label for="tabs1">UA</label>

        <input type="radio" name="tabs" id="tabs2">
        <label for="tabs2">RU</label>

        <!-- element tabs UA-->
        <div class="bTabs">
          <div class="table-style">
            <div class="headers-line">Вигляд листа:</div>
            <div class="mail-veiw"><?=$body_ua?></div>
          </div>
        </div>
        <!-- end element tabs UA-->

        <!-- element tabs RU-->
        <div class="bTabs">
          <div class="table-style">
            <div class="headers-line">Вигляд листа:</div>
            <div class="mail-veiw"><?=$body_ru?></div>
          </div>
        </div>
        <!-- end element tabs RU-->
      </div>
    </div>
</div>
