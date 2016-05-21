<div class="main-view-content">
    <div class="custom-content-form">
        <form action="" method="post" onsubmit="return okFrom();">
            <div class="line-custom">
              <p class="header-name">Настройки головного модуля</p>
            </div>
            <table class="edFormEdit">
              <tr>
                <td></td>
                <td>Назва</td>
                <td>Id</td>
                <td>Open Graph RDFa</td>
                <td>Коли зміненна</td>
                <td>Ким зміненна</td>
              </tr>

              <?php while($arResult = $main_module->fetch_assoc()){ ?>
              <tr>
                <td>
                  <span class="icon-mob-menu" onclick="openEdit(this);"></span>
                  <div class="menu-edit">
                    <a href="/admin/main-module/edit?id=<?=(int)$arResult['id']?>">
                        <span class="icon-content"></span>
                        Змінити
                    </a>
                  </div>
                </td>
                <td><?=hsc($arResult['module'])?></td>
                <td><?=(int)$arResult['id']?></td>
                <td><?=(($arResult['open_graph_page'] == 0)? 'Ні' : 'Так')?></td>
                <td><?=hsc($arResult['date_custom'])?></td>
                <td><?=hsc($arResult['user_custom'])?></td>
              </tr>
              <?php } ?>

            </table>
        </form>
        <div class="dinamicEdit">
          <a class="reload_file" href="/admin/main-module/?reload=ok">Поновити кеш файлів</a>
          <?=(isset($info)? '<span class="reload_ok">'.$info.'</span>' : '');?>
        </div>
    </div>
</div>