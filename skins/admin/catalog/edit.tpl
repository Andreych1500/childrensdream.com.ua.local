<div class="commentview add-shop">
  <div class="comment-list">
    <form method="post" action="" enctype="multipart/form-data">
      <div class="edit-style catalog-style">
        <div class="input-value">
          <p>Назва товару<span>*</span></p>
          <input type="text" class="<?=((isset($errors['name']))? "errors" : "")?>"  name="name" value="<?=((isset($errors))? hsc($_POST['name']) : hsc($row['name']))?>">
        </div>
        <div class="input-value">
          <p>Назва товару (ru)<span>*</span></p>
          <input type="text" class="<?=((isset($errors['name_ru']))? "errors" : "")?>"  name="name_ru" value="<?=((isset($errors))? hsc($_POST['name_ru']) : hsc($row['name_ru']))?>">
        </div>
        <div class="input-value">
          <p>Символьний код<span>*</span></p>
          <input disabled type="text" class="<?=((isset($errors['seo_el_name']))? "errors" : "")?>"  name="seo_name" value="<?=((isset($errors))? hsc($row['seo_name']) : hsc($row['seo_name']))?>">
          <input type="hidden" name="seo_el_name" value="<?=((isset($errors))? hsc($row['seo_name']) : hsc($row['seo_name']))?>">
        </div>
        <div class="input-value">
          <p>Сортування</p>
          <input type="number" step="1" min="1"  name="sort" value="<?=((isset($errors))? hsc($_POST['sort']) : hsc($row['sort']))?>">
        </div>
        <div class="input-value">
          <p>Наявність</p>
          <input type="checkbox" <?=((isset($errors,$_POST['availability']) || ($row['availability'] == 1 && !isset($errors)))? "checked=\"checked\"" : "")?> name="availability" value="yes">
        </div>
        <div class="input-value">
          <p>Ціна товару (грн.)<span>*</span></p>
          <input type="text" class="<?=((isset($errors['price']))? "errors" : "")?>"  name="price" value="<?=((isset($errors))? hsc($_POST['price']) : (int)$row['price'])?>">
        </div>
        <div class="input-value">
          <p>Форма матрацу</p>
          <input type="text"  name="form" value="<?=((isset($errors))? hsc($_POST['form']) : hsc($row['form']))?>">
        </div>
        <div class="input-value">
          <p>Форма матрацу (ru)</p>
          <input type="text"  name="form_ru" value="<?=((isset($errors))? hsc($_POST['form_ru']) : hsc($row['form_ru']))?>">
        </div>
        <div class="input-value">
          <p>Тип матрацу</p>
          <input type="text" name="type" value="<?=((isset($errors))? hsc($_POST['type']) : hsc($row['type']))?>">
        </div>
        <div class="input-value">
          <p>Тип матрацу (ru)</p>
          <input type="text" name="type_ru" value="<?=((isset($errors))? hsc($_POST['type_ru']) : hsc($row['type_ru']))?>">
        </div>
        <div class="input-value">
          <p>Розмір (тип "N x N")</p>
          <input type="text"  name="size" value="<?=((isset($errors))? hsc($_POST['size']) : hsc($row['size']))?>">
        </div>
        <div class="input-value">
          <p>Вага (кг.)</p>
          <input type="number" step="1" min="0"  name="weight" value="<?=((isset($errors))? (int)$_POST['weight'] :  (int)$row['weight'])?>">
        </div>
        <div class="input-value">
          <p>Висота (см.)</p>
          <input type="number" step="1" min="0" name="height" value="<?=((isset($errors))? (int)$_POST['height'] :  (int)$row['height'])?>">
        </div>
        <div class="input-value">
          <p>Жорсткість</p>
          <input type="text" name="rigidity" value="<?=((isset($errors))? hsc($_POST['rigidity']) : hsc($row['rigidity']))?>">
        </div>
        <div class="input-value">
          <p>Жорсткість (ru)</p>
          <input type="text" name="rigidity_ru" value="<?=((isset($errors))? hsc($_POST['rigidity_ru']) : hsc($row['rigidity_ru']))?>">
        </div>
        <div class="input-value">
          <p>Анатомічні властивості</p>
          <select name="anatoming">
            <?php foreach(Core::$LOGIC as $k=>$v){ ?>
              <option value="<?=$k;?>" <?=(((isset($errors) && $_POST['anatoming'] == $k) || ((int)$row['anatoming'] == $k && !isset($errors)) )? 'selected="selected"' : "")?>>
                <?=$v;?>
              </option>
            <?php } ?>
          </select>
        </div>
        <div class="input-value">
          <p>Ортопедичні властивості</p>
          <select name="ortopeding">
            <?php foreach(Core::$LOGIC as $k=>$v){ ?>
              <option value="<?=$k;?>" <?=(((isset($errors) && $_POST['ortopeding'] == $k) || ((int)$row['ortopeding'] == $k && !isset($errors)) )? 'selected="selected"' : "")?>>
                <?=$v; ?>
              </option>
            <?php } ?>
          </select>
        </div>
        <div class="input-value">
          <p>Гарантійний термін</p>
          <input type="number" step="1" min="0" name="garanty" value="<?=((isset($errors))? (int)$_POST['garanty'] :  (int)$row['garanty'])?>">
        </div>
        <div class="input-value">
          <p>Короткий опис матрацу<span>*</span></p>
          <textarea class="<?=((isset($errors['description']))? "errors" : "")?>" name="description"><?=((isset($errors))? hsc($_POST['description']) : hsc($row['description']))?></textarea>
        </div>
        <div class="input-value">
          <p>Короткий опис матрацу (ru)<span>*</span></p>
          <textarea class="<?=((isset($errors['description_ru']))? "errors" : "")?>" name="description_ru"><?=((isset($errors))? hsc($_POST['description_ru']) : hsc($row['description_ru']))?></textarea>
        </div>
        <div class="input-value">
          <p>Текст матрацу<span>*</span></p>
          <textarea class="<?=((isset($errors['text']))? "errors" : "")?>" name="text"><?=((isset($errors))? hsc($_POST['text']) : hsc($row['text']))?></textarea>
        </div>
        <div class="input-value">
          <p>Текст матрацу (ru)<span>*</span></p>
          <textarea class="<?=((isset($errors['text_ru']))? "errors" : "")?>" name="text_ru"><?=((isset($errors))? hsc($_POST['text_ru']) : hsc($row['text_ru']))?></textarea>
        </div>

        <div class="input-value upload_file" id="annons_photo" rel_size="<?=Core::$SIZE_PHOTO['annons']?>">
          <p>Фото для анонсу</p>
          <button type="button" onclick="clickOninput(this)">Вибрати файл</button>
          <div class="up_file_text"><?=((isset($errors))? (!empty($anons_photo[0])? hsc($anons_photo[0]) : "Файл не вибраний") : ((empty($row['anons_photo']))? ((isset($_POST['anons_photo']))? '' : 'Файл не вибраний') : hsc($row['anons_photo'])))?></div>
          <input type="hidden" value="<?=((isset($errors))? hsc($_POST['anons_photo']) : hsc($row['anons_photo']))?>" name="anons_photo">
          <input type="hidden" value="<?=((isset($errors,$_POST['del_anons']))? hsc($_POST['del_anons']) : "")?>" name="del_anons">
          <div class="photos <?=((!empty($_POST['anons_photo']))? '' : ((!empty($row['anons_photo']))? '' : "hidden"))?>"><img src="<?=((isset($_POST['anons_photo']))? hsc($anons_photo[0]) : hsc($row['anons_photo']) )?>"></div>
        </div>

        <div class="input-value upload_file" id="descrip_photo" rel_size="<?=Core::$SIZE_PHOTO['descrip']?>">
          <p>Фото для опису</p>
          <button type="button" onclick="clickOninput(this)">Вибрати файл</button>
          <div class="up_file_text"><?=((isset($errors))? (!empty($descrip_photo[0])? hsc($descrip_photo[0]) : "Файл не вибраний") : ((empty($row['descrip_photo']))? ((isset($_POST['descrip_photo']))? '' : 'Файл не вибраний') : hsc($row['descrip_photo'])))?></div>
          <input type="hidden" value="<?=((isset($errors))? hsc($_POST['descrip_photo']) : hsc($row['descrip_photo']))?>" name="descrip_photo">
          <input type="hidden" value="<?=((isset($errors,$_POST['del_anons']))? hsc($_POST['del_anons']) : "")?>" name="del_anons">
          <div class="photos <?=((!empty($_POST['descrip_photo']))? '' : ((!empty($row['descrip_photo']))? '' : "hidden"))?>"><img src="<?=((isset($_POST['descrip_photo']))? hsc($descrip_photo[0]) : hsc($row['descrip_photo']) )?>"></div>
        </div>

        <?php if((isset($more_photos) && count($more_photos) > 1)) {
          foreach ($more_photos as $key => $file) { ?>
            <div class="input-value upload_file" rel_id="<?=$key?>" id="more_photos_<?=$key?>" rel_size="<?=Core::$SIZE_PHOTO['more']?>">
              <p><?=(($key == 0)? 'Додаткові зображення' : '')?></p>
              <button type="button" onclick="clickOninput(this)">Вибрати файл</button>
              <div class="up_file_text"><?=((isset($errors))? (!empty($more_photos[$key][2])? ((!empty($more_src[$key][2]))? hsc($more_src[$key][2]) : 'Файл не вибраний') : "Файл не вибраний") : ((!empty($file[0]))? hsc($file[2]) : 'Файл не вибраний'))?></div>
              <input type="hidden" value="<?=((isset($errors))? hsc($_POST['more_photos'][$key]) : hsc($file[3]))?>" name="more_photos[]">
              <input type="hidden" value="<?=((isset($errors,$_POST['del_anons']))? hsc($_POST['del_anons']) : "")?>" name="del_more[]">
              <div class="photos <?=((!empty($_POST['more_photos'][$key]))? '' : ((!empty($file[0]) && !isset($errors))? '' : ((!empty($more_src[$key][0]))? '' : "hidden")))?>"><img src="<?=((isset($_POST['more_photos'][$key]))? hsc($more_src[$key][0]) : hsc($more_photos[$key][0]) )?>"></div>
            </div>
          <?php }
        } else { ?>
          <div class="input-value upload_file" rel_id="0" id="more_photos_0" rel_size="<?=Core::$SIZE_PHOTO['more']?>">
            <p>Додаткові зображення</p>
            <button type="button" onclick="clickOninput(this)">Вибрати файл</button>
            <div class="up_file_text"><?=$file_name?></div>
            <input type="hidden" value="<?=$file_value?>" name="more_photos[]">
            <input type="hidden" value="<?=((isset($errors,$_POST['del_anons']))? hsc($_POST['del_anons']) : "")?>" name="del_more[]">
            <div class="photos <?=$file_hidden?>"><img src="<?=$file_photo?>"></div>
          </div>
        <?php } ?>

        <div class="add_more">
          <span>Добавити ще</span>
        </div>
      </div>
      <input type="submit" value="Редагувати" name="ok">
    </form>

    <form id="to_file">
      <input onchange="addPhoto(this,this.value)" rel_size="" rel_to_set="" type="file" name="photo" id="control">
      <input type="hidden" name="del" value="<?=((isset($errors))? "N" : "N")?>">
      <input type="hidden" name="isset" value="N">
      <input type="hidden" name="update" value="Y">
      <p id="clears">Clear</p>
    </form>
  </div>
</div>