<?php
error_reporting (0);
ini_set('display_errors',0);
header('Content-Type: text/html; charset=utf-8'); 
session_start();

if(preg_match('#\/catalog\/|\/product\/#ui',$_SERVER['REQUEST_URI'], $matches)){
	$redirectCatalog = preg_replace('#catalog|product#ui', 'products', $_SERVER['REQUEST_URI']);
	header("HTTP/1.1 301 Moved Permanently");
	header("Location: http://" . $_SERVER['HTTP_HOST'] . $redirectCatalog);
	exit();
}

// --- CONFIG SITE ---

include_once './config.php';
include_once './libs/default.php';
include_once './variables.php';

// --- END CONFIG SITE ---


// --- FRONT-CONTROLLER ---
ob_start();

	// --- EXIST FILES ---
	if (!file_exists('./' . Core::$CONT . '/' . $_GET['module'] . '/' . (((Core::$CONT != 'modules/admin' && in_array($_GET['module'], Core::$DATAIL_PAGE)) ? 'main' : $_GET['page']) . '.php')) ||
	!file_exists('./skins/' . Core::$SKIN . '/' . $_GET['module'] . '/' . (((Core::$CONT != 'modules/admin' && in_array($_GET['module'], Core::$DATAIL_PAGE)) ? 'main' : $_GET['page']) . '.tpl')) ||
	((Core::$CONT != 'modules/admin') ? !file_exists('./' . Core::$CONT . '/' . $_GET['module'] . '/lang/' . $lang . '/lang.php') : false)) {
		header("HTTP/1.0 404 Not Found");
		echo bufferStartError404($lang,$link_langs);
		exit();
	}
	// --- END EXIST FILES ---


	// --- LANGS FILES ---
	if(Core::$CONT != 'modules/admin'){
		include './'.Core::$CONT.'/lang/'.$lang.'/lang.php';
	}

	if(isset($_GET['module'])){
		if(Core::$CONT != 'modules/admin'){
			include './'.Core::$CONT.'/'.$_GET['module'].'/lang/'.$lang.'/lang.php';
		}
	}
	// --- END LANGS FILES ---


	// --- PAGE_MODEL ---
	include './'.Core::$CONT.'/allpages.php';
	include './'.Core::$CONT.'/'.$_GET['module'].'/'.(in_array($_GET['module'],Core::$DATAIL_PAGE)? ((Core::$CONT == 'modules/admin')? $_GET['page'] : 'main' ) : $_GET['page']).'.php';
	// --- END PAGE_MODEL ---


	// --- PAGE_VIEW ---
	include './skins/'.Core::$SKIN.'/'.$_GET['module'].'/'.(in_array($_GET['module'],Core::$DATAIL_PAGE)? ((Core::$CONT == 'modules/admin')? $_GET['page'] : 'main' ) : $_GET['page']).'.tpl';
	// --- END PAGE_VIEW ---

	$content = ob_get_contents();

ob_end_clean();
// --- END FRONT-CONTROLLER ---


// --- VIEW CONTENT ---

if(isset($_GET['ajax'])) {
	echo $content;
	exit();
}

include './skins/'.Core::$SKIN.'/'.'index.tpl';

// --- END VIEW CONTENT ---
exit();