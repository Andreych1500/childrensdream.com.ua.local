<div class="content2">
  <?php if(isset($info)){ ?>
    <h1 class="h111"><?php echo $info; ?></h1>
  <?php } ?>
  <div class="contentproducts2">
  	<div class="poshuk2">
      <span class="formposhuk2">Пошук користувача: </span>
      <form class="input9" action="" method="post">
        <input type="text" name="login2">
        <input type="submit" name="ok2" value="найти">
      </form>
      <?php echo '<span class="size4">'.@$errors2['login2'].'</span>';?>
      <?php if(isset($info2)){ echo $info2; } ?>
      <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <?php if(isset($_POST['login2'],$_POST['ok2']) && !empty($_POST['login2'])){ ?>
    <table class="users4">
      <tr>
      	<td class="styletab2">
          Логін:
        </td>
        <td class="styletab2">
          Email:
        </td>
        <td class="styletab2">
          Доступ(access):
        </td>
      </tr>
	  <?php while($row = $res3->fetch_assoc()){?>
      	<tr>
          <td class="styletab3">
             <a class="descr1" href="/admin/user/main/<?php echo (int)($row['id']); ?>"><?php echo hsc($row['login']); ?></a>
          </td>
          <td class="styletab3">
             <?php echo hsc($row['email']); ?>
          </td>
          <td class="styletab3">
             <?php if($row['access'] == 1){ echo 'Відкритий';}elseif($row['access'] == 2){echo 'Бан';}else{echo 'admin';} ?>
          </td>
        </tr>
      <?php } ?>
    </table>
    <?php } ?>
    <div class="leftuser">
      <span class="user">
        Користувачі:
      </span>
      <div class="listuser">
        <ul>
        <?php  while($row = $users->fetch_assoc()){
		           if($resul != $row['access']){
    	               $resul = $row['access'];
				       if($row['access'] == 5){
				           echo '<img class="img11" src="/skins/admin/img/papka.jpg">Admin</img>';
				       } elseif($row['access'] == 2){
					       echo '<img class="img11" src="/skins/admin/img/papka.jpg">Бан</img>';
				       } elseif($row['access'] == 1){
					       echo '<img class="img11" src="/skins/admin/img/papka.jpg">Відкритий</img>';
				       }
	               }
	               echo '<li><a class="descr1" href="/admin/user/main/'.(int)$row['id'].'">'.hsc($row['login']).'</a></li>';
               } ?>
        </ul>
      </div>
    </div> 
    <?php if(!isset($_GET['key2'])){?>
    <div class="rightupdate">
      <span class="panel">
        Панель управління користувачами
      </span>  
      <span class="prava">
        Права користувачів:
      </span>
      <ul>
        <li>1 - Читання + редагування тільки своїх записів.</li>
        <li>2 - Немає прав(Бан). Користувач не бачить розділ і не має до нього доступа.</li>
        <li>5 - Аdmin</li>
      </ul> 
      <div class="prumitka">
      	Примітка*: для того, щобнові права вступили в силу, необхідно перезайти на сайт(вийти і знов зайти).
      </div>  
    </div>
    <?php } else { $row = $user2->fetch_assoc(); ?>
    <div class="rightupdate">
      <form action="" class="borrad7" method="post">
      	<span class="form5">Логін:</span><input class="up1"  type="text" name="login" value="<?php if(isset($errors)){echo hsc($_POST['login']) ;}else{ echo hsc($row['login']); }?>"><?php echo '<span class="size4">'.@$errors['login'].'</span>';?>
        <hr class="hr2">
        <span class="form5">Пароль:</span><input type="text" name="pass">
        <hr class="hr2">
        <span class="form5">Email:</span><input class="up2" type="text" name="email" value="<?php if(isset($errors)){echo hsc($_POST['email']) ;}else{ echo hsc($row['email']); }?>"><?php echo '<span class="size4">'.@$errors['email'].'</span>';?>
        <hr class="hr2">
        <div>
        <span class="form5">Доступ:</span>
        <label><input type="radio" name="access" value="1" class="up3"<?php if(($row['access'] == '1') && !isset($errors)){ echo 'checked="checked"';}elseif(isset($errors) && ($_POST['access'] == '1')){ echo 'checked="checked"';} ?>>Відкритий</label>
        <label><input type="radio" name="access" value="2"<?php if(($row['access'] == '2') && !isset($errors)){ echo 'checked="checked"';}elseif(isset($errors) && ($_POST['access'] == '2')){ echo 'checked="checked"';} ?>>Бан</label>
        <label><input type="radio" name="access" value="5" <?php if(($row['access'] == '5') && !isset($errors)){ echo 'checked="checked"';}elseif(isset($errors) && ($_POST['access'] == '5')){ echo 'checked="checked"';} ?>>Адмін</label>
        </div>
        <hr class="hr2">
        <!-- Додаткові дані -->
        <span class="form5 col9">Додаткова інформація:</span><br>
        <hr class="hr2">
        <span class="form5 upp1">Вік:</span><?php echo hsc($row['age']); ?><br>
        <span class="form5 upp2">Дата створення:</span><?php echo hsc($row['date']); ?><br>
        <span class="form5 upp4">Остання активність:</span><?php echo hsc($row['lastonline']); ?><br>
        <span class="form5 upp3">Ip:</span><?php echo hsc($row['ip']); ?><br>
        <hr class="hr2">
        <div class="submit9">
        <input type="submit" class="submit5 upp5" name="ok" value="Редагувати">
        <input type="submit" class="submitdelete" name="delete" value="Видалити">
        </div>
      </form>
    </div>
    <?php } ?>
    <div class="clear"></div> 
  </div>
</div>
