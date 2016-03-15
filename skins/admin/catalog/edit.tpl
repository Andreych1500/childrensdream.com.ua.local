<div class="add-content">
  <span class="add-element">Редагування елемента</span>
  <a href="/admin/catalog/" class="back-menu">Елементи</a>
  <div class="bottom-line-edit"></div>
  <div class="add-block-form">
    <form action="" method="post" enctype="multipart/form-data">
      <!-- tabs -->
      <input type="radio" name="tabs" id="tabs1" checked>
      <label for="tabs1">Елемент</label>

      <input type="radio" name="tabs" id="tabs2">
      <label for="tabs2">Анонс</label>

      <input type="radio" name="tabs" id="tabs3">
      <label for="tabs3">Опис</label>

      <input type="radio" name="tabs" id="tabs4">
      <label for="tabs4">SEO</label>


      <!-- element tabs -->
      <div class="bTabs">

        <div class="table-style">
          <div class="headers-line">Настройки елемента</div>
          <div class="input-value">
            <p>Активність</p>
            <input type="checkbox" <?=((isset($errors,$_POST['active']) || ($row['active'] == 1 && !isset($errors)))? "checked=\"checked\"" : "")?> name="active" value="yes">
          </div>
          <div class="input-value">
            <p>Назва товару<span>*</span></p>
            <input type="text" class="<?=((isset($errors['name_ua']))? "errors" : "")?>"  name="name_ua" value="<?=((isset($errors))? hsc($_POST['name_ua']) : hsc($row['name_ua']))?>">
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
            <input type="number" step="1" min="1" name="sort" value="<?=((isset($errors))? hsc($_POST['sort']) : hsc($row['sort']))?>">
          </div>

          <!-- haracteristic -->
          <div class="headers-line">Характеристики елемента</div>
          <div class="input-value">
            <p>Наявність</p>
            <input type="checkbox" <?=((isset($errors,$_POST['availability']) || ($row['availability'] == 1 && !isset($errors)))? "checked=\"checked\"" : "")?> name="availability" value="yes">
          </div>
          <div class="input-value">
            <p>Ціна товару (грн.)<span>*</span></p>
            <input type="text" class="<?=((isset($errors['price']))? "errors" : "")?>"  name="price" value="<?=((isset($errors))? hsc($_POST['price']) : hsc($row['price']))?>">
          </div>
          <div class="input-value">
            <p>Форма матрацу</p>
            <input type="text"  name="form_ua" value="<?=((isset($errors))? hsc($_POST['form_ua']) : hsc($row['form_ua']))?>">
          </div>
          <div class="input-value">
            <p>Форма матрацу (ru)</p>
            <input type="text"  name="form_ru" value="<?=((isset($errors))? hsc($_POST['form_ru']) : hsc($row['form_ru']))?>">
          </div>
          <div class="input-value">
            <p>Тип матрацу</p>
            <input type="text" name="type_ua" value="<?=((isset($errors))? hsc($_POST['type_ua']) : hsc($row['type_ua']))?>">
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
            <input type="number" step="1" min="0"  name="weight" value="<?=((isset($errors))? hsc($_POST['weight']) : hsc($row['weight']))?>">
          </div>
          <div class="input-value">
            <p>Висота (см.)</p>
            <input type="number" step="1" min="0" name="height" value="<?=((isset($errors))? hsc($_POST['height']) : hsc($row['height']))?>">
          </div>
          <div class="input-value">
            <p>Жорсткість</p>
            <input type="text" name="rigidity_ua" value="<?=((isset($errors))? hsc($_POST['rigidity_ua']) : hsc($row['rigidity_ua']))?>">
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
            <input type="number" step="1" min="0" name="garanty" value="<?=((isset($errors))? hsc($_POST['garanty']) : hsc($row['garanty']))?>">
          </div>
        </div>

      </div>
      <!-- end element tabs -->


      <!-- element anons tabs -->
      <div class="bTabs">

        <div class="table-style">
          <div class="headers-line">Зображення для анонса</div>
          <div class="input-value upload_file" id="cAnonsPhoto" rel_size="<?=Core::$SIZE_PHOTO['cAnonsPhoto']?>">
            <p>Зображення</p>
            <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (!empty($cAnonsPhoto[0])? hsc($cAnonsPhoto[0]) : "Вибрати файл") : ((empty($row['cAnonsPhoto']))? ((isset($_POST['cAnonsPhoto']))? '' : 'Вибрати файл') : hsc($row['cAnonsPhoto'])))?> </button>
            <input type="hidden" value="<?=((isset($errors))? hsc($_POST['cAnonsPhoto']) : hsc($row['cAnonsPhoto']))?>" name="cAnonsPhoto">
            <input type="hidden" value="<?=((isset($errors,$_POST['del']['cAnonsPhoto']))? hsc($_POST['del']['cAnonsPhoto']) : hsc($row['cAnonsPhoto']))?>" name="del[cAnonsPhoto]">
            <div class="photos <?=((!empty($_POST['cAnonsPhoto']))? '' : ((!empty($row['cAnonsPhoto']))? '' : "hidden"))?>"><img src="<?=((isset($_POST['cAnonsPhoto']))? hsc($cAnonsPhoto[0]) : hsc($row['cAnonsPhoto']) )?>"></div>
          </div>
        </div>

      </div>
      <!-- end element anons tabs -->


      <!-- element description tabs -->
      <div class="bTabs">
        <div class="table-style">
          <div class="headers-line">Опис елемента UA</div>
          <div class="input-value">
            <p>Текст матрацу<span>*</span></p>
            <textarea class="<?=((isset($errors['text_ua']))? "errors" : "")?>" name="text_ua"><?=((isset($errors))? hsc($_POST['text_ua']) : hsc($row['text_ua']))?></textarea>
          </div>
          <div class="input-value">
            <p>Короткий опис матрацу<span>*</span></p>
            <textarea class="<?=((isset($errors['description_ua']))? "errors" : "")?>" name="description_ua"><?=((isset($errors))? hsc($_POST['description_ua']) : hsc($row['description_ua']))?></textarea>
          </div>

          <div class="headers-line">Опис елемента RU</div>
          <div class="input-value">
            <p>Текст матрацу (ru)<span>*</span></p>
            <textarea class="<?=((isset($errors['text_ru']))? "errors" : "")?>" name="text_ru"><?=((isset($errors))? hsc($_POST['text_ru']) : hsc($row['text_ru']))?></textarea>
          </div>
          <div class="input-value">
            <p>Короткий опис матрацу (ru)<span>*</span></p>
            <textarea class="<?=((isset($errors['description_ru']))? "errors" : "")?>" name="description_ru"><?=((isset($errors))? hsc($_POST['description_ru']) : hsc($row['description_ru']))?></textarea>
          </div>

          <div class="headers-line">Зображення у колі</div>
          <div class="input-value upload_file" id="cCirklePhoto" rel_size="<?=Core::$SIZE_PHOTO['cCirklePhoto']?>">
            <p>Зображення</p>
            <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (!empty($cCirklePhoto[0])? hsc($cCirklePhoto[0]) : "Вибрати файл") : ((empty($row['cCirklePhoto']))? ((isset($_POST['cCirklePhoto']))? '' : 'Вибрати файл') : hsc($row['cCirklePhoto'])))?></button>
            <input type="hidden" value="<?=((isset($errors))? hsc($_POST['cCirklePhoto']) : hsc($row['cCirklePhoto']))?>" name="cCirklePhoto">
            <input type="hidden" value="<?=((isset($errors,$_POST['del']['cCirklePhoto']))? hsc($_POST['del']['cCirklePhoto']) : hsc($row['cCirklePhoto']))?>" name="del[cCirklePhoto]">
            <div class="photos <?=((!empty($_POST['cCirklePhoto']))? '' : ((!empty($row['cCirklePhoto']))? '' : "hidden"))?>"><img src="<?=((isset($_POST['cCirklePhoto']))? hsc($cCirklePhoto[0]) : hsc($row['cCirklePhoto']) )?>"></div>
          </div>

          <div class="headers-line">Зображення для слайду</div>
          <?php foreach ($cMorePhoto as $key => $file) { ?>
            <div class="input-value upload_file" rel_id="<?=$key?>" id="cMorePhoto_<?=$key?>" rel_size="<?=Core::$SIZE_PHOTO['cMorePhoto']?>">
              <p><?=(($key == 0)? "Зображення" : "")?></p>
              <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (!empty($file[2])? hsc($file[2]) : "Вибрати файл") : ((empty($file[2]))? ((isset($_POST['cMorePhoto'][$key]))? '' : 'Вибрати файл') : hsc($file[2])))?></button>
              <input type="hidden" value="<?=((isset($errors))? hsc($_POST['cMorePhoto'][$key]) : hsc($file[3]))?>" name="cMorePhoto[]">
              <input type="hidden" value="<?=((isset($errors,$_POST['del']['cMorePhoto']))? hsc($_POST['del']['cMorePhoto'][$key]) : hsc($file[3]))?>" name="del[cMorePhoto][]">
              <div class="photos <?=((!empty($_POST['cMorePhoto'][$key]))? '' : ((!empty($file[0]))? '' : "hidden"))?>"><img src="<?=((isset($_POST['cMorePhoto'][$key]))? hsc($file[0]) : hsc($file[0]) )?>"></div>
            </div>
          <?php } ?>

          <div class="add_more">
            <span>Добавити ще</span>
          </div>

        </div>
      </div>
      <!-- end element description tabs -->


      <!-- seo tabs -->
      <div class="bTabs">
        <div class="table-style">
          <div class="headers-line">Настройки для eлемента UA</div>
          <div class="input-value">
            <p>meta_title_ua</p>
            <input type="text" name="meta_title_ua" value="<?=((isset($errors))? hsc($_POST['meta_title_ua']) : hsc($row['meta_title_ua']))?>">
          </div>
          <div class="input-value input-seo">
            <p>meta_keywords_ua</p>
            <textarea name="meta_keywords_ua"><?=((isset($errors))? hsc($_POST['meta_keywords_ua']) : hsc($row['meta_keywords_ua']))?></textarea>
          </div>
          <div class="input-value input-seo">
            <p>meta_description_ua</p>
            <textarea name="meta_description_ua"><?=((isset($errors))? hsc($_POST['meta_description_ua']) : hsc($row['meta_description_ua']))?></textarea>
          </div>

          <div class="headers-line">Настройки для eлемента RU</div>
          <div class="input-value">
            <p>meta_title_ru</p>
            <input type="text" name="meta_title_ru" value="<?=((isset($errors))? hsc($_POST['meta_title_ru']) : hsc($row['meta_title_ru']))?>">
          </div>
          <div class="input-value input-seo">
            <p>meta_keywords_ru</p>
            <textarea name="meta_keywords_ru"><?=((isset($errors))? hsc($_POST['meta_keywords_ru']) : hsc($row['meta_keywords_ru']))?></textarea>
          </div>
          <div class="input-value input-seo">
            <p>meta_description_ru</p>
            <textarea name="meta_description_ru"><?=((isset($errors))? hsc($_POST['meta_description_ru']) : hsc($row['meta_description_ru']))?></textarea>
          </div>

          <div class="headers-line">Настройки для картинок eлементів UA</div>
          <div class="input-value">
            <p>Шаблон ALT</p>
            <input type="text" name="img_seo_alt_ua" value="<?=((isset($errors))? hsc($_POST['img_seo_alt_ua']) : hsc($row['img_seo_alt_ua']))?>">
          </div>
          <div class="input-value">
            <p>Шаблон TITLE</p>
            <input type="text" name="img_seo_title_ua" value="<?=((isset($errors))? hsc($_POST['img_seo_title_ua']) : hsc($row['img_seo_title_ua']))?>">
          </div>

          <div class="headers-line">Настройки для картинок eлементів RU</div>
          <div class="input-value">
            <p>Шаблон ALT</p>
            <input type="text" name="img_seo_alt_ru" value="<?=((isset($errors))? hsc($_POST['img_seo_alt_ru']) : hsc($row['img_seo_alt_ru']))?>">
          </div>
          <div class="input-value">
            <p>Шаблон TITLE</p>
            <input type="text" name="img_seo_title_ru" value="<?=((isset($errors))? hsc($_POST['img_seo_title_ru']) : hsc($row['img_seo_title_ru']))?>">
          </div>
        </div>
      </div>
      <!-- end seo tabs -->

      <input type="submit" value="Зберегти" name="ok">
    </form>

    <form id="to_file">
      <input onchange="addPhoto(this,this.value)" rel_size="" rel_to_set="" type="file" name="photo" id="control">
      <input type="hidden" name="dir_name" value="<?=Core::$DIR_PHOTOS_NAME['catalog']?>">
      <input type="hidden" name="isset" value="N">
      <input type="hidden" name="update" value="Y">
    </form>
  </div>
</div>