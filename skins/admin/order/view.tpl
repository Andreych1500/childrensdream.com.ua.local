<div class="add-content">
    <span class="add-element">Замовлення №<?=(int)$arResult['id']?>  <?=hsc($arResult['date_create'])?></span>
    <a href="/admin/order/" class="back-menu">Усі замовлення</a>
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

<?
wtf($arResult,1);
?>