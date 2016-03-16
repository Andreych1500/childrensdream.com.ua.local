<div class="add-content">
  <span class="add-element">Редагування відгуку</span>
  <a href="/admin/comments/" class="back-menu">Інші відгуки</a>
  <div class="bottom-line-edit"></div>
  <div class="add-block-form">
    <form action="" method="post">
      <!-- tabs -->
      <input type="radio" name="tabs" id="tabs1" checked>
      <label for="tabs1">Відгук</label>

      <!-- element tabs -->
      <div class="bTabs">

        <div class="table-style">
          <div class="headers-line">Текст та данні</div>
          <div class="input-value">
            <p>І'мя<span>*</span></p>
            <input class="<?=((isset($errors['name']))? $errors['name'] : '')?>" type="text" name="name" value="<?=(isset($errors)? hsc($_POST['name']) : hsc($row['name']) )?>">
          </div>
          <div class="input-value">
            <p>Email<span>*</span></p>
            <input class="<?=((isset($errors['email']))? $errors['email'] : '')?>" type="email" name="email" value="<?=(isset($errors)? hsc($_POST['email']) : hsc($row['email']) )?>">
          </div>
          <div class="input-value">
            <p>Текст<span>*</span></p>
            <textarea class="<?=((isset($errors['text']))? $errors['text'] : '')?>" name="text"><?=((isset($errors))? $_POST['text'] : hsc($row['text']))?></textarea>
          </div>
        </div>

      </div>
      <!-- end element tabs -->

      <input type="submit" value="Зберегти" name="ok">
    </form>
  </div>
</div>