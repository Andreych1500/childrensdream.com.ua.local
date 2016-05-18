<div class="comments">
    <div class="view-comments">
      <meta itemprop="name" content="<?=$mess['COMMENTS']?>">
      <h3 itemscope itemtype="http://schema.org/CreativeWork">
          <?=$mess['COMMENTS']?> (<span itemprop="commentCount"><?=(int)$res->num_rows;?></span>)
          <meta itemprop="description" content="<?=$mess['YOUR_REVIEW']?>">
      </h3>
      <p><?=$mess['YOUR_REVIEW']?></p>
      <?php if($res->num_rows){
       while($row = $res->fetch_assoc()){ ?>
       <div class="comment-item" itemscope itemtype="http://schema.org/UserComments">
         <p class="text-coment" itemprop="commentText"><?=nl2br(hsc($row['text']));?></p>
         <p itemprop="creator"><?=hsc($row['name']);?></p>
         <time itemprop="commentTime" datetime="<?=substr(hsc($row['date_create']), 0, 10);?>T<?=substr(hsc($row['date_create']), 11);?>"><?=hsc($row['date_create']);?></time>
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