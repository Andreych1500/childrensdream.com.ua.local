<div class="comments">
  <div class="block-comennts">
    <div class="view-comments">
      <h3><?=$mess['COMMENTS']?></h3>
      <p><?=$mess['YOUR_REVIEW']?></p>
      <?php if($res->num_rows){
       while($row = $res->fetch_assoc()){ ?>
       <div class="comment-item">
         <p class="text-coment"><?=nl2br(hsc($row['text']));?></p>
         <p><?=hsc($row['name']);?></p>
         <time><?=hsc($row['date_create']);?></time>
       </div>
      <?php }
      } else { ?>
      <p class="no-comments"><?=$mess['NO_COMMENT']?></p>
      <?php } ?>
    </div>

    <div class="form-comment">
      <h3><?=$mess['WORK_COMMENTS']?></h3>
      <div class="thanks"><?=$mess['THANKS'];?></div>
      <div class="hack-error"><?=$mess['HACK_ERROR']?></div>
      <form action="#" method="post" onsubmit="return checkForm('.form-comment', 'form-comment');">
        <p><?=$mess['PLEASE_NAME'];?><span> *</span></p>
        <input class="<?=((isset($errors['name']))? 'errors' : '')?>" type="text" name="name" value="<?=(isset($_POST['name'])? hsc($_POST['name']):"")?>">
        <p><?=$mess['PLEASE_EMAIL'];?><span> *</span></p>
        <input class="<?=((isset($errors['name']))? 'errors' : '')?>" type="email" name="email" value="<?=(isset($_POST['email'])? hsc($_POST['email']):"")?>">
        <p><?=$mess['PLEASE_TEXT'];?><span> *</span></p>
        <textarea class="<?=((isset($errors['name']))? 'errors' : '')?>" name="text"><?=(isset($_POST['text'])? hsc($_POST['text']):"")?></textarea>
        <input type="submit" value="<?=$mess['SUBMIT'];?>" name="submit">
      </form>
    </div>
  </div>
</div>