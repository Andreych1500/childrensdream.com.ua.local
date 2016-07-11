<div class="section-interface-k1">
  <div class="line-custom">
    <p class="header-name">Оновлення кеш файлів</p>
  </div>
  <table class="illustration-table">
    <tr>
      <td>№</td>
      <td>Версія кешу</td>
      <td>Час оновлення</td>
      <td>Ким оновлена</td>
    </tr>
    <tr>
      <td><?=(int)$arResult['number_cache']?></td>
      <td><?=(int)$arResult['new_resource']?></td>
      <td><?=hsc($arResult['date_custom'])?></td>
      <td><?=hsc($arResult['user_custom'])?></td>
    </tr>
  </table>
  <div class="bottom-table">
    <a class="reload-file" href="/admin/setting/update-files/?reload=ok">Поновити кеш файлів</a>
  </div>
</div>