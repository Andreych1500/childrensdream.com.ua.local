<?php if($globalAccess){ ?>
  <div class="box-info">
    <div class="bi-header">Про систему</div>
    <div class="bi-text">
      <div class="block-first-text"><?=$arResult['system_create']?></div>
      <div class="block-img">
        <img src="<?=$arResult['logo_system']?>" alt="Розробка Савіцького Андрія" title="Розробка Савіцького Андрія">
      </div>
      <table class="bi-table">
        <tr>
          <td>Версія PHP:</td>
          <td><?=$arResult['version_php']?></td>
        </tr>
        <tr>
          <td>Веб-сервер:</td>
          <td><?=$arResult['web_server']?></td>
        </tr>
        <tr>
          <td>Версія ядра:</td>
          <td><?=$arResult['version_core']?></td>
        </tr>
        <tr>
          <td>Адреса сайта:</td>
          <td><a href="/"><?=$arResult['address_site']?></a></td>
        </tr>
        <tr>
          <td>Сайт розроблений:</td>
          <td><?=$arResult['site_create']?></td>
        </tr>
        <tr>
          <td>Відповідальне лице:</td>
          <td><?=$arResult['responsible_face']?></td>
        </tr>
        <tr>
          <td>Підтримка SЕО:</td>
          <td><?=yesNo($arResult['support_seo'])?></td>
        </tr>
        <tr>
          <td>Підтримка магазину:</td>
          <td><?=yesNo($arResult['support_shop'])?></td>
        </tr>
        <tr>
          <td>Щомісячна плата:</td>
          <td><?=$arResult['monthly_fee']?></td>
        </tr>
        <tr>
          <td>Телефон:</td>
          <td><a href="<?=(isMobile()? 'tel' : 'callto')?>:38-097-996-73-12"><?=$arResult['phone']?></a></td>
        </tr>
        <tr>
          <td>E-mail:</td>
          <td><a href="mailto:<?=$arResult['email']?>"><?=$arResult['email']?></a></td>
        </tr>
      </table>
    </div>
  </div>
  <div class="box-info">
    <div class="bi-header">Про магазин</div>
    <div class="bi-text">
      <table class="bi-table">
        <tr>
          <td>Логотип:</td>
          <td class="reset-td1">
            <img src="<?=$arResult['brandPhoto']?>" alt="<?=$arResult['brand']?>" title="<?=$arResult['brand']?>">
          </td>
        </tr>
        <tr>
          <td>Марка магазину:</td>
          <td><?=$arResult['brand']?></td>
        </tr>
        <tr>
          <td>Покупок:</td>
          <td><?=$goodShop?></td>
        </tr>
        <tr>
          <td>Активних товарів:</td>
          <td><?=$actProduct?></td>
        </tr>
      </table>
    </div>
  </div>
  <div class="box-info">
    <div class="bi-header">Адміністративна панель</div>
    <div class="bi-text">
      <p><?=$arResult['admin_panel']?></p>
    </div>
  </div>
<?php } else { ?>

  <form class="auth-block" action="" method="post">
    <div class="style-open-form no-active">
      <div class="style-form-block">
        <div class="auth-name">Авторизація</div>
        <div class="input-name">Логін</div>
        <input required class="<?=(isset($error['notuser'])? $error['notuser'] : "")?>" type="text" name="login" value="<?=(isset($_POST['login'])? hsc($_POST['login']) : '');?>">
        <div class="input-name">Пароль</div>
        <input required class="<?=(isset($error['notuser'])? $error['notuser'] : "")?>" type="password" name="pass" value="<?=(isset($_POST['pass'])? hsc($_POST['pass']) : '');?>">
        <label><input type="checkbox" name="save">Запам&rsquo;ятати мене на цьому комп&rsquo;ютері</label>
        <input type="submit" name="submit" value="Вхід">
      </div>
    </div>
  </form>

<?php } ?>