<div class="commentview add-shop">
  <div class="comment-list">
    <form method="post" action="" enctype="multipart/form-data">
      <div class="edit-style catalog-style">
        <div class="input-value">
          <p>Назва товару<span>*</span></p>
          <input type="text" class="<?=((isset($errors['name']))? "errors" : "")?>"  name="name" value="<?=((isset($errors))? hsc($_POST['name']) : "")?>">
        </div>
        <div class="input-value">
          <p>Символьний код<span>*</span></p>
          <input type="text" class="<?=((isset($errors['seo_name']))? "errors" : "")?>"  name="seo_name" value="<?=((isset($errors))? hsc($_POST['seo_name']) : "")?>">
        </div>
        <div class="input-value">
          <p>Наявність</p>
          <input type="checkbox" <?=((isset($errors,$_POST['availability']))? "checked=\"checked\"" : "")?> name="availability" value="yes">
        </div>
        <div class="input-value">
          <p>Ціна товару (грн.)<span>*</span></p>
          <input type="text" class="<?=((isset($errors['price']))? "errors" : "")?>"  name="price" value="<?=((isset($errors))? hsc($_POST['price']) : "")?>">
        </div>
        <div class="input-value">
          <p>Форма матрацу</p>
          <input type="text"  name="form" value="<?=((isset($errors))? hsc($_POST['form']) : "")?>">
        </div>
        <div class="input-value">
          <p>Тип матрацу</p>
          <input type="text" name="type" value="<?=((isset($errors))? hsc($_POST['type']) : "")?>">
        </div>
        <div class="input-value">
          <p>Розмір (тип "N x N")</p>
          <input type="text"  name="size" value="<?=((isset($errors))? hsc($_POST['size']) : "")?>">
        </div>
        <div class="input-value">
          <p>Вага (кг.)</p>
          <input type="number" step="1" min="0"  name="weight" value="<?=((isset($errors))? hsc($_POST['weight']) : "")?>">
        </div>
        <div class="input-value">
          <p>Висота (см.)</p>
          <input type="number" step="1" min="0" name="height" value="<?=((isset($errors))? hsc($_POST['height']) : "")?>">
        </div>
        <div class="input-value">
          <p>Жорсткість</p>
          <input type="text" name="rigidity" value="<?=((isset($errors))? hsc($_POST['rigidity']) : "")?>">
        </div>
        <div class="input-value">
          <p>Анатомічні властивості</p>
          <select name="anatoming">
            <?php foreach(Core::$LOGIC as $k=>$v){ ?>
              <option value="<?=$k;?>" <?=((isset($errors) && $_POST['anatoming'] == $k)? 'selected="selected"' : "")?>>
                <?=$v;?>
              </option>
            <?php } ?>
          </select>
        </div>
        <div class="input-value">
          <p>Ортопедичні властивості</p>
          <select name="ortopeding">
            <?php foreach(Core::$LOGIC as $k=>$v){ ?>
              <option value="<?=$k;?>" <?=((isset($errors) && $_POST['ortopeding'] == $k)? 'selected="selected"' : "")?>>
                <?=$v; ?>
              </option>
            <?php } ?>
          </select>
        </div>
        <div class="input-value">
          <p>Гарантійний термін</p>
          <input type="number" step="1" min="0" name="garanty" value="<?=((isset($errors))? hsc($_POST['garanty']) : "")?>">
        </div>
        <div class="input-value">
          <p>Короткий опис матрацу<span>*</span></p>
          <textarea class="<?=((isset($errors['description']))? "errors" : "")?>" name="description"><?=((isset($errors))? hsc($_POST['description']) : "")?></textarea>
        </div>
        <div class="input-value">
          <p>Текст матрацу<span>*</span></p>
          <textarea class="<?=((isset($errors['text']))? "errors" : "")?>" name="text"><?=((isset($errors))? hsc($_POST['text']) : "")?></textarea>
        </div>
        <div class="input-value">
          <p>Фото анонсу</p>
          <input type="file" name="anons_photo">
        </div>

      </div>
      <input type="submit" value="Додати товар" name="ok">
    </form>
  </div>
</div>

<?/*
<span class="style7">Ім'я товару *:</span><br>
<textarea name="name"><?php if(isset($errors)){ echo hsc($_POST['name']);} ?></textarea>
<?php echo '<span class="color7">'.@$errors['name'].'<span>'; ?>

<span class="style7">Код товару *:</span><br>
<input type="text" name="cod" value="<?php if(isset($errors)){ echo hsc($_POST['cod']);} ?>">
<?php echo '<span class="color7">'.@$errors['cod'].'<span>'; ?>

<span class="style7">Зображення *:</span><br>
<input type="file" name="file">
<?php echo '<span class="color7">'.@$errors['file'].'<span>'; ?>

<select name="cat">
  <?php foreach(Core::$LOGIC as $k=>$v){ ?>
    <option value="<?php echo $v;?>" <?php if(isset($errors) && $_POST['cat'] == $v){ echo 'selected="selected"';} ?>>
      <?php echo $v; ?>
    </option>
  <?php } ?>
</select>
<?php echo '<span class="color7">'.@$errors['cat'].'<span>';?>
*/?>