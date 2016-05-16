<div class="add-content">
  <span class="add-element">Додати Елемент</span>
  <a href="/admin/products/" onclick="cancel();" class="back-menu">Елементи</a>
  <div class="bottom-line"></div>
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
            <input type="checkbox" <?=((isset($errors,$_POST['active']))? "checked=\"checked\"" : "")?> name="active" value="yes">
          </div>
          <div class="input-value">
            <p>Назва товару<span>*</span></p>
            <input type="text" class="<?=((isset($errors['name_ua']))? "errors" : "")?>"  name="name_ua" value="<?=((isset($errors))? hsc($_POST['name_ua']) : "")?>">
          </div>
          <div class="input-value">
            <p>Назва товару (ru)<span>*</span></p>
            <input type="text" class="<?=((isset($errors['name_ru']))? "errors" : "")?>"  name="name_ru" value="<?=((isset($errors))? hsc($_POST['name_ru']) : "")?>">
          </div>
          <div class="input-value">
            <p>Символьний код<span>*</span></p>
            <input type="text" class="<?=((isset($errors['seo_name']))? "errors" : "")?>"  name="seo_name" value="<?=((isset($errors))? hsc($_POST['seo_name']) : "")?>">
          </div>
          <div class="input-value">
            <p>Сортування</p>
            <input type="number" step="1" min="1" name="sort" value="<?=((isset($errors))? hsc($_POST['sort']) : "100")?>">
          </div>

          <!-- haracteristic -->
          <div class="headers-line">Характеристики елемента</div>
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
            <input type="text"  name="form_ua" value="<?=((isset($errors))? hsc($_POST['form_ua']) : "")?>">
          </div>
          <div class="input-value">
            <p>Форма матрацу (ru)</p>
            <input type="text"  name="form_ru" value="<?=((isset($errors))? hsc($_POST['form_ru']) : "")?>">
          </div>
          <div class="input-value">
            <p>Тип матрацу</p>
            <input type="text" name="type_ua" value="<?=((isset($errors))? hsc($_POST['type_ua']) : "")?>">
          </div>
          <div class="input-value">
            <p>Тип матрацу (ru)</p>
            <input type="text" name="type_ru" value="<?=((isset($errors))? hsc($_POST['type_ru']) : "")?>">
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
            <input type="text" name="rigidity_ua" value="<?=((isset($errors))? hsc($_POST['rigidity_ua']) : "")?>">
          </div>
          <div class="input-value">
            <p>Жорсткість (ru)</p>
            <input type="text" name="rigidity_ru" value="<?=((isset($errors))? hsc($_POST['rigidity_ru']) : "")?>">
          </div>
          <div class="input-value">
            <p>Анатомічні властивості</p>
            <select name="anatoming">
              <?php foreach(Core::$LOGIC['logic'] as $k=>$v){ ?>
                <option value="<?=$k;?>" <?=((isset($errors) && $_POST['anatoming'] == $k)? 'selected="selected"' : "")?>>
                  <?=$v;?>
                </option>
              <?php } ?>
            </select>
          </div>
          <div class="input-value">
            <p>Ортопедичні властивості</p>
            <select name="ortopeding">
              <?php foreach(Core::$LOGIC['logic'] as $k=>$v){ ?>
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
        </div>

      </div>
      <!-- end element tabs -->

      <!-- element anons tabs -->
      <div class="bTabs">
        <div class="table-style">
          <div class="headers-line">Зображення для анонса</div>
          <div class="input-value upload_file" id="cAnonsPhoto" rel_size="<?=Core::$SIZE_PHOTO['cAnonsPhoto']?>">
            <p>Зображення</p>
            <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (isset($cAnonsPhoto[2])? hsc($cAnonsPhoto[2]) : "Вибрати файл") : "Вибрати файл")?></button>
            <input type="hidden" value="<?=((isset($errors))? hsc($_POST['cAnonsPhoto']) : "")?>" name="cAnonsPhoto">
            <input type="hidden" value="<?=((isset($errors,$_POST['del']['cAnonsPhoto']))? hsc($_POST['del']['cAnonsPhoto']) : "")?>" name="del[cAnonsPhoto]">
            <div class="photos <?=((!empty($_POST['cAnonsPhoto']))? '' : "hidden")?>"><img src="<?=((!empty($_POST['cAnonsPhoto']))? hsc($cAnonsPhoto[0]) : '')?>"></div>
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
            <textarea class="<?=((isset($errors['text_ua']))? "errors" : "")?>" name="text_ua"><?=((isset($errors))? hsc($_POST['text_ua']) : "")?></textarea>
          </div>
          <div class="input-value">
            <p>Короткий опис матрацу<span>*</span></p>
            <textarea class="<?=((isset($errors['description_ua']))? "errors" : "")?>" name="description_ua"><?=((isset($errors))? hsc($_POST['description_ua']) : "")?></textarea>
          </div>

          <div class="headers-line">Опис елемента RU</div>
          <div class="input-value">
            <p>Текст матрацу (ru)<span>*</span></p>
            <textarea class="<?=((isset($errors['text_ru']))? "errors" : "")?>" name="text_ru"><?=((isset($errors))? hsc($_POST['text_ru']) : "")?></textarea>
          </div>
          <div class="input-value">
            <p>Короткий опис матрацу (ru)<span>*</span></p>
            <textarea class="<?=((isset($errors['description_ru']))? "errors" : "")?>" name="description_ru"><?=((isset($errors))? hsc($_POST['description_ru']) : "")?></textarea>
          </div>

          <div class="headers-line">Зображення у колі</div>
          <div class="input-value upload_file" id="cCirklePhoto" rel_size="<?=Core::$SIZE_PHOTO['cCirklePhoto']?>">
            <p>Зображення</p>
            <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (isset($cCirklePhoto[2])? hsc($cCirklePhoto[2]) : "Вибрати файл") : "Вибрати файл")?></button>
            <input type="hidden" value="<?=((isset($errors))? hsc($_POST['cCirklePhoto']) : "")?>" name="cCirklePhoto">
            <input type="hidden" value="<?=((isset($errors,$_POST['del']['cCirklePhoto']))? hsc($_POST['del']['cCirklePhoto']) : "")?>" name="del[cCirklePhoto]">
            <div class="photos <?=((!empty($_POST['cCirklePhoto']))? '' : "hidden")?>"><img src="<?=((!empty($_POST['cCirklePhoto']))? hsc($cCirklePhoto[0]) : '')?>"></div>
          </div>


          <div class="headers-line">Зображення для слайду</div>
          <div class="input-value upload_file" rel_id="0" id="cMorePhoto_0" rel_size="<?=Core::$SIZE_PHOTO['cMorePhoto']?>">
            <p></p>
            <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (isset($cMorePhoto[0][2])? hsc($cMorePhoto[0][2]) : "Вибрати файл") : "Вибрати файл")?></button>
            <input type="hidden" value="<?=((isset($errors))? hsc($_POST['cMorePhoto'][0]) : "")?>" name="cMorePhoto[]">
            <input type="hidden" value="<?=((isset($errors,$_POST['del']['cMorePhoto'][0]))? hsc($_POST['del']['cMorePhoto'][0]) : "")?>" name="del[cMorePhoto][]">
            <div class="photos <?=((!empty($_POST['cMorePhoto'][0]))? '' : "hidden")?>"><img src="<?=((!empty($_POST['cMorePhoto'][0]))? hsc($cMorePhoto[0][0]) : '')?>"></div>
          </div>


          <?php if(isset($cMorePhoto) && count($cMorePhoto) > 1) {
            foreach ($cMorePhoto as $key => $file) {
              if($key == 0){ continue; }  ?>
              <div class="input-value upload_file" rel_id="<?=$key?>" id="cMorePhoto_<?=$key?>" rel_size="<?=Core::$SIZE_PHOTO['cMorePhoto']?>">
                <p></p>
                <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (isset($cMorePhoto[$key][2])? hsc($cMorePhoto[$key][2]) : "Вибрати файл") : "Вибрати файл")?></button>
                <input type="hidden" value="<?=((isset($errors))? hsc($_POST['cMorePhoto'][$key]) : "")?>" name="cMorePhoto[]">
                <input type="hidden" value="<?=((isset($errors,$_POST['del']['cMorePhoto'][$key]))? hsc($_POST['del']['cMorePhoto'][$key]) : "")?>" name="del[cMorePhoto][]">
                <div class="photos <?=((!empty($_POST['cMorePhoto'][$key][0]))? '' : "hidden")?>"><img src="<?=((!empty($_POST['cMorePhoto'][$key]))? hsc($cMorePhoto[$key][0]) : '')?>"></div>
              </div>
            <? }
          }
          ?>

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
            <input type="text" name="meta_title_ua" value="<?=((isset($errors))? hsc($_POST['meta_title_ua']) : "")?>">
          </div>
          <div class="input-value input-seo">
            <p>meta_keywords_ua</p>
            <textarea name="meta_keywords_ua"><?=((isset($errors))? hsc($_POST['meta_keywords_ua']) : "")?></textarea>
          </div>
          <div class="input-value input-seo">
            <p>meta_description_ua</p>
            <textarea name="meta_description_ua"><?=((isset($errors))? hsc($_POST['meta_description_ua']) : "")?></textarea>
          </div>

          <div class="headers-line">Настройки для eлемента RU</div>
          <div class="input-value">
            <p>meta_title_ru</p>
            <input type="text" name="meta_title_ru" value="<?=((isset($errors))? hsc($_POST['meta_title_ru']) : "")?>">
          </div>
          <div class="input-value input-seo">
            <p>meta_keywords_ru</p>
            <textarea name="meta_keywords_ru"><?=((isset($errors))? hsc($_POST['meta_keywords_ru']) : "")?></textarea>
          </div>
          <div class="input-value input-seo">
            <p>meta_description_ru</p>
            <textarea name="meta_description_ru"><?=((isset($errors))? hsc($_POST['meta_description_ru']) : "")?></textarea>
          </div>

          <div class="headers-line">Настройки для картинок eлементів UA</div>
          <div class="input-value">
            <p>Шаблон ALT</p>
            <input type="text" name="img_seo_alt_ua" value="<?=((isset($errors))? hsc($_POST['img_seo_alt_ua']) : "")?>">
          </div>
          <div class="input-value">
            <p>Шаблон TITLE</p>
            <input type="text" name="img_seo_title_ua" value="<?=((isset($errors))? hsc($_POST['img_seo_title_ua']) : "")?>">
          </div>

          <div class="headers-line">Настройки для картинок eлементів RU</div>
          <div class="input-value">
            <p>Шаблон ALT</p>
            <input type="text" name="img_seo_alt_ru" value="<?=((isset($errors))? hsc($_POST['img_seo_alt_ru']) : "")?>">
          </div>
          <div class="input-value">
            <p>Шаблон TITLE</p>
            <input type="text" name="img_seo_title_ru" value="<?=((isset($errors))? hsc($_POST['img_seo_title_ru']) : "")?>">
          </div>

          <!-- open graph -->
          <div class="headers-line">Мікророзмітка Open Graph</div>
          <div class="input-value">
            <p>og:type</p>
            <input type="text" name="og_type" value="<?=((isset($errors))? hsc($_POST['og_type']) : "")?>">
          </div>
          <div class="input-value input-seo">
            <p>og:url</p>
            <span class="pop-info">i</span>
            <div class="pop-window">Посилання на вашу сторінку, <b>без першого слеша!</b>.<i>Приклад:</i> blog/open-graph/</div>
            <textarea name="og_url"><?=((isset($errors))? hsc($_POST['og_url']) : "")?></textarea>
          </div>
          <div class="input-value input-seo">
            <div class="table-style">
              <div class="input-value upload_file" id="og_image" rel_size="<?=Core::$SIZE_PHOTO['og_image']?>">
                <p>og:image</p>
                <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (isset($og_image[2])? hsc($og_image[2]) : "Вибрати файл") : "Вибрати файл")?></button>
                <input type="hidden" value="<?=((isset($errors))? hsc($_POST['og_image']) : "")?>" name="og_image">
                <input type="hidden" value="<?=((isset($errors,$_POST['del']['og_image']))? hsc($_POST['del']['og_image']) : "")?>" name="del[og_image]">
                <div class="photos <?=((!empty($_POST['og_image']))? '' : "hidden")?>"><img src="<?=((!empty($_POST['og_image']))? hsc($og_image[0]) : '')?>"></div>
              </div>
            </div>
          </div>
          <!-- end open graph -->
        </div>
      </div>
      <!-- end seo tabs -->

      <input type="submit" value="Зберегти" name="ok">
      <span class="cancel" onclick="cancel();">Відмінити</span>
    </form>

    <form id="to_file">
      <input onchange="addPhoto(this,this.value)" rel_size="" rel_to_set="" type="file" name="photo" id="control">
      <input type="hidden" name="dir_name" value="<?=Core::$DIR_PHOTOS_AND_DB_TABLE_NAME['products']?>">
      <input type="hidden" name="update" value="Y">
    </form>
  </div>
</div>