<?php if(isset($_REQUEST['view'])){ ?>
  <div class="section-interface-k2">
    <div class="line-custom-edit">
      <p class="header-name-edit"><?=$mess['Повідомлення'].' № '?><?=(int)$_REQUEST['view']?></p>
      <a class="back-url" href="/admin/comments/call-me/"><?=$messG['Назад']?></a>
    </div>

    <!-- Menu tabs --->
    <ul class="tabs-panel">
      <li class="active-tab"><?=$messG['Перегляд']?></li>
    </ul>

    <form class="content-form" method="post">

      <!-- Element tabs -->
      <div class="tabs active-block-tabs">
        <div class="header-line"><?=$mess['Інформація замовлення']?></div>

        <div class="spec-list">
          <p class="p-td"><span><?=$mess['Дата']?>:</span><?=$arResult['data_create']?></p>
          <p class="p-td"><span><?=$mess['Від кого']?>:</span><?=$arResult['email']?></p>
          <p class="p-td"><span><?=$mess['Ip користувача']?>:</span><?=$arResult['user_ip']?></p>
          <p class="p-td"><span><?=$mess['Контактна особа']?>:</span><?=$arResult['name']?></p>
          <p class="p-td"><span><?=$mess['Тема']?>:</span><?=$arResult['them']?></p>
          <p class="p-td"><span><?=$mess['Текст']?>:</span><br><?=$arResult['text']?></p>
        </div>
      </div>

    </form>
  </div>
<?php } else { ?>
  <div class="section-interface-k1">
    <div class="line-custom">
      <p class="header-name"><?=$messG['Зворотні звінки']?></p>
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
          <td><?=$mess['Повідомлення']?> №</td>
          <td><?=$mess['Оброблено']?></td>
          <td><?=$mess['Контактна особа']?></td>
          <td>Email</td>
          <td><?=$mess['Дата замовлення']?></td>
          <td><?=$mess['Ip користувача']?></td>
        </tr>
        <?php if($call_me['result_DB']->num_rows > 0){
          while($arResult = hsc($call_me['result_DB']->fetch_assoc())){ ?>
            <tr>
              <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
              <td class="relative">
                <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
                <div class="menu-update">
                  <a href="/admin/comments/call-me/?view=<?=$arResult['id']?>"><?=$messG['Переглянути']?></a>
                  <a href="/admin/comments/call-me/?del=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
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
      <?=$call_me['pagination']?>
    </div>
  </div>
<?php } ?>