<div class="add-content">
    <span class="add-element">Зв'язатись з нами</span>
    <a href="/admin/call-me/" class="back-menu">Інші звертання</a>
    <div class="add-block-form">
        <form action="" method="post" enctype="multipart/form-data">
          <div class="spec-list">
            <p class="st-form">
                <span>Від кого:</span>
                <span><?=hsc($arResult['email'])?></span>
            </p>
            <p class="st-form">
                <span>Тема:</span>
                <span><?=hsc($arResult['thems'])?></span>
            </p>
            <p class="st-form">
                <span>Дата:</span>
                <span><?=hsc($arResult['date_create'])?></span>
            </p>
            <p class="st-text">Доброго Дня,<br><br><?=nl2br(hsc($arResult['text']))?></p>
          </div>
        </form>
    </div>
</div>
