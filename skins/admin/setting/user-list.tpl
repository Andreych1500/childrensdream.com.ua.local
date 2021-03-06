<?php if(isset($_REQUEST['add'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Створити елемент']?></p>
      <a class="back-url" href="/admin/setting/user-list/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="header-line"><?=$mess['Доступ']?></div>

        <div class="input-value">
          <?php foreach(Core::$GLOB_OPTION['user_access'][$arMainParam['length_admin']] as $k => $v){ ?>
            <label><span><?=$v?>:</span>
              <input type="radio" <?=((isset($error) && (isset($_POST['access']) && $_POST['access'] == $k))? "checked" : (($k == 1)? "checked" : ""))?> name="access" value="<?=$k?>">
            </label>
          <?php } ?>
        </div>

        <div class="header-line"><?=$mess['Персональна інформація']?></div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Активність']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['active']))? "checked" : "")?> name="active" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Ім\'я']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['name'])? $check['name'] : '')?> type="text" name="name" value="<?=(isset($error)? hsc($_POST['name']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Прізвище']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['last_name'])? $check['last_name'] : '')?> type="text" name="last_name" value="<?=(isset($error)? hsc($_POST['last_name']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Побатькові']?>:</div>
          <input type="text" name="end_name" value="<?=(isset($error)? hsc($_POST['end_name']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span><?=$mess['Логін']?>:<span class="accent">*</span>
            <div class="pop-window"><?=$mess['Кількість символів 6_user']?></div>
          </div>
          <input <?=(isset($check['login'])? $check['login'] : '')?> type="text" name="login" value="<?=(isset($error)? hsc($_POST['login']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section">Email:<span class="accent">*</span></div>
          <input <?=(isset($check['email'])? $check['email'] : '')?> type="text" name="email" value="<?=(isset($error)? hsc($_POST['email']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span><?=$mess['Пароль']?>:<span class="accent">*</span>
            <div class="pop-window"><?=$mess['Кількість символів 6_user']?></div>
          </div>
          <input <?=(isset($check['pass'])? $check['pass'] : '')?> type="text" name="pass" value="">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Підтвердження пароля']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['check_pass'])? $check['check_pass'] : '')?> type="password" name="check_pass" value="">
        </div>

        <div class="header-line"><?=$mess['Додаткова інформація']?></div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Повідомити листом']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['male']))? "checked" : "")?> name="male" value="ok">

          <select name="mail_lenght">
            <?php foreach(explode(',', $langTestMail['list_length']) as $k => $v){ ?>
              <option value="<?=$v;?>" <?=(((isset($error) && $_POST['mail_lenght'] == $v) || !isset($error) && $k == 0)? 'selected' : "")?>>
                <?=$v;?>
              </option>
            <?php } ?>
          </select>
        </div>

        <div class="input-value upload_file" id="user_avatar" data-size="<?=$adminParam['user_avatar_size']?>">
          <div class="name-section"><?=$mess['Аватар користувача']?>:</div>
          <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['user_avatar_dir']?>')"><?=((isset($error))? (!empty($_POST['user_avatar'])? hsc($_POST['user_avatar']) : $messG['Вибрати файл']) : $messG['Вибрати файл'])?>
          </button>
          <input name="user_avatar" type="hidden" value="<?=((isset($error))? hsc($_POST['user_avatar']) : "")?>">
          <input name="del[user_avatar]" type="hidden" value="<?=((isset($error, $_POST['del']['user_avatar']))? hsc($_POST['del']['user_avatar']) : "")?>">
          <div class="photos <?=((!empty($_POST['user_avatar']))? '' : "hidden")?>">
            <img src="<?=(isset($_POST['user_avatar'])? hsc($_POST['user_avatar']) : '')?>">
          </div>
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Вік']?>:</div>
          <input type="number" name="age" value="<?=(isset($error)? (int)$_POST['age'] : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Телефон']?>:</div>
          <input type="text" name="phone" value="<?=(isset($error)? hsc($_POST['phone']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Професія']?>:</div>
          <input type="text" name="profession" value="<?=(isset($error)? hsc($_POST['profession']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section">Web-site:</div>
          <input type="text" name="web_site" value="<?=(isset($error)? hsc($_POST['web_site']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Стать']?>:</div>
          <select name="floor">
            <?php foreach(Core::$GLOB_OPTION['floor'][$arMainParam['length_admin']] as $k => $v){ ?>
              <option value="<?=$k;?>" <?=(((isset($error) && $_POST['floor'] == $k) || !isset($error) && $k == 0)? 'selected' : "")?>>
                <?=$v;?>
              </option>
            <?php } ?>
          </select>
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Країна']?>:</div>
          <input type="text" name="country" value="<?=(isset($error)? hsc($_POST['country']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Область']?>:</div>
          <input type="text" name="region" value="<?=(isset($error)? hsc($_POST['region']) : "")?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Місто']?>:</div>
          <input type="text" name="city" value="<?=(isset($error)? hsc($_POST['city']) : "")?>">
        </div>

      </div>

      <input type="submit" value="<?=$messG['Створити']?>" name="ok">
    </form>

    <form id="to_file">
      <input id="control" type="file" name="photo" onchange="addPhoto(this)" data-size="" data-set="" data-dir="">
    </form>
  </div>
<?php } elseif(isset($_REQUEST['edit'])) { ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Редагування елемента']?></p>
      <a class="back-url" href="/admin/setting/user-list/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="header-line"><?=$mess['Доступ']?></div>

        <div class="input-value">
          <?php foreach(Core::$GLOB_OPTION['user_access'][$arMainParam['length_admin']] as $k => $v){ ?>
            <label><span><?=$v?>:</span>
              <input type="radio" <?=((isset($error) && (isset($_POST['access']) && $_POST['access'] == $k))? "checked" : ($arResult['access'] == $k)? "checked" : '')?> name="access" value="<?=$k?>">
            </label>
          <?php } ?>
        </div>

        <div class="header-line"><?=$mess['Персональна інформація']?>:</div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Активність']?>:</div>
          <input type="checkbox" <?=((isset($error, $_POST['active']) || ($arResult['active'] == 1 && !isset($error)))? "checked" : "")?> name="active" value="1">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Ім\'я']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['name'])? $check['name'] : '')?> type="text" name="name" value="<?=(isset($error)? hsc($_POST['name']) : $arResult['name'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Прізвище']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['last_name'])? $check['last_name'] : '')?> type="text" name="last_name" value="<?=(isset($error)? hsc($_POST['last_name']) : $arResult['last_name'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Побатькові']?>:</div>
          <input type="text" name="end_name" value="<?=(isset($error)? hsc($_POST['end_name']) : $arResult['end_name'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span><?=$mess['Логін']?>:<span class="accent">*</span>
            <div class="pop-window"><?=$mess['Кількість символів 6_user']?></div>
          </div>
          <input <?=(isset($check['login'])? $check['login'] : '')?> type="text" name="login" value="<?=(isset($error)? hsc($_POST['login']) : $arResult['login'])?>">
        </div>

        <div class="input-value">
          <div class="name-section">Email:<span class="accent">*</span></div>
          <input <?=(isset($check['email'])? $check['email'] : '')?> type="text" name="email" value="<?=(isset($error)? hsc($_POST['email']) : $arResult['email'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><span class="pop-info">i</span><?=$mess['Новий пароль']?>:
            <div class="pop-window"><?=$mess['Кількість символів 6_user']?></div>
          </div>
          <input <?=(isset($check['new_pass'])? $check['new_pass'] : '')?> type="text" name="new_pass" value="">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Підтвердження пароля']?>:</div>
          <input <?=(isset($check['check_pass'])? $check['check_pass'] : '')?> type="password" name="check_pass" value="">
        </div>

        <div class="header-line"><?=$mess['Додаткова інформація']?></div>

        <div class="input-value upload_file" id="user_avatar" data-size="<?=$adminParam['user_avatar_size']?>">
          <button class="icon-link" type="button" onclick="getInfoFile(this, '<?=$adminParam['user_avatar_dir']?>')"><?=((isset($error))? (!empty($_POST['user_avatar'])? hsc($_POST['user_avatar']) : $messG['Вибрати файл']) : (!empty($arResult['user_avatar'])? hsc($arResult['user_avatar']) : $messG['Вибрати файл']))?>
          </button>
          <input name="user_avatar" type="hidden" value="<?=(isset($_POST['user_avatar'])? hsc($_POST['user_avatar']) : hsc($arResult['user_avatar']))?>">
          <input name="del[user_avatar]" type="hidden" value="<?=(isset($_POST['del']['user_avatar'])? hsc($_POST['del']['user_avatar']) : hsc($arResult['user_avatar']))?>">
          <div class="photos <?=((isset($_POST['user_avatar']))? '' : ((!empty($arResult['user_avatar']))? '' : "hidden"))?>">
            <img src="<?=(isset($_POST['user_avatar'])? hsc($_POST['user_avatar']) : hsc($arResult['user_avatar']))?>">
          </div>
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Вік']?>:</div>
          <input type="number" name="age" value="<?=(isset($error)? (int)$_POST['age'] : $arResult['age'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Телефон']?>:</div>
          <input type="text" name="phone" value="<?=(isset($error)? hsc($_POST['phone']) : $arResult['phone'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Професія']?>:</div>
          <input type="text" name="profession" value="<?=(isset($error)? hsc($_POST['profession']) : $arResult['profession'])?>">
        </div>

        <div class="input-value">
          <div class="name-section">Web-site:</div>
          <input type="text" name="web_site" value="<?=(isset($error)? hsc($_POST['web_site']) : $arResult['web_site'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Стать']?>:</div>
          <select name="floor">
            <?php foreach(Core::$GLOB_OPTION['floor'][$arMainParam['length_admin']] as $k => $v){ ?>
              <option value="<?=$k;?>" <?=(((isset($error) && $_POST['floor'] == $k) || !isset($error) && $arResult['floor'] == $k)? 'selected' : "")?>>
                <?=$v;?>
              </option>
            <?php } ?>
          </select>
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Країна']?>:</div>
          <input type="text" name="country" value="<?=(isset($error)? hsc($_POST['country']) : $arResult['country'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Область']?>:</div>
          <input type="text" name="region" value="<?=(isset($error)? hsc($_POST['region']) : $arResult['region'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Місто']?>:</div>
          <input type="text" name="city" value="<?=(isset($error)? hsc($_POST['city']) : $arResult['city'])?>">
        </div>
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
      <input type="submit" name="search" value="<?=$messG['Пошук']?>"><a href="/admin/setting/user-list/?filterReset=ok"><?=$messG['Відмінити']?></a>
    </form>
  </div>

  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name"><?=$mess['Список користувачів']?></p>
    </div>

    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom-next">
        <a href="/admin/setting/user-list/?add=ok" class="add-el icon-plus"><?=$messG['Створити елемент']?></a>
        <input type="submit" value="<?=$messG['Активувати']?>" name="activate" class="option-el">
        <input type="submit" value="<?=$messG['Деактивувати']?>" name="deactivate" class="option-el">
        <input type="submit" value="<?=$messG['Видалити']?>" name="delete" class="option-el">
        <div class="dynamicEdit" data-submit-lang="<?=$messG['Зберегти']?>|<?=$messG['Відмінити']?>"></div>
      </div>

      <table class="illustration-table">
        <tr>
          <td><input type="checkbox" name="all_cheked"></td>
          <td></td>
          <td>ID</td>
          <td><?=$messG['Активність']?></td>
          <td><?=$mess['Логін']?></td>
          <td>Email</td>
          <td><?=$messG['Дата створення']?></td>
          <td><?=$messG['Останній візит']?></td>
          <td><?=$messG['Ким оновлений']?></td>
        </tr>
        <?php if($user_list['result_DB']->num_rows > 0){
          while($arResult = hsc($user_list['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/setting/user-list/?edit=<?=$arResult['id']?>"><?=$messG['Редагувати']?></a>
                  <a href="/admin/setting/user-list/?del=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
                </div>
              </td>
              <td><?=(int)$arResult['id']?></td>
              <td data-input="ex|checkbox|arr[<?=$arResult['id']?>][active]"><?=Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']][$arResult['active']]?>
              </td>
              <td data-input="ex|text|arr[<?=$arResult['id']?>][login]"><?=$arResult['login']?></td>
              <td data-input="ex|email|arr[<?=$arResult['id']?>][email]"><?=$arResult['email']?></td>
              <td><?=$arResult['data_create']?></td>
              <td><?=$arResult['lastonline']?></td>
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
          </tr>
        <?php } ?>
      </table>
    </form>
    <div class="bottom-table">
      <?=$user_list['pagination']?>
    </div>
  </div>
<?php } ?>