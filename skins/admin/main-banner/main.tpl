<div class="main-view-content">
  <div class="custom-content-form">
    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom">
        <a href="/admin/main-banner/add/" class="add-el icon-plus">Добавити елемент</a>
        <input type="submit" value="Активувати" name="active">
        <input type="submit" value="Деактивувати" name="deactive">
        <input type="submit" value="Видалити" name="delete">
      </div>
      <table class="edFormEdit">
        <tr>
          <td><input type="checkbox" name="all_cheked"></td>
          <td></td>
          <td>Активність</td>
          <td>Назва</td>
          <td>Сортування</td>
          <td>Id</td>
          <td>Зображення</td>
          <td>Дата створення</td>
          <td>Коли зміненна</td>
          <td>Ким зміненна</td>
        </tr>
        <?php while($arResult = $main_banner->fetch_assoc()){ ?>
        <tr>
          <td>
            <input type="checkbox" name="ids[]" value="<?=$arResult['id']?>">
            <input type="hidden" name="del[<?=(int)$arResult['id']?>]" value="<?=hsc($arResult['img_ua'])?>|<?=hsc($arResult['img_ru'])?>">
          </td>
          <td>
            <span class="icon-mob-menu" onclick="openEdit(this);"></span>
            <div class="menu-edit">
              <a href="/admin/main-banner/edit?id=<?=(int)$arResult['id']?>">
                <span class="icon-content"></span>
                Змінити
              </a>
              <span class="delete icon-cross" onclick="deleteElement(<?=(int)$arResult['id']?>, this, '<?=Core::$DIR_PHOTOS_AND_DB_TABLE_NAME['main_banner']?>')">Видалити</span>
            </div>
          </td>
          <td rel_edit="ex|checkbox|resArr[<?=(int)$arResult['id']?>][active]"><?=(($arResult['active'] == 0)? 'Ні' : 'Так')?></td>
          <td rel_edit="ex|text|resArr[<?=(int)$arResult['id']?>][name]"><?=hsc($arResult['name'])?></td>
          <td rel_edit="ex|number|resArr[<?=(int)$arResult['id']?>][sort]"><?=(int)$arResult['sort']?></td>
          <td><?=(int)$arResult['id']?></td>
          <td>
            <?php if(!empty($arResult['img_ua'])){ ?>
            <div class="panel-photo"><img src="<?=hsc($arResult['img_ua'])?>" alt="<?=hsc($arResult['name'])?>"></div>
            <?php } ?>
          </td>
          <td><?=hsc($arResult['date_create'])?></td>
          <td><?=hsc($arResult['date_custom'])?></td>
          <td><?=hsc($arResult['user_custom'])?></td>
        </tr>
        <?php } ?>
      </table>
      <div class="dinamicEdit">
        <span class="icon-pencil"></span>
      </div>
    </form>
  </div>
</div>