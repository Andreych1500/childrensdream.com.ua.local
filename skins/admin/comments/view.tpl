<div class="add-content">
    <span class="add-element">Відгуки</span>
    <a href="/admin/comments/" class="back-menu">Інші відгуки</a>
    <div class="add-block-form">
        <form action="" method="post" enctype="multipart/form-data">
            <div class="spec-list">
                <p class="st-form">
                    <span>Від кого:</span>
                    <span><?=hsc($arResult['email'])?></span>
                </p>
                <p class="st-form">
                    <span>ФІО:</span>
                    <span><?=hsc($arResult['name'])?></span>
                </p>
                <p class="st-form">
                    <span>Дата:</span>
                    <span><?=hsc($arResult['date_create'])?></span>
                </p>
                <p class="st-text"><b>Відгук:</b><br><br><?=nl2br(hsc($arResult['text']))?></p>
            </div>
        </form>
    </div>
</div>
