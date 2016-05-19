<?php
//обробка Rewrite
if(isset($_GET['route'])){
	$temp = explode('/',$_GET['route']);

	if($temp[0] == 'admin'){
		Core::$CONT = Core::$CONT.'/admin';
		Core::$SKIN = 'admin';	
		unset($temp[0]);
	} elseif($temp[0] == 'ru') {
		Core::$LANG = 'ru/'.Core::$CONT;
		unset($temp[0]);
	}

	$i = 0;
	foreach($temp as $k => $v){
		if($i == 0){
			if(!empty($v)){
				$_GET['module'] = $v;
				Core::$SITE_DIR = $v.'/';
			}
		} elseif($i == 1){
			if(!empty($v)){
				$_GET['page'] = $v;
				Core::$SITE_DIR .= $v.'/';
			}
		} else {
			if(!empty($v)){
				$_GET['key'.($k-1)] = $v;
				Core::$SITE_DIR .= $v.'/';
			}
		}
		++$i;
	}
	unset($_GET['route']);
}

// нова версія файлів
$vF = date_timestamp_get(date_create());

// мовні змінні для сайту
if(preg_match('#^ru#ius',Core::$LANG)){
	$lang = Core::$LANGUAGE['langs']['ru'];
	$link_langs = '/ru/';
} else {
	$lang = Core::$LANGUAGE['default'];
	$link_langs = '/';
}

// алгоритм на неспівпадіння модулів у rewrite
if(!isset($_GET['module'])){
	$_GET['module'] = 'static';
} else {
	$res = q("
		SELECT *
		FROM `pages`
		WHERE `module` = '".mres($_GET['module'])."'
		LIMIT 1
	");

	if(!$res->num_rows){
		$res->close();
		header("HTTP/1.0 404 Not Found");
		echo bufferStartError404($lang,$link_langs);
		exit();
	} else {
		$res->close();
	}
}

if(!isset($_GET['page'])){
	$_GET['page'] = 'main';
} 

// якщо недопустимі символи в адресній строці то перекидуєм на 404
if(!preg_match('#^[a-z-_0-9]*$#iu',$_GET['page'])){
	header("HTTP/1.0 404 Not Found");
	echo bufferStartError404($lang,$link_langs);
	exit();
}