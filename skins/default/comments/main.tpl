<div class="comments">
  <div class="view-comments">
    <meta itemprop="name" content="<?=$mess['COMMENTS']?>">
    <h3 itemscope itemtype="http://schema.org/CreativeWork">
      <?=$mess['COMMENTS']?> (<span itemprop="commentCount"><?=$allElement?></span>)
      <meta itemprop="description" content="<?=$mess['YOUR_REVIEW']?>">
    </h3>
    <p><?=$mess['YOUR_REVIEW']?></p>
    <?php if($comments->num_rows){
      while($arResult = $comments->fetch_assoc()){ ?>
        <div class="comment-item" itemscope itemtype="http://schema.org/UserComments">
          <p class="text-coment" itemprop="commentText"><?=nl2br(hsc($arResult['text']))?></p>
          <p itemprop="creator"><?=hsc($arResult['name'])?></p>
          <time itemprop="commentTime" datetime="<?=substr(hsc($arResult['data_create']), 0, 10)?>T<?=substr(hsc($arResult['data_create']), 11)?>"><?=hsc($arResult['data_create'])?></time>
        </div>
      <?php } ?>
      <div class="block-title">
        <span class="line"></span>
        <p data-param="2|<?=$lang?>" onclick="moreComments(this)"><?=$mess['MORE']?>
          <span class="icon-bottom"></span>
        </p>
        <span class="line"></span>
      </div>
    <?php } else { ?>
      <p class="no-comments"><?=$mess['NO_COMMENT']?></p>
    <?php } ?>
  </div>

  <div class="form-comment">
    <h3><?=$mess['WORK_COMMENTS']?></h3>
    <div class="thanks"><?=$mess['THANKS']?></div>
    <div class="hack-error"><?=$mess['HACK_ERROR']?></div>
    <form action="#" name="form-comment" method="post" onsubmit="return checkForm('form-comment');">
      <p><?=$mess['PLEASE_NAME']?><span> *</span></p>
      <input <?=((isset($check['name']))? $check['name'] : '')?> type="text" name="name" value="<?=(isset($_POST['name'])? hsc($_POST['name']) : "")?>">
      <p><?=$mess['PLEASE_EMAIL']?><span> *</span></p>
      <input <?=((isset($check['email']))? $check['email'] : '')?> type="email" name="email" value="<?=(isset($_POST['email'])? hsc($_POST['email']) : "")?>">
      <p><?=$mess['PLEASE_TEXT']?><span> *</span></p>
      <textarea <?=((isset($check['text']))? $check['text'] : '')?> name="text"><?=(isset($_POST['text'])? hsc($_POST['text']) : "")?></textarea>
      <input type="submit" value="<?=$mess['SUBMIT']?>" name="ok">
    </form>
  </div>
</div>