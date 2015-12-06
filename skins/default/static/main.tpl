<div class="slider">
  <div class="slide-list">
      <div class="next-slide">
        <span class="icon-icon-left"></span>
      </div>
    <div class="slide-wrap" style="left: 0px;">
      <?php for($i=1; $i<=3; ++$i){  ?>
        <div class="slide-item">
          <img src="/skins/default/img/slide<?=$i?>.jpg" alt="/">
        </div>
      <?php } ?>
    </div>
    <div class="prev-slide">
      <span class="icon-icon-right"></span>
    </div>
    <div class="clear"></div>
  </div>
</div>

<div class="staticText" id="about">
  <div class="hText">
    <span>Про нас</span>
  </div>
  <div class="descriptinText">
    <p><?=$mess['ABOUT_TEXT1'];?></p>
    <p><?=$mess['ABOUT_TEXT2'];?></p>
    <p><?=$mess['ABOUT_TEXT3'];?></p>
    <p><?=$mess['ABOUT_TEXT4'];?></p>
    <p><?=$mess['ABOUT_TEXT5'];?></p>
  </div>
</div>

<div class="staticText" id="payment">
  <div class="hText">
    <span><?=$mess['SERVICES_TEXT0'];?></span>
  </div>
  <div class="descriptinText">
    <p><strong><?=$mess['SERVICES_TEXT1'];?></strong></p>
    <p><?=$mess['SERVICES_TEXT2'];?></p>
    <ul>
      <li><?=$mess['SERVICES_TEXT3'];?></li>
      <li><?=$mess['SERVICES_TEXT4'];?></li>
      <li><?=$mess['SERVICES_TEXT5'];?></li>
      <li><?=$mess['SERVICES_TEXT6'];?></li>
    </ul>
    <p><strong><?=$mess['SERVICES_TEXT7'];?></strong></p>
    <p><?=$mess['SERVICES_TEXT8'];?></p>
    <p><?=$mess['SERVICES_TEXT9'];?></p>
    <ul>
      <li><?=$mess['SERVICES_TEXT10'];?></li>
      <li><?=$mess['SERVICES_TEXT11'];?></li>
      <li><?=$mess['SERVICES_TEXT12'];?></li>
      <li><?=$mess['SERVICES_TEXT13'];?><strong><?=$mess['SERVICES_TEXT14'];?></strong></li>
    </ul>
  </div>
</div>