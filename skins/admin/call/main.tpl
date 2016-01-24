<div class="commentview">
    <?=((isset($info))? '<p class="h1">'.$info.'</p>' :  "");?>
    <span class="line-silver"></span>
    <div class="comment-list">
        <form method="post" action="" onsubmit="return okFrom();">
            <?php if($res->num_rows){ ?>
                <?php while($row = $res->fetch_assoc()){ ?>
                    <div class="comment-item <?=(($row['active'] == 1)? 'grean' : 'red')?>">
                        <span>-<?=hsc($row['name']);?></span>
                        <span><?=hsc($row['date']);?></span>
                        <div class="text"><?=nl2br(hsc($row['text']));?></div>
                        <div class="editWindow">
                            <a href="/admin/comments/edit/<?=(int)$row['id']?>">Редагувати</a>
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
            <select name="cat">
                <?php foreach(Core::$CAT_OTZUV as $key => $value){ ?>
                    <option <?=((!isset($_POST['cat']))? (($key == 5)? 'selected="selected"' : '') : (($_POST['cat'] == $key)? 'selected="selected"' : ''))?> value="<?=$key?>"><?=$value?></option>
                <?php } ?>
            </select>
            <input type="submit" value="Фільтрувати" name="filter">
            <input type="submit" value="Видалити" name="delete">
            <input type="submit" value="Деактивувати" name="deactive">
            <input type="submit" value="Активувати" name="active">
        </form>
    </div>
</div>