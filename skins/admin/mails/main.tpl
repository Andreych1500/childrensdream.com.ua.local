<div class="main-view-content">
    <div class="custom-content-form">
        <form action="" method="post" onsubmit="return okFrom();">
            <div class="line-custom">
                <a href="/admin/mails/add/" class="add-el icon-plus">Добавити елемент</a>
                <input type="submit" value="Видалити" name="delete">
            </div>
            <table class="edFormEdit">
                <tr>
                    <td><input type="checkbox" name="all_cheked"></td>
                    <td></td>
                    <td>Id</td>
                    <td>Кому</td>
                    <td>Код листа</td>
                    <td>Назва листа</td>
                    <td>Тип листа</td>
                </tr>
                <?php while($arResult = $mails->fetch_assoc()){ ?>
                    <tr>
                        <td>
                            <input type="checkbox" name="ids[]" value="<?=$arResult['id']?>">
                        </td>
                        <td>
                            <span class="icon-mob-menu" onclick="openEdit(this);"></span>
                            <div class="menu-edit">
                                <a href="/admin/mails/view?id=<?=(int)$arResult['id']?>">
                                    <span class="icon-content"></span>
                                    Відкрити
                                </a>
                                <a href="/admin/mails/edit?id=<?=(int)$arResult['id']?>">
                                    <span class="icon-content"></span>
                                    Змінити
                                </a>
                                <span class="delete icon-cross" onclick="deleteElement(<?=(int)$arResult['id']?>, this, '<?=Core::$DIR_PHOTOS_AND_DB_TABLE_NAME['mails']?>')">Видалити</span>
                            </div>
                        </td>
                        <td><?=(int)$arResult['id']?></td>
                        <td><?=hsc($arResult['to_mail'])?></td>
                        <td><?=hsc($arResult['code'])?></td>
                        <td><?=hsc($arResult['name'])?></td>
                        <td><?=hsc($arResult['type'])?></td>
                    </tr>
                <?php } ?>
            </table>
        </form>
    </div>
</div>