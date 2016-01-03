<?php 
Core::$META['title'] = 'Childrensdream.com.ua';
Core::$JS[] = '<script type="text/javascript" src="/skins/default/js/slider.js"></script>';
Core::$JS[] = '<script type="text/javascript" src="/skins/default/js/call.js"></script>';


$catalog = ((isset($lang))? '`catalog_ru`' : '`catalog_ua`' );

// catalog
$catalog = q("
    SELECT `id`,`name`,`seo_name`,`price`,`availability`,`anons_photo`
    FROM $catalog
    WHERE `active` = 1 ORDER BY `id` DESC
");

// call me
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
                `us_ip` = '" . mres($_SERVER['REMOTE_ADDR']) . "',
                `date`  = NOW()
            ");


            Mail::$to = $_POST['email'];
            Mail::$subject = $_POST['thems'];
            Mail::$text = "
            <html>
              <head>
                <title>Замовлення зворотнього звінка</title>
              </head>
              <body>
                <div>
                  <img src=\"/skins/default/img/footer-logo.png\" alt=\"childrens-dream\" title=\"childrens-dream\">
                  <a style=\"\" href=\"#\">Перейти на сайт</a>
                </div>
                <hr>
                <div>
                  Тема: ".mres($_POST['thems'])."  <br>
                  Відправник: ".mres($_POST['email'])." <br>
                  П.І.П: ".mres($_POST['name'])." <br>
                  Текст: ".mres($_POST['text'])."
                </div>
                <hr>
                <div>
                  Дякуємо за співпрацю! <br>
                  Лист згенеровано автоматично.
                </div>
              </body>
            </html>";
            Mail::Send();

            $_SESSION['info'] = "Y";
            header("Location: /#call");
            exit();
        }
    }
}
// end call me

if(isset($_SESSION['info'])){
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}