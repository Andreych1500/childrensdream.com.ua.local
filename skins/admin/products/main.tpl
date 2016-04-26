<div class="main-view-content">
  <div class="custom-content-form">
    <form action="" method="post" onsubmit="return okFrom();">
      <div class="line-custom">
        <a href="/admin/products/add/" class="add-el icon-plus">Добавити елемент</a>
        <input type="submit" value="Активувати" name="activates">
        <input type="submit" value="Деактивувати" name="deactive">
        <input type="submit" value="Видалити" name="delete">
      </div>
      <table class="edFormEdit">
        <tr>
            <td><input type="checkbox" name="all_cheked"></td>
            <td></td>
            <td>Id</td>
            <td>Активність</td>
            <td>Назва</td>
            <td>Сортування</td>
            <td>Ціна</td>
            <td>Зображення</td>
            <td>Дата створення</td>
            <td>Коли зміненна</td>
            <td>Ким зміненна</td>
        </tr>
        <?php while($arResult = $products->fetch_assoc()){
            // --- MORE FILE ---
            if(!empty($arResult['cMorePhoto'])){
                $cMorePhoto = '';
                $arResult['cMorePhoto'] = explode('#',$arResult['cMorePhoto']);

                foreach($arResult['cMorePhoto'] as $key => $value){
                    $res = explode('|',$value,2);

                    $cMorePhoto .= $res[0].'|';
                }

                $cMorePhoto = trim($cMorePhoto,"|");
            }
            // --- END MORE FILE ---
        ?>
        <tr>
          <td>
            <input type="checkbox" name="ids[]" value="<?=$arResult['id']?>">
            <input type="hidden" name="del[<?=(int)$arResult['id']?>]" value="<?=hsc($arResult['cAnonsPhoto'])?>|<?=hsc($arResult['cCirklePhoto'])?>|<?=hsc($cMorePhoto)?>">
          </td>
          <td>
            <span class="icon-mob-menu" onclick="openEdit(this);"></span>
            <div class="menu-edit">
              <a href="/admin/products/edit?id=<?=(int)$arResult['id']?>">
                <span class="icon-content"></span>
                Змінити
              </a>
              <span class="delete icon-cross" onclick="deleteElement(<?=(int)$arResult['id']?>, this, '<?=Core::$DIR_PHOTOS_AND_DB_TABLE_NAME['products']?>')">Видалити</span>
            </div>
          </td>
            <td><?=(int)$arResult['id']?></td>
            <td rel_edit="ex|checkbox|resArr[<?=(int)$arResult['id']?>][active]"><?=(($arResult['active'] == 0)? 'Ні' : 'Так')?></td>
            <td rel_edit="ex|text|resArr[<?=(int)$arResult['id']?>][name_ua]"><?=hsc($arResult['name_ua'])?></td>
            <td rel_edit="ex|number|resArr[<?=(int)$arResult['id']?>][sort]"><?=(int)$arResult['sort']?></td>
            <td rel_edit="ex|number|resArr[<?=(int)$arResult['id']?>][price]"><?=hsc($arResult['price'])?></td>
            <td>
            <?php if(!empty($arResult['cAnonsPhoto'])){ ?>
                <div class="panel-photo"><img src="<?=hsc($arResult['cAnonsPhoto'])?>" alt="<?=hsc($arResult['name_ua'])?>"></div>
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