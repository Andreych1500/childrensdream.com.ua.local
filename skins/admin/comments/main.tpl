<?php if(isset($_REQUEST['view'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$mess['Відгук'].' № '?><?=(int)$_REQUEST['view']?></p>
      <a class="back-url" href="/admin/comments/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Перегляд']?></li>
    </ul>

    <form class="content-form" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="header-line"><?=$mess['Інформація про відгук']?></div>

        <div class="spec-list">
          <p class="p-td"><span><?=$mess['Дата']?>:</span><?=$arResult['data_create']?></p>
          <p class="p-td"><span><?=$mess['Від кого']?>:</span><?=$arResult['email']?></p>
          <p class="p-td"><span><?=$mess['Ip користувача']?>:</span><?=$arResult['user_ip']?></p>
          <p class="p-td"><span><?=$mess['Контактна особа']?>:</span><?=$arResult['name']?></p>
          <p class="p-td"><span><?=$mess['Відгук']?>:</span><br><?=$arResult['text']?></p>
        </div>
      </div>

    </form>
  </div>
<?php } elseif(isset($_REQUEST['edit'])) { ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$messG['Редагування елемента']?></p>
      <a class="back-url" href="/admin/comments/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Настройки']?></li>
    </ul>

    <form class="content-form" action="" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="header-line"><?=$mess['Текст та дані']?></div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Контактна особа']?>:<span class="accent">*</span></div>
          <input <?=(isset($check['name'])? $check['name'] : '')?> type="text" name="name" value="<?=(isset($error)? hsc($_POST['name']) : $arResult['name'])?>">
        </div>

        <div class="input-value">
          <div class="name-section">Email:<span class="accent">*</span></div>
          <input <?=(isset($check['email'])? $check['email'] : '')?> type="text" name="email" value="<?=(isset($error)? hsc($_POST['email']) : $arResult['email'])?>">
        </div>

        <div class="input-value">
          <div class="name-section"><?=$mess['Відгук']?>:</div>
          <textarea <?=(isset($check['text'])? $check['text'] : '')?> name="text"><?=((isset($error))? hsc($_POST['text']) : $arResult['text'])?></textarea>
        </div>
      </div>

      <input type="submit" value="<?=$messG['Зберегти']?>" name="ok">
    </form>
  </div>
<?php } else { ?>
  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name"><?=$mess['Список відгуків']?></p>
    </div>

    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom-next">
        <input type="submit" value="<?=$messG['Прочитаний']?>" name="activate" class="option-el">
        <input type="submit" value="<?=$messG['Непрочитаний']?>" name="deactivate" class="option-el">
        <input type="submit" value="<?=$messG['Видалити']?>" name="delete" class="option-el">
      </div>

      <table class="illustration-table">
        <tr>
          <td><input type="checkbox" name="all_cheked"></td>
          <td></td>
          <td><?=$mess['Відгук']?> №</td>
          <td><?=$mess['Показано']?></td>
          <td><?=$mess['Контактна особа']?></td>
          <td>Email</td>
          <td><?=$messG['Дата створення']?></td>
          <td><?=$mess['Ip користувача']?></td>
        </tr>
        <?php if($comments['result_DB']->num_rows > 0){
          while($arResult = hsc($comments['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/comments/?view=<?=$arResult['id']?>"><?=$messG['Переглянути']?></a>
                  <a href="/admin/comments/?edit=<?=$arResult['id']?>"><?=$messG['Редагувати']?></a>
                  <a href="/admin/comments/?del=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
                </div>
              </td>
              <td><?=(int)$arResult['id']?></td>
              <td><span class="<?=(($arResult['active'] == 0)? 'icon-cross' : 'icon-good')?>"></span></td>
              <td><?=$arResult['name']?></td>
              <td><?=$arResult['email']?></td>
              <td><?=$arResult['data_create']?></td>
              <td><?=$arResult['user_ip']?></td>
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
          </tr>
        <?php } ?>
      </table>
    </form>
    <div class="bottom-table">
      <?=$comments['pagination']?>
    </div>
  </div>
<?php } ?>