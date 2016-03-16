<div class="main-view-content">
    <div class="custom-content-form">
        <form action="" method="post" onsubmit="return okFrom();">
            <div class="line-custom">
              <p class="header-name">Настройки головного модуля</p>
            </div>
            <table>
              <tr>
                <td></td>
                <td>Назва</td>
                <td>Id</td>
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
              </tr>
              <?php } ?>

            </table>
        </form>
    </div>
</div>