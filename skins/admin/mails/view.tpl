<div class="add-content">
    <span class="add-element"><?=hsc($arResult['name'])?></span>
    <a href="/admin/mails/" class="back-menu">Інші Листи</a>
    <div class="bottom-line"></div>
    <div class="add-block-form">
      <form action="" method="post" onsubmit="return okFrom();">
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

        <div class="spec-list">
          <p class="st-form">
              <span>Кому:</span>
              <span><?=hsc($arResult['to_mail'])?></span>
          </p>
          <p class="st-form">
              <span>Тип листа:</span>
              <span><?=hsc($arResult['type'])?></span>
          </p>
          <label>ua:<input type="radio" name="lang_send" value="ua" checked></label>
          <label>ru:<input type="radio" name="lang_send" value="ru"></label>
          <input type="submit" name="send" value="Відправити Тестовий лист">
        </div>
      </form>
    </div>
</div>
