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

                <!-- open graph -->
                  <div class="headers-line">Мікророзмітка Open Graph</div>
                  <div class="input-value">
                      <p>Open Graph</p>
                      <input type="checkbox" <?=((isset($errors,$_POST['open_graph_page']) || ($row['open_graph_page'] == 1 && !isset($errors)))? "checked=\"checked\"" : "")?> name="open_graph_page" value="yes">
                  </div>
                  <div class="input-value">
                      <p>og:type</p>
                      <input type="text" name="og_type" value="<?=((isset($errors))? hsc($_POST['og_type']) : hsc($row['og_type']))?>">
                  </div>
                  <div class="input-value input-seo">
                      <p>og:url</p>
                      <span class="pop-info">i</span>
                      <div class="pop-window">Посилання на вашу сторінку, <b>без першого слеша!</b>.<i>Приклад:</i> blog/open-graph/</div>
                      <textarea name="og_url"><?=((isset($errors))? hsc($_POST['og_url']) : hsc($row['og_url']))?></textarea>
                  </div>
                  <div class="input-value input-seo">
                      <div class="table-style">
                          <div class="input-value upload_file" id="og_image" rel_size="<?=Core::$SIZE_PHOTO['og_image']?>">
                              <p>og:image</p>
                              <button class="icon-link" type="button" onclick="getInfoFile(this)"><?=((isset($errors))? (!empty($og_image[0])? hsc($og_image[0]) : "Вибрати файл") : ((empty($row['og_image']))? ((isset($_POST['og_image']))? '' : 'Вибрати файл') : hsc($row['og_image'])))?> </button>
                              <input type="hidden" value="<?=((isset($errors))? hsc($_POST['og_image']) : hsc($row['og_image']))?>" name="og_image">
                              <input type="hidden" value="<?=((isset($errors,$_POST['del']['og_image']))? hsc($_POST['del']['og_image']) : hsc($row['og_image']))?>" name="del[og_image]">
                              <div class="photos <?=((!empty($_POST['og_image']))? '' : ((!empty($row['og_image']))? '' : "hidden"))?>"><img src="<?=((isset($_POST['og_image']))? hsc($og_image[0]) : hsc($row['og_image']) )?>"></div>
                          </div>
                      </div>
                  </div>
                <!-- end open graph -->
              </div>

            </div>
            <!-- end element tabs -->

            <input type="submit" value="Зберегти" name="ok">
        </form>

        <form id="to_file">
            <input onchange="addPhoto(this,this.value)" rel_size="" rel_to_set="" type="file" name="photo" id="control">
            <input type="hidden" name="dir_name" value="opeg_graph">
            <input type="hidden" name="isset" value="N">
            <input type="hidden" name="update" value="Y">
        </form>
    </div>
</div>