<div class="content2">
  <div class="borderaccount">
    <div class="frame">
      <div class="avatar">
         <?php if(!isset($row['ava'])){ echo '<span class="ava">аватар</span>'; } else { echo '<img src="'.hsc($row['ava']).'">'; } ?>
      </div>
      <p class="log">
        <?php echo hsc($row['login']); ?>
      </p>
      <div class="clear"></div>
      <div class="infa">
        <table>
          <tr>
            <td class="allf">Email:</td>
		    <td class="allr"><?php echo hsc($row['email']); ?></td>
          </tr>
          <tr>
            <td class="allf">Вік:</td>
            <td class="allr"><?php echo hsc($row['age']); ?></td>
          </td>
          <tr>
            <td class="allf">Клас:</td> 
		    <td class="allr"><?php if((int)$row['access'] == 1){ echo 'Користувач'; } else { echo 'Admin'; } ?></td>
          </tr>
          <tr>
            <td class="allf">Зареєстрований:</td>
            <td class="allr"><?php echo hsc($row['date']); ?></td>
          </tr>
          <tr>
            <td class="allf">Останній раз був на сайті:</td> 
			<td class="allr"><?php echo hsc($row['lastonline']); ?></td>
          </tr>
        </table>
      </div>
      <a href="/account/edit" class="newsadd">Редагувати</a>
    </div>
  </div>
</div>