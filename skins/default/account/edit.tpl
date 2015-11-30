<div class="content2">
  <?php if(isset($info)){ ?>
    <h1 class="h111"><?php echo $info; ?></h1>
  <?php } ?>
  <div class="borderaccount">
   <div class="frame">
     <span class="log">
       <?php echo hsc($row['login']); ?>
     </span>
     <form action="" method="post" enctype="multipart/form-data">
       <table>
         <tr>
           <td>
             Старий пароль:
           </td>
           <td>
             <input type="password" name="password1"><?php echo '<span class="size6">'.@$errors2['password1'].'</span>';?>
           </td>
         </tr>
         <tr>
           <td>
             Новий  пароль:
           </td>
           <td>
             <input type="password" name="password2"><?php echo '<span class="size6">'.@$errors2['password2'].'</span>';?>
           </td>
         </tr>
         <tr>
           <td>
             Підтвердіть новий пароль:
           </td>
           <td>
             <input type="password" name="password3"><?php echo '<span class="size6">'.@$errors2['password3'].'</span>';?>
           </td>
         </tr>
         <tr>
           <td>
            Новий Email:
           </td>
           <td>
             <input type="text" name="email" value="<?php if(isset($errors)){echo hsc($_POST['email']) ;}?>"><?php echo '<span class="size6">'.@$errors['email'].'</span>';?>
           </td>
         </tr>
         <tr>
           <td>
             Аватар:
           </td>
           <td>
      	   <input type="file" name="file"><?php echo '<span class="size6">'.@$errors3['file'].'<span>'; ?>
           </td>
         </tr>
       </table>
       <input class="submit5" type="submit" name="submit" value="Змінити">
     </form>
   </div>
  </div>
</div>