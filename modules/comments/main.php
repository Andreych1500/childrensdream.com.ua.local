<?php
// Ajax More Element
if(isset($_REQUEST['ajax'], $_REQUEST['more'])){
    if(isset($_POST['nextLine'], $_POST['siteLang']) && array_search($_POST['siteLang'], explode(',', $GM['list_length'])) !== false && $_POST['nextLine'] > 0){
        $countLine = 8;
        $lastNumber = $countLine * ((int)$_POST['nextLine'] - 1);
        $allElements = $countLine * (int)$_POST['nextLine'];

        $all = q("
            SELECT `id`
            FROM `comments`
            WHERE `active` = 1
        ");

        $comments = q("
            SELECT *
            FROM `comments`
            WHERE `active` = 1 ORDER BY `id` DESC
            LIMIT ".$lastNumber.", ".$countLine."
        ");

        $all_count = $all->num_rows;
        $count = $comments->num_rows;
        $end = 1;
        $html = '';

        if($count > 0){
            while($el = hsc($comments->fetch_assoc())){
                $html .= '<div class="comment-item" itemscope itemtype="http://schema.org/UserComments"><p class="text-coment" itemprop="commentText">'.nl2br($el['text']).'</p><p itemprop="creator">'.$el['name'].'</p><time itemprop="commentTime" datetime="'.substr($el['data_create'], 0, 10).'T'.substr($el['data_create'], 11).'">'.$el['data_create'].'</time></div>';
            }

            if($all_count <= $allElements){
                $end = 0;
            }

            echo json_encode(array('html' => $html, 'end' => $end));
            exit();
        } else {
            echo json_encode(array('error' => 'warning'));
            exit();
        }
    } else {
        echo json_encode(array('error' => 'warning'));
        exit();
    }
}

if(isset($_POST['name'], $_POST['text'], $_POST['email'], $_POST['ok'])){
    $error = array();
    $_POST = trimAll($_POST);

    $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
    $check['email'] = ((empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))? 'class="error"' : '');
    $check['text'] = (empty($_POST['text'])? 'class="error"' : '');

    if(in_array('class="error"', $check)){
        $error['stop'] = 1;
    }

    if(!count($error)){
        $_POST = mres($_POST);

        q(" INSERT INTO `comments` SET
            `name`    = '".$_POST['name']."',
            `text`    = '".$_POST['text']."',
            `email`   = '".$_POST['email']."',
            `user_ip` = '".mres($_SERVER['REMOTE_ADDR'])."',
            `active`  = 0,
            `data_create`  = NOW()
        ");

        echo json_encode(array('status' => 'ok'));
        exit();
    } else {
        echo json_encode(array('error' => 'ok'));
        exit();
    }
} else {
    if(isset($_REQUEST['ajax'], $_REQUEST['comments'])){
        echo json_encode(array('error' => 'ok'));
        exit();
    }
}

// All comments
$allElement = current(q("SELECT COUNT(*) FROM `comments` WHERE `active` = 1")->fetch_assoc());;

$comments = q("
	SELECT *
	FROM `comments`
	WHERE `active` = 1 ORDER BY `id` DESC
  LIMIT 8
");