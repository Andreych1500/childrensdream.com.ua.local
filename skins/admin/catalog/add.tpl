<div class="commentview add-shop">
  <?php if(isset($errors['limit'])){ ?>
    <p class="h1">Товар з таким символьним кодом вже існує!</p>
  <? } ?>
  <div class="comment-list">
    <form method="post" action="" enctype="multipart/form-data">
      <div class="edit-style catalog-style">
        <div class="input-value">
          <p>Назва товару<span>*</span></p>
          <input type="text" class="<?=((isset($errors['name']))? "errors" : "")?>"  name="name" value="<?=((isset($errors))? hsc($_POST['name']) : "")?>">
        </div>
        <div class="input-value">
          <p>Символьний код<span>*</span></p>
          <input type="text" class="<?=((isset($errors['seo_name']))? "errors" : "")?>"  name="seo_name" value="<?=((isset($errors))? hsc($_POST['seo_name']) : "")?>">
        </div>
        <div class="input-value">
          <p>Наявність</p>
          <input type="checkbox" <?=((isset($errors,$_POST['availability']))? "checked=\"checked\"" : "")?> name="availability" value="yes">
        </div>
        <div class="input-value">
          <p>Ціна товару (грн.)<span>*</span></p>
          <input type="text" class="<?=((isset($errors['price']))? "errors" : "")?>"  name="price" value="<?=((isset($errors))? hsc($_POST['price']) : "")?>">
        </div>
        <div class="input-value">
          <p>Форма матрацу</p>
          <input type="text"  name="form" value="<?=((isset($errors))? hsc($_POST['form']) : "")?>">
        </div>
        <div class="input-value">
          <p>Тип матрацу</p>
          <input type="text" name="type" value="<?=((isset($errors))? hsc($_POST['type']) : "")?>">
        </div>
        <div class="input-value">
          <p>Розмір (тип "N x N")</p>
          <input type="text"  name="size" value="<?=((isset($errors))? hsc($_POST['size']) : "")?>">
        </div>
        <div class="input-value">
          <p>Вага (кг.)</p>
          <input type="number" step="1" min="0"  name="weight" value="<?=((isset($errors))? hsc($_POST['weight']) : "")?>">
        </div>
        <div class="input-value">
          <p>Висота (см.)</p>
          <input type="number" step="1" min="0" name="height" value="<?=((isset($errors))? hsc($_POST['height']) : "")?>">
        </div>
        <div class="input-value">
          <p>Жорсткість</p>
          <input type="text" name="rigidity" value="<?=((isset($errors))? hsc($_POST['rigidity']) : "")?>">
        </div>
        <div class="input-value">
          <p>Анатомічні властивості</p>
          <select name="anatoming">
            <?php foreach(Core::$LOGIC as $k=>$v){ ?>
              <option value="<?=$k;?>" <?=((isset($errors) && $_POST['anatoming'] == $k)? 'selected="selected"' : "")?>>
                <?=$v;?>
              </option>
            <?php } ?>
          </select>
        </div>
        <div class="input-value">
          <p>Ортопедичні властивості</p>
          <select name="ortopeding">
            <?php foreach(Core::$LOGIC as $k=>$v){ ?>
              <option value="<?=$k;?>" <?=((isset($errors) && $_POST['ortopeding'] == $k)? 'selected="selected"' : "")?>>
                <?=$v; ?>
              </option>
            <?php } ?>
          </select>
        </div>
        <div class="input-value">
          <p>Гарантійний термін</p>
          <input type="number" step="1" min="0" name="garanty" value="<?=((isset($errors))? hsc($_POST['garanty']) : "")?>">
        </div>
        <div class="input-value">
          <p>Короткий опис матрацу<span>*</span></p>
          <textarea class="<?=((isset($errors['description']))? "errors" : "")?>" name="description"><?=((isset($errors))? hsc($_POST['description']) : "")?></textarea>
        </div>
        <div class="input-value">
          <p>Текст матрацу<span>*</span></p>
          <textarea class="<?=((isset($errors['text']))? "errors" : "")?>" name="text"><?=((isset($errors))? hsc($_POST['text']) : "")?></textarea>
        </div>

        <div class="input-value upload_file" id="annons_photo">
          <p>Фото для анонсу</p>
          <button type="button" onclick="clickOninput(this)">Вибрати файл</button>
          <div class="up_file_text"><?=((isset($errors))? (isset($anons_photo[2])? hsc($anons_photo[2]) : "Файл не вибраний") : "Файл не вибраний")?></div>
          <input type="hidden" value="<?=((isset($errors))? hsc($_POST['anons_photo']) : "")?>" name="anons_photo">
          <input type="hidden" value="<?=((isset($errors,$_POST['del_anons']))? hsc($_POST['del_anons']) : "")?>" name="del_anons">
          <div class="photos <?=((!empty($_POST['anons_photo']))? '' : "hidden")?>"><img src="<?=((!empty($_POST['anons_photo']))? hsc($anons_photo[0]) : '')?>"></div>
        </div>

        <div class="input-value upload_file" id="descrip_photo">
          <p>Фото для опису</p>
          <button type="button" onclick="clickOninput(this)">Вибрати файл</button>
          <div class="up_file_text"><?=((isset($errors))? (isset($descrip_photo[2])? hsc($descrip_photo[2]) : "Файл не вибраний") : "Файл не вибраний")?></div>
          <input type="hidden" value="<?=((isset($errors))? hsc($_POST['descrip_photo']) : "")?>" name="descrip_photo">
          <input type="hidden" value="<?=((isset($errors,$_POST['delete_last_photo']))? hsc($_POST['delete_last_photo']) : "")?>" name="del_descrip">
          <div class="photos <?=((!empty($_POST['descrip_photo']))? '' : "hidden")?>"><img src="<?=((!empty($_POST['descrip_photo']))? hsc($descrip_photo[0]) : '')?>"></div>
        </div>

        <div class="input-value upload_file" rel_id="0" id="more_photos_0">
          <p>Додаткові зображення</p>
          <button type="button" onclick="clickOninput(this)">Вибрати файл</button>
          <div class="up_file_text"><?=((isset($errors))? (isset($more_src[0][2])? hsc($more_src[0][2]) : "Файл не вибраний") : "Файл не вибраний")?></div>
          <input type="hidden" value="<?=((isset($errors))? hsc($_POST['more_photos'][0]) : "")?>" name="more_photos[]">
          <input type="hidden" value="<?=((isset($errors,$_POST['delete_last_photo']))? hsc($_POST['delete_last_photo']) : "")?>" name="del_more[]">
          <div class="photos <?=((!empty($_POST['more_photos'][0]))? '' : "hidden")?>"><img src="<?=((!empty($_POST['more_photos'][0]))? hsc($more_src[0][0]) : '')?>"></div>
        </div>

        <?php if(isset($more_src) && count($more_src) > 1) {
          foreach ($more_src as $key => $file) {
              if($key == 0){ continue; }  ?>
            <div class="input-value upload_file" rel_id="<?=$key?>" id="more_photos_<?=$key?>">
              <p></p>
              <button type="button" onclick="clickOninput(this)">Вибрати файл</button>
              <div class="up_file_text"><?=((isset($errors))? ((isset($more_src[$key]) && count($file) > 1)? hsc($file[2]) : "Файл не вибраний") : "Файл не вибраний")?></div>
              <input type="hidden" value="<?=((isset($errors))? hsc($_POST['more_photos'][$key]) : "")?>" name="more_photos[]">
              <input type="hidden" value="<?=((isset($errors,$_POST['delete_last_photo']))? hsc($_POST['delete_last_photo']) : "")?>" name="del_more[]">
              <div class="photos <?=((!empty($more_src[$key][0]))? '' : "hidden")?>"><img src="<?=((!empty($_POST['more_photos'][$key]))? hsc($more_src[$key][0]) : '')?>"></div>
            </div>
          <? }
        }
        ?>

        <div class="add_more">
          <span>Добавити ще</span>
        </div>
      </div>
      <input type="submit" value="Додати товар" name="ok">
    </form>

    <form id="to_file">
      <input onchange="addPhoto(this,this.value)" rel_to_set="" type="file" name="photo" id="control">
      <input type="hidden" name="del" value="<?=((isset($errors))? "N" : "Y")?>">
      <input type="hidden" name="update" value="Y">
      <p id="clears">Clear</p>
    </form>
  </div>
</div>