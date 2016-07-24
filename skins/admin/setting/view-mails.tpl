<?php if(isset($_REQUEST['view'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$mess['Шаблон листа']?></p>
      <a class="back-url" href="/admin/setting/view-mails/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <?php foreach(explode(',', $arResult['list_length']) as $k => $v){ ?>
        <li class="<?=(($k == 0)? 'active-tab' : '')?>"><?=strtoupper($v)?></li>
      <?php } ?>
    </ul>

    <form class="content-form" action="" method="post" onsubmit="return okFrom();">

      <!-- Element tabs -->
      <?php foreach(explode(',', $arResult['list_length']) as $k => $v){ ?>
        <div class="tabs <?=(($k == 0)? 'active-block-tabs' : '')?>">
          <div class="header-line"><?=$mess['Вигляд листа']?>:</div>
          <div class="html-view-block"><?=preg_replace("#body#uis", 'div', TemplateMail::formationMail('', $arResult['symbol_code'], $v, $arMainParam, 0))?></div>
        </div>
      <?php } ?>

      <div class="technik-off-onn">
        <?=$mess['Тестова відправка листа']?>:
        <div class="procedure-section">
          <p class="st-form"><span><?=$mess['Ким відправляється']?>:</span> <?=$arMainParam['from_email']?></p>
          <p class="st-form"><span><?=$mess['Кому']?>:</span>
            <input <?=(isset($check['test_email'])? $check['test_email'] : '')?> type="email" name="test_email" value="">
          </p>

          <?php foreach(explode(',', $arResult['list_length']) as $k => $v){ ?>
            <label><?=strtoupper($v)?>:<input type="radio" name="lang_send" value="<?=$v?>" <?=(($k == 0 || (isset($_POST['lang_send']) && $_POST['lang_send'] == $v)? 'checked' : ''))?>></label>
          <?php } ?>
          <input type="submit" name="send" value="<?=$mess['Відправити тестовий лист']?>">
        </div>
      </div>

      <input type="submit" value="<?=$messG['Зберегти']?>" name="ok">
    </form>
  </div>
<?php } else { ?>
  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name"><?=$mess['Шаблони листів']?></p>
    </div>

    <table class="illustration-table">
      <tr>
        <td></td>
        <td>ID</td>
        <td><?=$messG['Активність']?></td>
        <td><?=$mess['Назва листа']?></td>
        <td><?=$mess['Прихована копія']?></td>
        <td><?=$messG['Символьний код']?></td>
      </tr>
      <?php if($view_mails['result_DB']->num_rows > 0){
        while($arResult = hsc($view_mails['result_DB']->fetch_assoc())){ ?>
          <tr>
            <td class="relative">
              <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
              <div class="menu-update">
                <a href="/admin/setting/view-mails/?view=<?=$arResult['id']?>"><?=$messG['Переглянути']?></a>
              </div>
            </td>
            <td><?=(int)$arResult['id']?></td>
            <td><?=Core::$GLOB_OPTION['logicYesNo'][$arMainParam['length_admin']][$arResult['active']]?></td>
            <td><?=$arResult['name']?></td>
            <td><?=$arResult['hidden_copy']?></td>
            <td><?=$arResult['symbol_code']?></td>
          </tr>
        <?php }
      } else { ?>
        <tr>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
        </tr>
      <?php } ?>
    </table>
    <div class="bottom-table">
      <?=$view_mails['pagination']?>
    </div>
  </div>
<?php } ?>