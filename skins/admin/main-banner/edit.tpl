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
      <label for="tabs2">SEO</label>

      <!-- element tabs -->
      <div class="bTabs">

        <div class="table-style">
          <div class="headers-line">Настройки елемента</div>
          <div class="input-value">
            <p>Активність</p>
            <input type="checkbox" <?=((isset($errors,$_POST['active']) || ($row['active'] == 1 && !isset($errors)))? "checked=\"checked\"" : "")?> name="active" value="yes">
          </div>
          <div class="input-value">
            <p>Назва<span>*</span></p>
            <input type="text" class="<?=((isset($errors['name']))? "errors" : "")?>"  name="name" value="<?=((isset($errors))? hsc($_POST['name']) : hsc($row['name']))?>">
          </div>
          <div class="input-value">
            <p>Сортування</p>
            <input type="number" step="1" min="1" name="sort" value="<?=((isset($errors))? hsc($_POST['sort']) : hsc($row['sort']))?>">
          </div>

          <div class="headers-line">Зображенн для баннера UA</div>
          <div class="input-value upload_file" id="main_banner_ua" rel_size="<?=Core::$SIZE_PHOTO['main_banner']?>">
            <p>Зображення</p>
            <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (!empty($main_banner_ua[0])? hsc($main_banner_ua[0]) : "Вибрати файл") : ((empty($row['img_ua']))? ((isset($_POST['main_banner_ua']))? '' : 'Вибрати файл') : hsc($row['img_ua'])))?> </button>
            <input type="hidden" value="<?=((isset($errors))? hsc($_POST['main_banner_ua']) : hsc($row['img_ua']))?>" name="main_banner_ua">
            <input type="hidden" value="<?=((isset($errors,$_POST['del']['main_banner_ua']))? hsc($_POST['del']['main_banner_ua']) : hsc($row['img_ua']))?>" name="del[main_banner_ua]">
            <div class="photos <?=((!empty($_POST['main_banner_ua']))? '' : ((!empty($row['img_ua']))? '' : "hidden"))?>"><img src="<?=((isset($_POST['main_banner_ua']))? hsc($main_banner_ua[0]) : hsc($row['img_ua']) )?>"></div>
          </div>

          <div class="headers-line">Зображенн для баннера RU</div>
          <div class="input-value upload_file" id="main_banner_ru" rel_size="<?=Core::$SIZE_PHOTO['main_banner']?>">
            <p>Зображення</p>
            <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (!empty($main_banner_ru[0])? hsc($main_banner_ru[0]) : "Вибрати файл") : ((empty($row['img_ru']))? ((isset($_POST['main_banner_ru']))? '' : 'Вибрати файл') : hsc($row['img_ru'])))?> </button>
            <input type="hidden" value="<?=((isset($errors))? hsc($_POST['main_banner_ru']) : hsc($row['img_ru']))?>" name="main_banner_ru">
            <input type="hidden" value="<?=((isset($errors,$_POST['del']['main_banner_ru']))? hsc($_POST['del']['main_banner_ru']) : hsc($row['img_ru']))?>" name="del[main_banner_ru]">
            <div class="photos <?=((!empty($_POST['main_banner_ru']))? '' : ((!empty($row['img_ru']))? '' : "hidden"))?>"><img src="<?=((isset($_POST['main_banner_ru']))? hsc($main_banner_ru[0]) : hsc($row['img_ru']) )?>"></div>
          </div>
        </div>

      </div>
      <!-- end element tabs -->


      <!-- seo tabs -->
      <div class="bTabs">

        <div class="table-style">
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
      <input type="hidden" name="dir_name" value="<?=Core::$DIR_PHOTOS_NAME['main_banner']?>">
      <input type="hidden" name="isset" value="N">
      <input type="hidden" name="update" value="Y">
    </form>
  </div>
</div>