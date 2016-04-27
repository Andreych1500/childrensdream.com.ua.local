<div class="add-content">
    <span class="add-element">Редагування відгуку</span>
    <a href="/admin/mails/" class="back-menu">Інші відгуки</a>
    <div class="bottom-line-edit"></div>
    <div class="add-block-form">
        <form action="" method="post">
            <!-- tabs -->
            <input type="radio" name="tabs" id="tabs1" checked>
            <label for="tabs1">Елемент</label>

            <!-- element tabs -->
            <div class="bTabs">

                <div class="table-style">
                    <div class="headers-line">Настройки листа</div>
                    <div class="input-value">
                        <p>Назва ua<span>*</span></p>
                        <input type="text" class="<?=((isset($errors['name_ua']))? "errors" : "")?>"  name="name_ua" value="<?=((isset($errors))? hsc($_POST['name_ua']) : hsc($row['name_ua']))?>">
                    </div>
                    <div class="input-value">
                        <p>Назва ru<span>*</span></p>
                        <input type="text" class="<?=((isset($errors['name_ru']))? "errors" : "")?>"  name="name_ru" value="<?=((isset($errors))? hsc($_POST['name_ru']) : hsc($row['name_ru']))?>">
                    </div>
                    <div class="input-value">
                        <p>ID популярних товарів<span>*</span></p>
                        <input type="text" class="<?=((isset($errors['ids_goods']))? "errors" : "")?>"  name="ids_goods" value="<?=((isset($errors))? hsc($_POST['ids_goods']) : hsc($row['ids_goods']))?>">
                    </div>
                    <div class="input-value">
                        <p>Код листа<span>*</span></p>
                        <input disabled type="text" class="<?=((isset($errors['code']))? "errors" : "")?>"  name="code" value="<?=((isset($errors))? hsc($_POST['code']) : hsc($row['code']))?>">
                    </div>
                    <div class="input-value">
                        <p>Ким відправлено<span>*</span></p>
                        <input type="text" class="<?=((isset($errors['from_mail']))? "errors" : "")?>"  name="from_mail" value="<?=((isset($errors))? Core::$MAIL_FROM : Core::$MAIL_FROM)?>">
                    </div>
                    <div class="input-value">
                        <p>Кому<span>*</span></p>
                        <input type="text" class="<?=((isset($errors['to_mail']))? "errors" : "")?>"  name="to_mail" value="<?=((isset($errors))? hsc($_POST['to_mail']) : hsc($row['to_mail']))?>">
                    </div>
                    <div class="input-value">
                        <p>Тип листа</p>
                        <select name="type">
                            <?php foreach(Core::$LOGIC['type_list'] as $k=>$v){ ?>
                                <option value="<?=$v;?>" <?=(((isset($errors) && $_POST['type'] == $v) || ($row['type'] == $v && !isset($errors)) )? 'selected="selected"' : "")?>>
                                    <?=$v;?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                </div>

            </div>
            <!-- end element tabs -->

            <input type="submit" value="Зберегти" name="ok">
        </form>
    </div>
</div>