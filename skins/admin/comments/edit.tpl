<div class="commentview">
  <div class="comment-list">
    <form method="post" action="">
      <div class="edit-style">
        <div class="input-value">
          <p>І'мя<span>*</span></p>
          <input type="text" required name="name" value="<?=(isset($errors)? hsc($_POST['name']) : hsc($row['name']) )?>">
          <p class="error"><?=((isset($errors['name']))? $errors['name'] : '')?></p>
        </div>
        <div class="input-value">
          <p>Email<span>*</span></p>
          <input type="email" required name="email" value="<?=(isset($errors)? hsc($_POST['email']) : hsc($row['email']) )?>">
          <p class="error"><?=((isset($errors['email']))? $errors['email'] : '')?></p>
        </div>
        <div class="input-value">
          <p>Текст<span>*</span></p>
          <textarea required name="text"><?=((isset($errors))? $_POST['text'] : hsc($row['text']))?></textarea>
          <p class="error"><?=((isset($errors['text']))? $errors['text'] : '')?></p>
        </div>
        <input type="submit" value="Редагувати" name="ok">
      </div>
    </form>
  </div>
</div>