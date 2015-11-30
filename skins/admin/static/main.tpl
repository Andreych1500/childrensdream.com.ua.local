<?php if(!isset($_SESSION['user']) || $_SESSION['user']['access'] !=  5){ ?>
<div class="contentc">
  <div class="authc">
    <div class="logoc" align="right"></div>
    <div class="authadminc">
      <p>Авторизація адміна</p>
    </div>
    <div class="clear"></div>
    <div class="formc">
      <form class="color7c" action="" method="post">
        Login:    <input class="inleftc" type="text" name="login" value="<?php echo(isset($_POST['login'])? hsc($_POST['login']) : '');?>"><br>
        Password: <input class="inleft2c" type="password" name="pass" value="<?php echo(isset($_POST['pass'])? hsc($_POST['pass']) : ''); ?>"><br>
        <input type="checkbox" name="save">Запам'ятати<br>
        <?php echo @$errors['notuser']; ?>
        <input class="bottom2c" type="submit" name="submit" value="Вхід"><br>
      </form>
    </div>
  </div>
</div>	   
<?php } else { ?>
<div class="content2">
  <div class="administration">
  	Ви адміністратор!
  </div>
</div>
<?php } ?>