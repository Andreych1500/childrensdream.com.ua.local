<?php
Core::$JS[] = '<script src="/skins/default/js/slider.js?v=1" defer></script>';
Core::$JS[] = '<script src="/skins/default/js/chekForm.js?v=1" defer></script>';

// --- SEND CALL FORM ---

if(isset($_POST['ok'], $_POST['name'], $_POST['text'], $_POST['email'], $_POST['thems'])){
    $errors = array();
    $next_error = array();

    if(empty($_POST['name'])){
        $errors['name'] = 'errors';
    }
    if(empty($_POST['email'])){
        $errors['email'] = 'errors';
    }
    if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
        $errors['email'] = 'errors';
    }
    if(empty($_POST['text'])){
        $errors['text'] = 'errors';
    }
    if(empty($_POST['thems'])){
        $errors['thems'] = 'errors';
    }

    if($_POST['capcha'] != $_SESSION['rand_code']){
        $errors['capcha'] = 'errors';
    }


    if(!count($errors)){
        $limit_access = q("
          SELECT *
          FROM `call_me`
          WHERE `us_ip` = '".mres($_SERVER['REMOTE_ADDR'])."' AND `date` >= NOW() - INTERVAL 1 DAY
          LIMIT 4
        ");

        if($limit_access->num_rows >= 2){
            $next_error['limit'] = 'Y';
        }

        if(!count($next_error)) {
            q(" INSERT INTO `call_me` SET
                `name`  = '" . mres($_POST['name']) . "',
                `thems` = '" . mres($_POST['thems']) . "',
                `email` = '" . mres($_POST['email']) . "',
                `text`  = '" . mres($_POST['text']) . "',
                `user_ip` = '" . mres($_SERVER['REMOTE_ADDR']) . "',
                `date_create`  = NOW()
            ");

            Mail::$to = 'cdmatrasses@gmail.com';
            Mail::$subject = $_POST['thems'];
            Mail::$text = '<html>
<head>
<title>Замовлення зворотнього звінка</title>
</head>
<body>
<div>
<img src="http://childrensdream.com.ua/skins/default/img/cd-static.png" alt="childrens-dream" title="childrens-dream">
</div>
<hr>
<div>
Тема: '.mres($_POST['thems']).'  <br>
Відправник: '.mres($_POST['email']).' <br>
П.І.П: '.mres($_POST['name']).' <br>
Текст: '.mres($_POST['text']).'
</div>
<hr>
<div>
<a style="display: block;width: 130px;background-color:#48D2E0;color:#FFF;padding:5px;text-decoration:none;border-radius:4px;text-align: center;" href="http://childrensdream.com.ua">Перейти на сайт</a><br>
</div>
<div>
Дякуємо за співпрацю! <br>
Лист згенеровано автоматично.
</div>
</body>
</html>';
            Mail::Send();

            $_SESSION['info'] = "Y";
            header("Location: ".$link_langs."#call");
            exit();
        }
    }
}

// --- END SEND CALL FORM ---


// --- ALL ELEMENT ---

$catalog = q("
    SELECT `id`,`name_ua`,`seo_name`,`price`,`availability`,`cAnonsPhoto`,`name_ru`
    FROM `catalog`
    WHERE `active` = 1 ORDER BY `sort` DESC, `id` DESC
");

// --- END ALL ELEMENT ---


// --- ALL ELEMENT BANNER ---

$main_banner = q("
    SELECT *
    FROM `main_banner`
    WHERE `active` = 1 ORDER BY `sort` DESC, `id` DESC
");

// --- END ALL ELEMENT BANNER ---