<div class="add-content">
  <span class="add-element">Додати Елемент</span>
  <a href="/admin/main-banner/" class="back-menu">Елементи</a>
  <div class="bottom-line"></div>
  <div class="add-block-form">
    <form action="" method="post" enctype="multipart/form-data">
      <!-- tabs -->
      <input type="radio" name="tabs" id="tabs1" checked>
      <label for="tabs1">Елемент</label>

      <input type="radio" name="tabs" id="tabs2">
      <label for="tabs2">SEO</label>

      <div class="bTabs">

        <div class="table-style">
          <div class="headers-line">Настройки елемента</div>
          <div class="input-value">
            <p>Активність</p>
            <input type="checkbox" <?=((isset($errors,$_POST['active']))? "checked=\"checked\"" : "")?> name="active" value="yes">
          </div>
          <div class="input-value">
            <p>Назва<span>*</span></p>
            <input type="text" class="<?=((isset($errors['name']))? "errors" : "")?>"  name="name" value="<?=((isset($errors))? hsc($_POST['name']) : "")?>">
          </div>
          <div class="input-value">
            <p>Сортування</p>
            <input type="number" step="1" min="1" name="sort" value="<?=((isset($errors))? hsc($_POST['sort']) : "100")?>">
          </div>

          <div class="headers-line">Зображенн для баннера UA</div>
          <div class="input-value upload_file" id="main_banner_ua" rel_size="<?=Core::$SIZE_PHOTO['main_banner']?>">
            <p>Зображення</p>
            <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (isset($main_banner_ua[2])? hsc($main_banner_ua[2]) : "Вибрати файл") : "Вибрати файл")?></button>
            <input type="hidden" value="<?=((isset($errors))? hsc($_POST['main_banner_ua']) : "")?>" name="main_banner_ua">
            <input type="hidden" value="<?=((isset($errors,$_POST['del']['main_banner_ua']))? hsc($_POST['del']['main_banner_ua']) : "")?>" name="del[main_banner_ua]">
            <div class="photos <?=((!empty($_POST['main_banner_ua']))? '' : "hidden")?>"><img src="<?=((!empty($_POST['main_banner_ua']))? hsc($main_banner_ua[0]) : '')?>"></div>
          </div>

          <div class="headers-line">Зображенн для баннера RU</div>
          <div class="input-value upload_file" id="main_banner_ru" rel_size="<?=Core::$SIZE_PHOTO['main_banner']?>">
            <p>Зображення</p>
            <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (isset($main_banner_ru[2])? hsc($main_banner_ru[2]) : "Вибрати файл") : "Вибрати файл")?></button>
            <input type="hidden" value="<?=((isset($errors))? hsc($_POST['main_banner_ru']) : "")?>" name="main_banner_ru">
            <input type="hidden" value="<?=((isset($errors,$_POST['del']['main_banner_ru']))? hsc($_POST['del']['main_banner_ru']) : "")?>" name="del[main_banner_ru]">
            <div class="photos <?=((!empty($_POST['main_banner_ru']))? '' : "hidden")?>"><img src="<?=((!empty($_POST['main_banner_ru']))? hsc($main_banner_ru[0]) : '')?>"></div>
          </div>
        </div>

      </div>

      <div class="bTabs">

          <div class="table-style">
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
          </div>

      </div>
      <!-- end tabs -->

      <input type="submit" value="Зберегти" name="ok">
      <span class="cancel" onclick="cancel();">Відмінити</span>
    </form>

    <form id="to_file">
      <input onchange="addPhoto(this,this.value)" rel_size="" rel_to_set="" type="file" name="photo" id="control">
      <input type="hidden" name="dir_name" value="<?=Core::$DIR_PHOTOS_NAME['main_banner']?>">
      <input type="hidden" name="update" value="Y">
      <p id="clears">Clear</p>
    </form>
  </div>
</div>