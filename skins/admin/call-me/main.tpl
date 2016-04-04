<div class="main-view-content">
  <div class="custom-content-form">
    <form action="" method="post" onsubmit="return okFrom();">
        <div class="line-custom">
            <input type="submit" value="Прочитаний" name="active">
            <input type="submit" value="Непрочитаний" name="deactive">
            <input type="submit" value="Видалити" name="delete">
        </div>
        <table class="edFormEdit">
          <tr>
            <td><input type="checkbox" name="all_cheked"></td>
            <td></td>
            <td>Оброблено</td>
            <td>ФІО користувача</td>
            <td>Id</td>
            <td>e-mail</td>
            <td>Дата відправки</td>
            <td>Ip користувача</td>
          </tr>
          <?php while($arResult = $call_me->fetch_assoc()){ ?>
          <tr>
            <td>
              <input type="checkbox" name="ids[]" value="<?=$arResult['id']?>">
            </td>
            <td>
              <span class="icon-mob-menu" onclick="openEdit(this);"></span>
              <div class="menu-edit">
                <a href="/admin/call-me/view?id=<?=(int)$arResult['id']?>">
                    <span class="icon-content"></span>
                    Відкрити
                </a>
                <span class="delete icon-cross" onclick="deleteElement(<?=(int)$arResult['id']?>, this, '<?=Core::$DIR_PHOTOS_NAME['call_me']?>')">Видалити</span>
              </div>
            </td>
            <td><span class="<?=(($arResult['active'] == 0)? 'icon-cross' : 'icon-good')?>"></span></td>
            <td><?=hsc($arResult['name'])?></td>
            <td><?=(int)$arResult['id']?></td>
            <td><?=hsc($arResult['email'])?></td>
            <td><?=hsc($arResult['date_create'])?></td>
            <td><?=hsc($arResult['user_ip'])?></td>
          </tr>
          <?php } ?>
        </table>
    </form>
  </div>
</div>