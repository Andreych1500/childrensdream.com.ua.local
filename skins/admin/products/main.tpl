<?php if(isset($_REQUEST['add'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Створити елемент']?></p>
      <a class="back-url" href="/admin/products/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="header-line"><?=$messG['Настройки елемента']?></div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Назва']?> UA:<span class="accent">*</span></div>
          <input <?=(isset($check['name_ua'])? $check['name_ua'] : '')?> type="text" name="name_ua" value="<?=(isset($error)? hsc($_POST['name_ua']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Назва']?> RU:<span class="accent">*</span></div>
          <input data-symbol-code="ok" <?=(isset($check['name_ru'])? $check['name_ru'] : '')?> type="text" name="name_ru" value="<?=(isset($error)? hsc($_POST['name_ru']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$messG['Символьний код']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['symbol_code'])? $check['symbol_code'] : '')?> type="text" name="symbol_code" value="<?=(isset($error)? hsc($_POST['symbol_code']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$messG['Сортування']?>:</div>
          <input type="number" step="1" min="1" name="sort" value="<?=((isset($error))? hsc($_POST['sort']) : "100")?>">
        </div>

        <div class="header-line"><?=$messG['Увага!']?></div>

        <input type="submit" value="<?=$messG['Створити']?>" name="ok">
    </form>
  </div>
<?php } elseif(isset($_REQUEST['edit'])) { ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Редагування елемента']?></p>
      <a class="back-url" href="/admin/products/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
      <li>SEO</li>
      <li><?=$messG['Фото']?></li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="header-line"><?=$messG['Насстройки елемента']?></div>

        <div class="input-value">
          <div class="name-section"><?=$messG['Активність']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['active']) || ($arResult['active'] == 1 && !isset($error)))? "checked" : "")?> name="active" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Назва']?> UA:<span class="accent">*</span></div>
          <input <?=(isset($check['name_ua'])? $check['name_ua'] : '')?> type="text" name="name_ua" value="<?=(isset($error)? hsc($_POST['name_ua']) : $arResult['name_ua'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Назва']?> RU:<span class="accent">*</span></div>
          <input <?=(isset($check['name_ru'])? $check['name_ru'] : '')?> type="text" name="name_ru" value="<?=(isset($error)? hsc($_POST['name_ru']) : $arResult['name_ru'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$messG['Символьний код']?>:<span class="accent">*</span></div>
          <input disabled <?=(isset($check['symbol_code'])? $check['symbol_code'] : '')?> type="text" name="symbol_code" value="<?=$arResult['symbol_code']?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$messG['Сортування']?>:</div>
          <input type="number" step="1" min="0" name="sort" value="<?=((isset($error))? hsc($_POST['sort']) : (int)$arResult['sort'])?>">
        </div>

        <div class="header-line"><?=$mess['Опис елемента']?> UA</div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Текст матрацу']?>:</div>
          <textarea name="text_ua"><?=((isset($error))? hsc($_POST['text_ua']) : $arResult['text_ua'])?></textarea>
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Короткий опис матрацу']?>:</div>
          <textarea name="description_ua"><?=((isset($error))? hsc($_POST['description_ua']) : $arResult['description_ua'])?></textarea>
        </div>

        <div class="header-line"><?=$mess['Опис елемента']?> RU</div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Текст матрацу']?>:</div>
          <textarea name="text_ru"><?=((isset($error))? hsc($_POST['text_ru']) : $arResult['text_ru'])?></textarea>
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Короткий опис матрацу']?>:</div>
          <textarea name="description_ru"><?=((isset($error))? hsc($_POST['description_ru']) : $arResult['description_ru'])?></textarea>
        </div>

        <div class="header-line"><?=$mess['Характеристики елемента']?></div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Наявність']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['availability']) || ($arResult['availability'] == 1 && !isset($error)))? "checked" : "")?> name="availability" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Ціна товару (грн.)']?>:<span class="accent">*</span></div>
          <input type="number" step="1" min="0" name="price" <?=(isset($check['price'])? $check['price'] : '')?> value="<?=(isset($error)? hsc($_POST['price']) : $arResult['price'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Кількість слоїв']?> UA:</div>
          <input type="text" name="count_layers_ua" value="<?=(isset($error)? hsc($_POST['count_layers_ua']) : $arResult['count_layers_ua'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Кількість слоїв']?> RU:</div>
          <input type="text" name="count_layers_ru" value="<?=(isset($error)? hsc($_POST['count_layers_ru']) : $arResult['count_layers_ru'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Форма матрацу']?> UA:</div>
          <input type="text" name="form_ua" value="<?=(isset($error)? hsc($_POST['form_ua']) : $arResult['form_ua'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Форма матрацу']?> RU:</div>
          <input type="text" name="form_ru" value="<?=(isset($error)? hsc($_POST['form_ru']) : $arResult['form_ru'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Тип матрацу']?> UA:</div>
          <input type="text" name="type_ua" value="<?=(isset($error)? hsc($_POST['type_ua']) : $arResult['type_ua'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Тип матрацу']?> RU:</div>
          <input type="text" name="type_ru" value="<?=(isset($error)? hsc($_POST['type_ru']) : $arResult['type_ru'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Розмір (тип "N x N")']?>:</div>
          <input type="text" name="size" value="<?=(isset($error)? hsc($_POST['size']) : $arResult['size'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Вага (кг.)']?>:</div>
          <input type="number" step="1" name="weight" value="<?=((isset($error))? hsc($_POST['weight']) : (int)$arResult['weight'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Висота (см.)']?>:</div>
          <input type="number" step="1" name="height" value="<?=((isset($error))? hsc($_POST['height']) : (int)$arResult['height'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Жорсткість']?> UA:</div>
          <input type="text" name="rigidity_ua" value="<?=(isset($error)? hsc($_POST['rigidity_ua']) : $arResult['rigidity_ua'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Жорсткість']?> RU:</div>
          <input type="text" name="rigidity_ru" value="<?=(isset($error)? hsc($_POST['rigidity_ru']) : $arResult['rigidity_ru'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Гарантійний термін']?>:</div>
          <input type="number" step="1" name="garanty" value="<?=((isset($error))? hsc($_POST['garanty']) : (int)$arResult['garanty'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Анатомічні властивості']?>:</div>
          <select name="anatoming">
            <?php foreach(Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']] as $k => $v){ ?>
              <option value="<?=$k?>" <?=(((isset($error) && $_POST['anatoming'] == $k) || ((int)$arResult['anatoming'] == $k && !isset($error)))? 'selected' : "")?>>
                <?=$v?>
              </option>
            <?php } ?>
          </select>
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Ортопедичні властивості']?>:</div>
          <select name="ortopeding">
            <?php foreach(Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']] as $k => $v){ ?>
              <option value="<?=$k?>" <?=(((isset($error) && $_POST['ortopeding'] == $k) || ((int)$arResult['ortopeding'] == $k && !isset($error)))? 'selected' : "")?>>
                <?=$v?>
              </option>
            <?php } ?>
          </select>
        </div>
      </div>

        <div class="tabs">
          <div class="header-line"><?=$mess['Настройки для eлемента UA']?></div>

          <div class="input-value">
            <div class="name-section">Meta title:</div>
            <input type="text" name="meta_title_ua" value="<?=(isset($error)? hsc($_POST['meta_title_ua']) : $arResult['meta_title_ua'])?>">
          </div>

          <div class="input-value">
            <div class="name-section">Meta keywords:</div>
            <textarea name="meta_keywords_ua"><?=((isset($error))? hsc($_POST['meta_keywords_ua']) : $arResult['meta_keywords_ua'])?></textarea>
          </div>

          <div class="input-value">
            <div class="name-section">Meta description:</div>
            <textarea name="meta_description_ua"><?=((isset($error))? hsc($_POST['meta_description_ua']) : $arResult['meta_description_ua'])?></textarea>
          </div>

          <div class="header-line"><?=$mess['Настройки для eлемента RU']?></div>

          <div class="input-value">
            <div class="name-section">Meta title:</div>
            <input type="text" name="meta_title_ru" value="<?=(isset($error)? hsc($_POST['meta_title_ru']) : $arResult['meta_title_ru'])?>">
          </div>

          <div class="input-value">
            <div class="name-section">Meta keywords:</div>
            <textarea name="meta_keywords_ru"><?=((isset($error))? hsc($_POST['meta_keywords_ru']) : $arResult['meta_keywords_ru'])?></textarea>
          </div>

          <div class="input-value">
            <div class="name-section">Meta description:</div>
            <textarea name="meta_description_ru"><?=((isset($error))? hsc($_POST['meta_description_ru']) : $arResult['meta_description_ru'])?></textarea>
          </div>

          <div class="header-line"><?=$mess['Настройки для картинок eлементів']?> UA</div>

          <div class="input-value">
            <div class="name-section"><?=$mess['Шаблон']?> ALT:</div>
            <input type="text" name="img_seo_alt_ua" value="<?=(isset($error)? hsc($_POST['img_seo_alt_ua']) : $arResult['img_seo_alt_ua'])?>">
          </div>

          <div class="input-value">
            <div class="name-section"><?=$mess['Шаблон']?> TITLE:</div>
            <input type="text" name="img_seo_title_ua" value="<?=(isset($error)? hsc($_POST['img_seo_title_ua']) : $arResult['img_seo_title_ua'])?>">
          </div>

          <div class="header-line"><?=$mess['Настройки для картинок eлементів']?> RU</div>

          <div class="input-value">
            <div class="name-section"><?=$mess['Шаблон']?> ALT:</div>
            <input type="text" name="img_seo_alt_ru" value="<?=(isset($error)? hsc($_POST['img_seo_alt_ru']) : $arResult['img_seo_alt_ru'])?>">
          </div>

          <div class="input-value">
            <div class="name-section"><?=$mess['Шаблон']?> TITLE:</div>
            <input type="text" name="img_seo_title_ru" value="<?=(isset($error)? hsc($_POST['img_seo_title_ru']) : $arResult['img_seo_title_ru'])?>">
          </div>

          <div class="header-line"><?=$mess['Мікророзмітка Open Graph']?></div>

          <div class="input-value">
            <div class="name-section">og:type:</div>
            <input type="text" name="og_type" value="<?=((isset($error))? hsc($_POST['og_type']) : $arResult['og_type'])?>">
          </div>

          <div class="input-value">
            <div class="name-section"><span class="pop-info">i</span>Og url:
              <div class="pop-window"><?=$messG['Посилання від корня сайту']?></div>
            </div>
            <textarea name="og_url"><?=(isset($error)? hsc($_POST['og_url']) : $arResult['og_url'])?></textarea>
          </div>

          <div class="input-value upload_file" id="og_image" data-size="<?=$adminParam['rdfa_size']?>">
            <div class="name-section">Og Photo:</div>
            <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['rdfa_dir']?>')"><?=((isset($error))? (!empty($_POST['og_image'])? hsc($_POST['og_image']) : $messG['Вибрати файл']) : (!empty($arResult['og_image'])? $arResult['og_image'] : $messG['Вибрати файл']))?>
            </button>
            <input name="og_image" type="hidden" value="<?=((isset($error))? hsc($_POST['og_image']) : $arResult['og_image'])?>">
            <input name="del[og_image]" type="hidden" value="<?=((isset($error, $_POST['del']['og_image']))? hsc($_POST['del']['og_image']) : $arResult['og_image'])?>">
            <div class="photos <?=((!empty($_POST['og_image']))? '' : ((!empty($arResult['og_image']))? '' : "hidden"))?>">
              <img src="<?=((isset($_POST['og_image']))? hsc($_POST['og_image']) : $arResult['og_image'])?>">
            </div>
          </div>
        </div>

        <div class="tabs">
          <div class="header-line"><?=$mess['Зображення для анонса']?></div>

          <div class="input-value upload_file" id="img_anons" data-size="<?=$adminParam['anons_size']?>">
            <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['products_dir']?>')"><?=((isset($error))? (!empty($_POST['img_anons'])? hsc($_POST['img_anons']) : $messG['Вибрати файл']) : (!empty($arResult['img_anons'])? $arResult['img_anons'] : $messG['Вибрати файл']))?>
            </button>
            <input name="img_anons" type="hidden" value="<?=((isset($error))? hsc($_POST['img_anons']) : $arResult['img_anons'])?>">
            <input name="del[img_anons]" type="hidden" value="<?=((isset($error, $_POST['del']['img_anons']))? hsc($_POST['del']['img_anons']) : $arResult['img_anons'])?>">
            <div class="photos <?=((!empty($_POST['img_anons']))? '' : ((!empty($arResult['img_anons']))? '' : "hidden"))?>">
              <img src="<?=((isset($_POST['img_anons']))? hsc($_POST['img_anons']) : $arResult['img_anons'])?>">
            </div>
          </div>

          <div class="header-line"><?=$mess['Зображення у колі']?></div>

          <div class="input-value upload_file" id="img_circle" data-size="<?=$adminParam['circle_size']?>">
            <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['products_dir']?>')"><?=((isset($error))? (!empty($_POST['img_circle'])? hsc($_POST['img_circle']) : $messG['Вибрати файл']) : (!empty($arResult['img_circle'])? $arResult['img_circle'] : $messG['Вибрати файл']))?>
            </button>
            <input name="img_circle" type="hidden" value="<?=(isset($_POST['img_circle'])? hsc($_POST['img_circle']) : $arResult['img_circle'])?>">
            <input name="del[img_circle]" type="hidden" value="<?=(isset($_POST['del']['img_circle'])? hsc($_POST['del']['img_circle']) : $arResult['img_circle'])?>">
            <div class="photos <?=((isset($_POST['img_circle']))? '' : ((!empty($arResult['img_circle']))? '' : "hidden"))?>">
              <img src="<?=(isset($_POST['img_circle'])? hsc($_POST['img_circle']) : $arResult['img_circle'])?>">
            </div>
          </div>

          <div class="header-line"><?=$mess['Зображення для слайду']?></div>

          <?php foreach((isset($_POST['img_more'])? $_POST['img_more'] : explode('#', $arResult['img_more'])) as $key => $file){ ?>
            <div class="input-value upload_file" id="img_more_<?=$key?>" data-size="<?=$adminParam['more_size']?>">
              <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['products_dir']?>')"><?=(isset($error)? (!empty($file)? hsc($file) : $messG['Вибрати файл']) : (!empty($file)? hsc($file) : $messG['Вибрати файл']))?>
              </button>
              <input type="hidden" value="<?=hsc($file)?>" name="img_more[]">
              <input type="hidden" value="<?=hsc($file)?>" name="del[img_more][]">
              <div class="photos <?=(!empty($file)? '' : "hidden")?>">
                <img src="<?=(!empty($file)? hsc($file) : '')?>">
              </div>
            </div>
          <?php } ?>
          <div class="add_more"><?=$messG['Добавити ще']?></div>
        </div>

        <input type="submit" value="<?=$messG['Зберегти']?>" name="ok">
    </form>

    <form id="to_file">
      <input id="control" type="file" name="photo" onchange="addPhoto(this)" data-size="" data-set="" data-dir="">
    </form>
  </div>
<?php } else { ?>
  <div class="filter">
    <div class="filter-name"><?=$messG['Фільтр']?></div>
    <form action="" method="post">
      <div class="add-field-filter icon-plus"></div>
      <div class="filter-option-list">
        <?php foreach($htmlFilter['filter_option'] as $k => $name){ ?>
          <div class="<?=(isset($_COOKIE['filter']) && in_array($k, (array)json_decode($_COOKIE['filter']))? 'act-option' : '')?>"><?=$name?></div>
        <?php } ?>
      </div>
      <?=$htmlFilter['filter_inputs']?>
      <input type="submit" name="search" value="<?=$messG['Пошук']?>"><a href="/admin/products/?filterReset=ok"><?=$messG['Відмінити']?></a>
    </form>
  </div>

  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name"><?=$mess['Дитячі матраци']?></p>
    </div>
    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom-next">
        <a href="/admin/products/?add=ok" class="add-el icon-plus"><?=$messG['Створити елемент']?></a>
        <input type="submit" value="<?=$messG['Активувати']?>" name="activate" class="option-el">
        <input type="submit" value="<?=$messG['Деактивувати']?>" name="deactivate" class="option-el">
        <input type="submit" value="<?=$messG['Видалити']?>" name="delete" class="option-el">
        <div class="dynamicEdit" data-submit-lang="<?=$messG['Зберегти']?>|<?=$messG['Відмінити']?>"></div>
      </div>

      <table class="illustration-table">
        <tr>
          <td><input type="checkbox" name="all_cheked"></td>
          <td></td>
          <td>Id</td>
          <td><?=$messG['Активність']?></td>
          <td><?=$mess['Назва']?></td>
          <td><?=$messG['Сортування']?></td>
          <td><?=$mess['Ціна']?></td>
          <td><?=$mess['Зображення']?></td>
          <td><?=$messG['Час оновлення']?></td>
          <td><?=$messG['Ким оновлений']?></td>
        </tr>
        <?php if($products['result_DB']->num_rows > 0){
          while($arResult = hsc($products['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/products/?edit=<?=$arResult['id']?>"><?=$messG['Редагувати']?></a>
                  <a href="/admin/products/?del=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
                </div>
              </td>
              <td><?=(int)$arResult['id']?></td>
              <td data-input="ex|checkbox|arr[<?=$arResult['id']?>][active]"><?=Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']][$arResult['active']]?>
              </td>
              <td><?=$arResult['name_'.$arMainParam['length_admin']]?></td>
              <td data-input="ex|number|arr[<?=$arResult['id']?>][sort]"><?=$arResult['sort']?></td>
              <td data-input="ex|number|arr[<?=$arResult['id']?>][price]"><?=$arResult['price']?></td>
              <td>
                <?php if(!empty($arResult['img_anons'])){ ?>
                  <div class="panel-photo">
                    <img src="<?=$arResult['img_anons']?>" alt="<?=$arResult['img_seo_alt_'.$arMainParam['length_admin']]?>">
                  </div>
                <?php } ?>
              </td>
              <td><?=$arResult['data_custom']?></td>
              <td><?=$arResult['user_custom']?></td>
            </tr>
          <?php }
        } else { ?>
          <tr>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
          </tr>
        <?php } ?>
      </table>
    </form>
    <div class="bottom-table">
      <?=$products['pagination']?>
    </div>
  </div>
<?php } ?>