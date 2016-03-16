<div class="add-content">
    <span class="add-element">Настройка модуля</span>
    <a href="/admin/main-module/" class="back-menu">Модулі</a>
    <div class="bottom-line-edit"></div>
    <div class="add-block-form">
        <form action="" method="post" enctype="multipart/form-data" onsubmit="return okFrom();">
            <!-- tabs -->
            <input type="radio" name="tabs" id="tabs1" checked>
            <label for="tabs1">Модуль</label>

            <!-- element tabs -->
            <div class="bTabs">

              <div class="table-style">

                <!-- seo -->
                  <div class="headers-line">Настройки модуля UA</div>
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

                  <div class="headers-line">Настройки модуля RU</div>
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
                <!-- end seo -->
              </div>

            </div>
            <!-- end element tabs -->

            <input type="submit" value="Зберегти" name="ok">
        </form>
    </div>
</div>