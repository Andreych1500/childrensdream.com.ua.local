<div class="fix-position text-style">
  <p class="header-h1"><?=$mess['Контактні дані']?>:</p>
  <table class="contact-data">
    <tr>
      <td><?=$mess['Телефон']?>:</td>
      <td>
        <a href="<?=(isMobile()? 'tel' : 'callto')?>:38-096-263-47-28" title="<?=$mess['Телефон']?>">+38 (096) 263-47-28</a>
      </td>
    </tr>
    <tr>
      <td><?=$mess['Телефон менеджера']?>:</td>
      <td>
        <a href="<?=(isMobile()? 'tel' : 'callto')?>:38-098-570-43-77" title="<?=$mess['Телефон менеджера']?>">+38 (098) 570-43-77</a>
      </td>
    </tr>
    <tr>
      <td>E-mail:</td>
      <td>
        <a href="mailto:cdmatrasses@gmail.com">cdmatrasses@gmail.com</a>
      </td>
    </tr>
  </table>

  <a class="massage-click" href="<?=$link_lang?>#call" title="<?=$mess['Напишіть нам']?>"><?=$mess['Напишіть нам']?>...</a>

  <div id="map-canvas"></div>
</div>