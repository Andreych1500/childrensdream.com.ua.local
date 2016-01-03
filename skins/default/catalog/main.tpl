<?php if($_GET['page'] == 'main'){ ?>

<div class="catalog st-1" id="catalog">
    <div class="text-item">
        <div class="hText">
            <table>
                <tr>
                    <td><span class="line"></span></td>
                    <td><span><?=$mess['CATALOG'];?></span></td>
                    <td><span class="line"></span></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="catalog-list">
        <?php if($catalog->num_rows > 0){
            while($el = $catalog->fetch_assoc()){ ?>
                <div class="el-item">
                    <div class="photos">
                        <a href="<?=(isset($lang)? '/ru/' : '/')?>catalog/<?=$el['seo_name']?>"><img src="<?=hsc($el['anons_photo'])?>" alt="Childreans-dream" title="Childreans-dream"></a>
                    </div>
                    <div class="desk-info">
                        <a href="<?=(isset($lang)? '/ru/' : '/')?>catalog/<?=$el['seo_name']?>"><span><?=hsc($el['name'])?></span></a>
                        <p><?=hsc($el['price'])?> <?=$mess['PRICE'];?></p>
                        <p class="aviability">
                            <span class="<?=(((int)$el['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
                            <span><?=(((int)$el['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
                        </p>
                    </div>
                </div>
                <?php
            }
        } else { ?>
            <div class="no-element"><?=$mess['NO_ELEMETN']?></div>
        <?php } ?>
        <div class="clear"></div>
    </div>
</div>

<?php } else { ?>
    <?php wtf($el,1);?>

    <div class="dateil-info"></div>

    <div class="desc-info">
      <div class="item">
        <div class="headers">
          <span></span>
          <p class="hText"><?=$mess['MIN_OPUS']?></p>
          <span></span>
        </div>
        <div class="view-info">
            <div class="descript-text"><?=nl2br(hsc($el['description']))?></div>
            <div class="cirkl-photo">
              <div><img src="<?=hsc($el['descrip_photo'])?>" alt="Childreans-drea" title="Childreans-dream"></div>
            </div>
        </div>
      </div>
    </div>

    <div class="haracteristic">
        <div class="headers">
            <span></span>
            <p><?=$mess['HARAKTERISTIC']?></p>
            <span></span>
        </div>
        <div class="table-haracteristic">
            <div class="tr">
              <div><?=$mess['FORMA']?></div>
              <div><?=((empty($el['form']))? '-' : hsc($el['form']))?></div>
            </div>
            <div class="tr">
              <div><?=$mess['TYPE']?></div>
              <div><?=((empty($el['type']))? '-' : hsc($el['type']))?></div>
            </div>
            <div class="tr">
                <div><?=$mess['SIZE']?></div>
                <div><?=((empty($el['size']))? '-' : hsc($el['size']))?></div>
            </div>
            <div class="tr">
                <div><?=$mess['WEIGHT']?></div>
                <div><?=((empty($el['weight']))? '-' : (int)$el['weight'].' '.$mess['KG'])?></div>
            </div>
            <div class="tr">
                <div><?=$mess['HEIGHT']?></div>
                <div><?=((empty($el['height']))? '-' : (int)$el['height'].' '.$mess['SM'])?></div>
            </div>
            <div class="tr">
                <div><?=$mess['RIGIDITY']?></div>
                <div><?=((empty($el['rigidity']))? '-' : hsc($el['rigidity']))?></div>
            </div>
            <div class="tr">
                <div><?=$mess['ANATOMING']?></div>
                <div><?=((empty($el['anatoming']))? '-' : (((int)$el['anatoming'] == 1)? $mess['NO'] : $mess['YES'] ))?></div>
            </div>
            <div class="tr">
                <div><?=$mess['ORTOPEDING']?></div>
                <div><?=((empty($el['ortopeding']))? '-' : (((int)$el['ortopeding'] == 1)? $mess['NO'] : $mess['YES'] ))?></div>
            </div>
            <div class="tr">
                <div><?=$mess['GARANTY']?></div>
                <div><?=((empty($el['garanty']))? '-' : (int)$el['garanty'].' '.$mess['MONTH'])?></div>
            </div>
        </div>
    </div>
<?php } ?>