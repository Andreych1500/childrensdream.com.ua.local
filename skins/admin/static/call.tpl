<div class="commentview">
    <?=((isset($info))? '<p class="h1">'.$info.'</p>' :  "");?>
    <span class="line-silver"></span>
    <div class="comment-list">
        <form method="post" name="call" action="" onsubmit="return okFrom();">
            <?php if($res->num_rows){ ?>
                <?php while($row = $res->fetch_assoc()){ ?>
                    <div class="comment-item <?=(($row['active'] == 1)? 'grean' : 'red')?>">
                        <span>-<?=hsc($row['name']);?></span>
                        <span><?=hsc($row['date']);?></span>
                        <div class="text"><?=nl2br(hsc($row['text']));?></div>
                        <div class="editWindow">
                            <input type="checkbox" name="ids[]" value="<?=(int)$row['id']?>">
                        </div>
                    </div>
                    <span class="line"><span></span></span>
                <?php } ?>
            <?php } else { ?>
                <div class="comment-item">
                    <p class="no-item"><?=$mess['NO_COMMENT']?></p>
                </div>
                <span class="line"><span></span></span>
            <?php } ?>
            <input type="submit" value="Не прочитане" name="deactive">
            <input type="submit" value="Прочитане" name="active">
        </form>
    </div>
</div>