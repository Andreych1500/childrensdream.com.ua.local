<?php /*
<div class="content2">	
  <?php if(!in_array(@$_POST['login'],$userban)){  ?>
  <?php if(!isset($_SESSION['user'])){ echo '<span class="color9">'.@$errors['notuser'].'</span>' ?>
  <p class="text4_2">
    Авторизація
  </p>
  <form class="color7" action="" method="post">
    Login: <input class="inleft" type="text" name="login" value="<?php echo @hsc($_POST['login']); ?>"> <?php echo @$errors['login']; ?><br>
    Password: <input type="password" name="pass" value="<?php echo @hsc($_POST['pass']); ?>"> <?php echo @$errors['pass']; ?><br>
    <input type="checkbox" name="save">Запам'ятати нас<br>
    <input type="submit" name="submit" value="Авторизуватись"><br>
  </form>
  <?php } else { ?>
  	<span class="color8">Ви авторизувались</span>
  <?php } ?>
  <?php } else { ?>
  	<h1 class="color12">У вас бан</h1>
  <?php } ?>
</div>
*/