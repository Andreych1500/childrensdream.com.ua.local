<?php
Core::$META['title'] = $mess['Error_404'];
Core::$META['keywords'] = $mess['Error_404'];
Core::$META['description'] = $mess['Error_404'];

// нова версія файлів
$arrVersion = q('SELECT `new_resource` FROM `main_core` WHERE `id` = 1')->fetch_assoc();
$vF = $arrVersion['new_resource'];

if($_SERVER['REDIRECT_STATUS'] == 403){
    header('HTTP/1.0 403 Forbidden');
    $status_error = 403;
} else {
	$_SERVER['REDIRECT_STATUS'] = 404;
	$_SERVER['REDIRECT_REDIRECT_STATUS'] = 404;
    $status_error = 404;
}