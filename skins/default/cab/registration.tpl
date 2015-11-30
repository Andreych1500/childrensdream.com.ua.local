<div class="content2">
  <div>
    <?php if(!isset($_SESSION['regok'])) { ?>
      <span class="color6">Реєстрація:</span>
    <form action="" method="post">
      <table class="color6">
        <tr>
          <td>
            Логін:
          </td>  
          <td>  
            <input type="text" name="login" value="<?php echo(isset($_POST['login'])? hsc($_POST['login']) : ''); ?>">
          </td>
          <td>
            <?php echo @$errors['login']; ?>
          </td>
        </tr>
        <tr>  
          <td>
            Пароль:
          </td>  
          <td>  
            <input type="password" name="password" value="<?php echo(isset($_POST['password'])? hsc($_POST['password']) : '');?>">
          </td>
          <td>
            <?php echo @$errors['password']; ?>
          </td>
        </tr>
        <tr>  
          <td>
            Email:
          </td> 
          <td>
            <input type="text" name="email" value="<?php echo(isset($_POST['email'])? hsc($_POST['email']) : ''); ?>">
          </td>
           <td>
            <?php echo @$errors['email']; ?>
          </td>
        </tr>
        <tr>  
          <td>
            Вік:
          </td>  
          <td>  
            <input type="text" name="age" value="<?php echo(isset($_POST['age'])? hsc($_POST['age']) : ''); ?>">
          </td>
          <td>
            <?php echo @$errors['age']; ?>
          </td>
        </tr>
      </table>
      <input type="submit" name="sender" value="Зареєструватись:">
    </form>
    <?php } else { unset($_SESSION['regok']); ?>
      <div><span class="color8">Ви успішно зареєструвались, для активації підтвердіть Email!</span></div>
    <?php  }  ?>
  </div>
</div>