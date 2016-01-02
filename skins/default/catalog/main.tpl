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
    <div class="dateil-info"></div>
    <div class="desc-info st-2"></div>
    <div class="haracteristic"></div>
<?php } ?>