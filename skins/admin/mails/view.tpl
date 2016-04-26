<div class="add-content">
    <span class="add-element"><?=hsc($arResult['name'])?></span>
    <a href="/admin/mails/" class="back-menu">Інші Листи</a>
    <div class="add-block-form">
      <div class="white-block">
        <div class="spec-list">
          <p class="st-form">
              <span>Кому:</span>
              <span><?=hsc($arResult['to_mail'])?></span>
          </p>
          <p class="st-form">
              <span>Тип листа:</span>
              <span><?=hsc($arResult['type'])?></span>
          </p>
        </div>
        <div class="headers-line">Вигляд листа:</div>
        <div class="mail-veiw">
            <div <?=$body[2]?>div>
        </div>
      </div>
    </div>
</div>
