<div class="main-view-content">
  <div class="custom-content-form">
    <form action="" method="post" onsubmit="return okFrom();">
        <div class="line-custom">
            <input type="submit" value="Прочитаний" name="active">
            <input type="submit" value="Непрочитаний" name="deactive">
            <input type="submit" value="Видалити" name="delete">
        </div>
        <table>
          <tr>
            <td><input type="checkbox" name="all_cheked"></td>
            <td></td>
            <td>Показано</td>
            <td>ФІО користувача</td>
            <td>Id</td>
            <td>e-mail</td>
            <td>Дата відправки</td>
            <td>Ip користувача</td>
          </tr>
          <?php while($arResult = $comments->fetch_assoc()){ ?>
          <tr>
            <td>
                <input type="checkbox" name="ids[]" value="<?=$arResult['id']?>">
            </td>
            <td>
                <span class="icon-mob-menu" onclick="openEdit(this);"></span>
                <div class="menu-edit">
                    <a href="/admin/comments/view?id=<?=(int)$arResult['id']?>">
                        <span class="icon-content"></span>
                        Відкрити
                    </a>
                    <a href="/admin/comments/edit?id=<?=(int)$arResult['id']?>">
                        <span class="icon-content"></span>
                        Змінити
                    </a>
                    <span class="delete icon-cross" onclick="deleteElement(<?=(int)$arResult['id']?>, this, '<?=Core::$DIR_PHOTOS_NAME['comments']?>')">Видалити</span>
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