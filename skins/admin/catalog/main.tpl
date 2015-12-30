<div class="commentview">
    <?=((isset($info))? '<p class="h1">'.$info.'</p>' :  "");?>
    <span class="line-silver"></span>
    <div class="comment-list">
        <a class="add-catalog" href="/admin/catalog/add">Додати товар</a>
        <form method="post" action="" onsubmit="return okFrom();">
            <?php while($row = $res->fetch_assoc()){ ?>
               <div class="list-element <?=(($row['active'] == 0)? "red" : "grean")?>">
                   <input type="checkbox" name="ids[]" value="<?=(int)$row['id']?>">
                   <div class="photo-anons">
                       <a href="/admin/catalog/edit/<?=(int)$row["id"]?>"><img src="<?=((empty($row['anons_photo']))? Core::$NON_PHOTO : hsc($row['anons_photo']))?>" alt="Childrens-dream" title="Childrens-dream"></a>
                   </div>
                   <div>
                       <a href="/admin/catalog/edit/<?=(int)$row["id"]?>"><?=hsc($row["name"])?></a>
                       <p><?=(int)$row["price"]?> грн.</p>
                   </div>
               </div>
            <?php } ?>
            <div class="clear"></div>
            <input type="submit" value="Видалити" name="delete">
            <input type="submit" value="Деактивувати" name="deactive">
            <input type="submit" value="Активувати" name="active">
        </form>
    </div>
</div>