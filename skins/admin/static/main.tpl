<?php if(!isset($_SESSION['user']) || $_SESSION['user']['access'] !=  5){ ?>
<div class="auth-block">
  <table>
    <tr>
      <td>
        <form action="" method="post">
          <div class="auth-form style-open-form no-active">
            <div class="content-auth">
              <p>Авторизація Адміна</p>
              <p class="input-name">Логін</p>
              <input class="<?=(isset($errors['notuser'])? $errors['notuser'] : "")?>" type="text" name="login" value="<?=(isset($_POST['login'])? hsc($_POST['login']) : '');?>">
              <p class="input-name">Пароль</p>
              <input class="<?=(isset($errors['notuser'])? $errors['notuser'] : "")?>" type="password" name="pass" value="<?=(isset($_POST['pass'])? hsc($_POST['pass']) : ''); ?>">
              <input type="checkbox" name="save">
              <span class="save-me">Запам&rsquo;ятати мене на цьому комп&rsquo;ютері</span>
              <input type="submit" name="submit" value="Вхід">
            </div>
          </div>
        </form>
      </td>
    </tr>
  </table>
</div>
<?php } else { ?>
<div class="main-content">
  <div class="bx-system">
    <div><p>Адміністративна панель</p></div>
    <div>
      <p>
        Інтерфейс адміністративної панелі логічно розмежований на області, що забезпечують доступ до функціональних можливостей системи.
        Інтерфейс системи побудовано за ієрархічним принципом &quot;MVC&quot;.
        Така організація інтерфейсу забезпечує його швидкодію і неперевантаженість.
      </p>
    </div>
  </div>
  <div class="bx-system">
    <div><p>Про систему</p></div>
    <div>
      <p>Проект працює на основі власної розробки &quot;MVC&quot; Савіцького Андрія.</p>
      <table>
        <tr>
          <td>Адреса сайта:</td>
          <td><a href="/"><?=$_SERVER['HTTP_HOST']?></a></td>
        </tr>
        <tr>
          <td>Сайт зроблений:</td>
          <td>10 січня 2015 р.</td>
        </tr>
        <tr>
          <td>Відповідальне лице:</td>
          <td>Савіцький Андрій</td>
        </tr>
        <tr>
          <td>Телефон:</td>
          <td>+38 (097) 996 73 12</td>
        </tr>
        <tr>
          <td>E-mail:</td>
          <td><a href="mailto:Savitskuy@ukr.net">Savitskuy@ukr.net</a></td>
        </tr>
      </table>
      <span><img src="/skins/admin/img/my-project.png" alt="my-procect" title="Розробка Савіцького Андрія"></span>
    </div>
  </div>
</div>
<?php } ?>