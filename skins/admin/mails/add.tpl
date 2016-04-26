<div class="add-content">
    <span class="add-element">Додати Елемент</span>
    <a href="/admin/mails/" onclick="cancel();" class="back-menu">Елементи</a>
    <div class="bottom-line"></div>
    <div class="add-block-form">
        <form action="" method="post" enctype="multipart/form-data">
            <!-- tabs -->
            <input type="radio" name="tabs" id="tabs1" checked>
            <label for="tabs1">Елемент</label>

            <!-- element tabs -->
            <div class="bTabs">

                <div class="table-style">
                    <div class="headers-line">Настройки листа</div>
                    <div class="input-value">
                        <p>Назва<span>*</span></p>
                        <input type="text" class="<?=((isset($errors['name']))? "errors" : "")?>"  name="name" value="<?=((isset($errors))? hsc($_POST['name']) : "")?>">
                    </div>
                    <div class="input-value">
                        <p>ID популярних товарів<span>*</span></p>
                        <input type="text" class="<?=((isset($errors['ids_goods']))? "errors" : "")?>"  name="ids_goods" value="<?=((isset($errors))? hsc($_POST['ids_goods']) : "")?>">
                    </div>
                    <div class="input-value">
                        <p>Код листа<span>*</span></p>
                        <input type="text" class="<?=((isset($errors['code']))? "errors" : "")?>"  name="code" value="<?=((isset($errors))? hsc($_POST['code']) : "")?>">
                    </div>
                    <div class="input-value">
                        <p>Кому<span>*</span></p>
                        <input type="text" class="<?=((isset($errors['to_mail']))? "errors" : "")?>"  name="to_mail" value="<?=((isset($errors))? hsc($_POST['to_mail']) : "")?>">
                    </div>
                    <div class="input-value">
                        <p>Тип листа</p>
                        <select name="type">
                            <?php foreach(Core::$LOGIC['type_list'] as $k=>$v){ ?>
                                <option value="<?=$v;?>" <?=(((isset($errors) && $_POST['type'] == $v))? 'selected="selected"' : "")?>>
                                    <?=$v;?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                </div>

            </div>
            <!-- end element tabs -->

            <input type="submit" value="Зберегти" name="ok">
            <span class="cancel" onclick="cancel();">Відмінити</span>
        </form>
    </div>
</div>