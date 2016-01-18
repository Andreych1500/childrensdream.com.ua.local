<div class="position-width">
  <div class="commentview">
    <p class="otzuv"><?=$mess['COMMENTS']?></p>
    <div class="comment-list">
    <?php if($res->num_rows){
        while($row = $res->fetch_assoc()){ ?>
            <div class="comment-item">
              <div class="text"><?=nl2br(hsc($row['text']));?></div>
              <div class="name-date">
                 <span><?=hsc($row['name']);?></span>
                 <span><?=hsc($row['date']);?></span>
              </div>
            </div>
    <?php }
    } else { ?>
      <div class="comment-item">
        <p class="no-item"><?=$mess['NO_COMMENT']?></p>
      </div>
    <?php } ?>
    </div>
  </div>

  <div class="form-comment">
    <p class="otzuv"><?=$mess['WORK_COMMENTS']?></p>
    <div class="thanks"><?=$mess['THANKS'];?></div>
    <div class="hack-error"><?=$mess['HACK_ERROR']?></div>
    <form action="#" method="post" onsubmit="return myComments();">
      <table>
        <tr>
          <td>
            <p><?=$mess['PLEASE_NAME'];?><span> *</span></p>
            <input class="<?=((isset($errors['name']))? 'errors' : '')?>" type="text" name="name" value="<?=(isset($_POST['name'])? hsc($_POST['name']):"")?>">
          </td>
        </tr>
        <tr>
          <td>
            <p><?=$mess['PLEASE_EMAIL'];?><span> *</span></p>
            <input class="<?=((isset($errors['name']))? 'errors' : '')?>" type="email" name="email" value="<?=(isset($_POST['email'])? hsc($_POST['email']):"")?>">
          </td>
        </tr>
        <tr>
          <td>
            <p><?=$mess['PLEASE_TEXT'];?><span> *</span></p>
            <textarea class="<?=((isset($errors['name']))? 'errors' : '')?>" name="text"><?=(isset($_POST['text'])? hsc($_POST['text']):"")?></textarea>
          </td>
        </tr>
        <tr>
          <td>
            <input type="submit" value="<?=$mess['SUBMIT'];?>" name="submit">
          </td>
        </tr>
      </table>
    </form>
  </div>
  <div class="clear"></div>
</div>