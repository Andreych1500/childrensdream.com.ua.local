<?php
error_reporting (-1);
ini_set('display_errors',1);
header('Content-Type: text/html; charset=utf-8'); 
session_start();

//if($_SERVER['REMOTE_ADDR'] != '5.58.26.194'){
//	header('Location: http://childrens-dream.uaprom.net');
//}

// Конфіг сайта
include_once './config.php';
include_once './libs/default.php';
include_once './variables.php';

// FRONT-CONTROLLER
ob_start();
	if(preg_match('#^ru#ius',Core::$CONT['castom']) && Core::$LANGUAGE['status']){
		$lang = Core::$LANGUAGE['allow']['ru'];
	}

	if (!file_exists('./' . Core::$CONT['default'] . '/' . $_GET['module'] . '/' . $_GET['page'] . '.php') || !file_exists('./skins/' . Core::$SKIN . '/' . $_GET['module'] . '/' . $_GET['page'] . '.tpl') || !file_exists('./'. ((Core::$CONT['default'] == 'modules/admin')? 'modules' : Core::$CONT['default']).'/lang/'.((isset($lang))? $lang : Core::$LANGUAGE['default']).'/lang.php')) {
		header("Location: /404");
		exit();
	}

	// LANG
	include './'.((Core::$CONT['default'] == 'modules/admin')? 'modules' : Core::$CONT['default']).'/lang/'.((isset($lang))? $lang : Core::$LANGUAGE['default']).'/lang.php';

	if(isset($_GET['module']) && file_exists('./'.((Core::$CONT['default'] == 'modules/admin')? 'modules' : Core::$CONT['default']).'/'.$_GET['module'].'/lang/'.((isset($lang))? $lang : Core::$LANGUAGE['default']).'/lang.php')){
		echo './'.((Core::$CONT['default'] == 'modules/admin')? 'modules' : Core::$CONT['default']).'/'.$_GET['module'].'/lang/'.((isset($lang))? $lang : Core::$LANGUAGE['default']).'/lang.php';
	}
	// END LANG

	// PAGE_MODEL
	include './'.Core::$CONT['default'].'/allpages.php';
	include './'.Core::$CONT['default'].'/'.$_GET['module'].'/'.$_GET['page'].'.php';
	// PAGE_MODEL END

	// PAGE_VIEW
	include './skins/'.Core::$SKIN.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl';
    // PAGE_VIEW END

	$content = ob_get_contents();
ob_end_clean();

if(isset($_GET['ajax'])) {
	echo $content;
	exit;
}

include './skins/'.Core::$SKIN.'/'.'index.tpl';
// END FRONT-CONTROLLER
exit();