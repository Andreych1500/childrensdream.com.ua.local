<?php 
Core::$META['title'] = 'Childrensdream.com.ua';
Core::$JS[] = '<script type="text/javascript" src="/skins/default/js/slider.js"></script>';
Core::$JS[] = '<script type="text/javascript" src="/skins/default/js/call.js"></script>';

// call me
if(isset($_POST['ok'], $_POST['name'], $_POST['text'], $_POST['email'], $_POST['thems'])){
    $errors = array();

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
            header("Location: /");
            exit();
            //echo json_encode(array('status' => 'ok'));
            //exit();
        }
    } /*else {
        echo json_encode(array('warning' => 'ok'));
        exit();
    }*/
}
// end call me