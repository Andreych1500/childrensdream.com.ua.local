<?php if(!isset($_SESSION['user']) || $_SESSION['user']['access'] !=  5){ ?>
<div class="content">
  <div class="auth">
    <p>Авторизацiя адмiна</p>
    <form action="" method="post">
      <div>
        <span>Login:</span>
        <input class="<?=((isset($errors['notuser']))? 'error' : '');?>"  type="text" name="login" value="<?=((isset($_POST['login']))? hsc($_POST['login']) : '');?>">
      </div>
      <div>
        <span>Password:</span>
        <input class="<?=((isset($errors['notuser']))? 'error' : '');?>"  type="password" name="pass" value="<?=((isset($_POST['pass']))? hsc($_POST['pass']) : '');?>">
      </div>
      <div>
        <input type="checkbox" name="save"><span>Запам'ятати</span>
        <input type="submit" name="submit" value="Вхід">
      </div>
    </form>
  </div>
</div>
<?php } else { ?>
<div class="content">
  <div class="administration">
  	Ви адміністратор!<br>
    Для редагування товарів або виправлення певних елементів, виберіть пункт який вам необхідно.
   </div>
</div>
<?php } ?>