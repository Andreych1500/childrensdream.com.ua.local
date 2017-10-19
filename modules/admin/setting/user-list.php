<?php
if (isset($_REQUEST['add'])) {
    if (isset($_POST['ok'])) {
        $error = [];
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['last_name'] = (empty($_POST['last_name'])? 'class="error"' : '');
        $check['login'] = ((empty($_POST['login']) || strlen($_POST['login']) < 6)? 'class="error"' : '');
        $check['email'] = ((empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))? 'class="error"' : '');
        $check['pass'] = ((empty($_POST['pass']) || strlen($_POST['pass']) < 6)? 'class="error"' : '');
        $check['check_pass'] = ((empty($_POST['check_pass']) || $_POST['pass'] != $_POST['check_pass'])? 'class="error"' : '');

        if (in_array('class="error"', $check)) {
            $error['stop'] = 1;
        } else {
            $res = q("
			          SELECT `id`
			          FROM  `admin_users_list`
			          WHERE `login` = '".mres($_POST['login'])."' 
			          OR `email` = '".mres($_POST['email'])."'
                LIMIT 1
            ");

            if ($res->num_rows) {
                $error['stop'] = 1;
                sessionInfo('/admin/setting/user-list/?add='.$_REQUEST['add'], $messG['Користувач з таким логіном або Email вже існує!'], 0, 0);
            }
        }

        if (!count($error)) {
            $_POST = mres($_POST);

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];
            $active_url = (!$_POST['active']? '&active=ok&' : '&');

            q("
                INSERT INTO `admin_users_list` SET
                `access`      = ".(int)$_POST['access'].",
                `active`      = ".$_POST['active'].",
                `name`        = '".$_POST['name']."',
                `last_name`   = '".$_POST['last_name']."',
                `end_name`    = '".$_POST['end_name']."',
                `login`       = '".$_POST['login']."',
                `email`       = '".$_POST['email']."',
                `pass`        = '".myHash($_POST['pass'])."',
                `hash`        = '".myHash($_POST['login'].$_POST['pass'].$_POST['email'])."',
                `user_avatar` = '".$_POST['user_avatar']."',
                `age`         = '".(int)$_POST['age']."',
                `phone`       = '".$_POST['phone']."',
                `profession`  = '".$_POST['profession']."',
                `web_site`    = '".$_POST['web_site']."',
                `floor`       = '".(int)$_POST['floor']."',
                `country`     = '".$_POST['country']."',
                `region`      = '".$_POST['region']."',
                `city`        = '".$_POST['city']."',
                `user_custom` = '".$_SESSION['user']['last_name'].' '.$_SESSION['user']['name']."',
                `data_create` = NOW()
            ");

            if (isset($_POST['male']) && (int)$_POST['access'] == 1) {
                $id = DB::_()->insert_id;

                $param = [
                    'login'    => $_POST['login'],
                    'pass'     => $_POST['pass'],
                    'email'    => $_POST['email'],
                    'link_act' => $arMainParam['url_http_site'].'/cab/activate/?id='.(int)$id.$active_url.urlencode().'hash='.urlencode(myHash($_POST['login'].$_POST['pass'].$_POST['email']))
                ];

                Mail::$text = TemplateMail::formationMail($param, 'registration_user', $_POST['mail_lenght'], $arMainParam);

                if (Mail::$text) {
                    Mail::$to = $_POST['email'];
                    Mail::send();
                }
            }

            sessionInfo('/admin/setting/user-list/', $messG['Елемент створено успішно!'], 1);
        }
    }

    $settingLang = q("
        SELECT `list_length`
        FROM `admin_type_mails`
        WHERE `symbol_code` = 'registration_user'
        LIMIT 1
    ");

    $langTestMail = $settingLang->fetch_assoc();
} elseif (isset($_REQUEST['edit'])) {

    if ($_REQUEST['edit'] == 1 && $_SESSION['user']['id'] != 1) {
        sessionInfo('/admin/setting/user-list/', $mess['У вас недостатньо прав для редагування цього користувача!']);
    }

    if (isset($_POST['ok'])) {
        $error = [];
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['last_name'] = (empty($_POST['last_name'])? 'class="error"' : '');
        $check['login'] = ((empty($_POST['login']) || strlen($_POST['login']) < 6)? 'class="error"' : '');
        $check['email'] = ((empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))? 'class="error"' : '');
        $check['new_pass'] = ((isset($_POST['new_pass']) && strlen($_POST['new_pass']) < 6 && strlen($_POST['new_pass']) > 0)? 'class="error"' : '');
        $check['check_pass'] = ((isset($_POST['check_pass']) && $_POST['new_pass'] != $_POST['check_pass'])? 'class="error"' : '');

        // Photo
        $user_avatar = ((isset($_POST['user_avatar']))? explode('|', $_POST['user_avatar']) : '');

        if (in_array('class="error"', $check)) {
            $error['stop'] = 1;
        } else {
            $res = q("
			          SELECT `id`
			          FROM  `admin_users_list`
			          WHERE `id` != ".(int)$_REQUEST['edit']."
			          AND (`login` = '".mres($_POST['login'])."' OR `email` = '".mres($_POST['email'])."')
            ");

            if ($res->num_rows) {
                $error['stop'] = 1;
                sessionInfo('/admin/setting/user-list/?edit='.$_REQUEST['edit'], $messG['Користувач з таким логіном або Email вже існує!'], 0, 0);
            }
        }

        if (!count($error)) {
            $_POST = mres($_POST);

            $new_pass = !empty($_POST['new_pass']) && isset($_POST['new_pass'])? "`pass` = '".myHash($_POST['new_pass'])."', `hash` = '".myHash($_POST['login'].$_POST['new_pass'].$_POST['email'])."'," : '';

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];

            q("
                UPDATE `admin_users_list` SET
                `access`      = ".(int)$_POST['access'].",
                `active`      = ".$_POST['active'].",
                `name`        = '".$_POST['name']."',
                `last_name`   = '".$_POST['last_name']."',
                `end_name`    = '".$_POST['end_name']."',
                `login`       = '".$_POST['login']."',
                `email`       = '".$_POST['email']."',
                 ".$new_pass."
                `user_avatar` = '".mres($user_avatar[0])."',
                `age`         = '".(int)$_POST['age']."',
                `phone`       = '".$_POST['phone']."',
                `profession`  = '".$_POST['profession']."',
                `web_site`    = '".$_POST['web_site']."',
                `floor`       = '".(int)$_POST['floor']."',
                `country`     = '".$_POST['country']."',
                `region`      = '".$_POST['region']."',
                `city`        = '".$_POST['city']."',
                `user_custom` = '".$_SESSION['user']['last_name'].' '.$_SESSION['user']['name']."',
                `data_custom` = NOW()
                 WHERE `id` = ".(int)$_REQUEST['edit']."
            ");

            sessionInfo('/admin/setting/user-list/', $messG['Редагування пройшло успішно!'], 1);
        }
    }

    $arResult = q("
        SELECT * 
        FROM `admin_users_list`
        WHERE `id` = ".(int)$_REQUEST['edit']."
    ");

    if ($arResult->num_rows == 0) {
        sessionInfo('/admin/setting/user-list/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = hsc($arResult->fetch_assoc());
    }
} else {

    if (isset($_POST['arr']) && count($_POST['arr']) > 0) { // Dynamic edit
        DynamicEditMenu::edit($_POST['arr'], 'admin_users_list', '/admin/setting/user-list/', $messG['Редагування пройшло успішно!']);
    }

    if (isset($_REQUEST['del'])) { // Delete one
        deleteElement($_REQUEST['del'], 'admin_users_list', '/admin/setting/user-list/', $messG['Видалення пройшло успішно!']);
    }

    if (isset($_POST['delete']) && isset($_POST['ids'])) { // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'admin_users_list', '/admin/setting/user-list/', $messG['Видалення пройшло успішно!']);
    }

    if (isset($_POST['deactivate']) && isset($_POST['ids'])) { // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'admin_users_list');
        sessionInfo('/admin/setting/user-list/', $messG['Деактивація пройшла успішно!'], 1);
    }

    if (isset($_POST['activate']) && isset($_POST['ids'])) { // Activate
        activeElement(implode(',', $_POST['ids']), 'admin_users_list');
        sessionInfo('/admin/setting/user-list/', $messG['Активація пройшла успішно!'], 1);
    }

    // Filter
    if (isset($_REQUEST['filterReset'])) {
        unset($_SESSION['ADM_filter']['users_list']);
        header('Location: /admin/setting/user-list/');
    }

    $_SESSION['ADM_filter']['users_list'] = (isset($_POST['filter'])? $_POST['filter'] : (isset($_SESSION['ADM_filter']['users_list'])? $_SESSION['ADM_filter']['users_list'] : ''));
    $htmlFilter = AdminFilter::htmlFormation('admin_users_list', $arMainParam['length_admin'], $_SESSION['ADM_filter']['users_list']);
    $filter = (!empty($_SESSION['ADM_filter']['users_list'])? AdminFilter::filter($_SESSION['ADM_filter']['users_list'], 'admin_users_list') : '');

    // Pagination
    $user_list = Pagination::formNav([
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/setting/user-list/",
        'db_table'    => "admin_users_list",
        'css_class'   => "pagination-admin",
        'filter'      => $filter,
        'sort'        => '',
        'seo'         => 'N',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ]);
}