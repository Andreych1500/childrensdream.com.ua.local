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
                        <a href="<?=(isset($lang)? '/ru/' : '/')?>catalog/<?=$el['seo_name']?>"><span><?=(isset($lang)? hsc($el['name_ru']) : hsc($el['name']))?></span></a>
                        <p><?=number_format(hsc($el['price']), 0, ',', ' ')?> <?=$mess['PRICE'];?></p>
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

    <div class="dateil-info">
      <?php if(isset($photos)){ ?>
      <div class="el-slider">
        <div class="slider-nav <?=((count($photos) > 3)? 'center-photo' : 'currenc')?>">
          <?php foreach($photos as $key => $value){ ?>
              <div class="items-photo"><img src="<?=hsc($value[0])?>" alt="Childrens-dream"></div>
          <?php } ?>
        </div>

        <div class="slider-for <?=((count($photos) > 3)? '' : 'good-top')?>">
          <?php foreach($photos as $key => $value){ ?>
          <div class="item-photo"><img src="<?=hsc($value[0])?>" alt="Childrens-dream"></div>
          <?php } ?>
        </div>
      </div>
      <?php } ?>
      <div class="el-text <?=(!isset($photos)? 'good-view' : '')?>">
        <p class="name-el"><?=hsc((isset($lang)? $el['name_ru'] : $el['name']))?></p>
        <p class="aviability">
          <span class="<?=(((int)$el['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
          <span><?=(((int)$el['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
        </p>
        <p class="desc-el"><?=hsc((isset($lang)? $el['description_ru'] : $el['description']))?></p>
        <?php if($el['availability'] == 1){ ?>
        <div class="el-shop">
          <p><?=number_format(hsc($el['price']), 0, ',', ' ')?> <?=$mess['PRICE'];?></p>
          <div class="add-shop <?=(!empty($basket)? $basket : '')?>" <?php if(empty($basket)){ ?> onclick="addToCard(<?=(int)$el['id']?>,'<?=$mess['BASKETOK']?>','1')"<?php }?>>
              <?=(empty($basket)? '<span class="icon-basket"></span>' : '')?>
              <?=(!empty($basket)? $mess['BASKETOK'] : $mess['ADDSHOP'])?>
          </div>
        </div>
        <?php } ?>
      </div>
    </div>

    <div class="desc-info">
      <div class="item">
        <div class="headers">
          <span></span>
          <p class="hText"><?=$mess['MIN_OPUS']?></p>
          <span></span>
        </div>
        <div class="view-info">
            <div class="descript-text"><?=nl2br((isset($lang)? hsc($el['text_ru']) : hsc($el['text'])))?></div>
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
              <div><?=((empty((isset($lang)? $el['form_ru'] : $el['form'])))? '-' : (isset($lang)? hsc($el['form_ru']) : hsc($el['form'])))?></div>
            </div>
            <div class="tr">
              <div><?=$mess['TYPE']?></div>
              <div><?=((empty((isset($lang)? $el['type_ru'] : $el['type'])))? '-' : (isset($lang)? hsc($el['type_ru']) : hsc($el['type'])))?></div>
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
                <div><?=((empty((isset($lang)? $el['rigidity_ru'] : $el['rigidity'])))? '-' : (isset($lang)? hsc($el['rigidity_ru']) : hsc($el['rigidity'])))?></div>
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