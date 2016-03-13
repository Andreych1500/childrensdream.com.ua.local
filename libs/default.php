<?php
//поміщає у переміну назву файла класа
function __autoload($class){
	include './libs/class_'.$class.'.php';
}

// роз ширена функція для print_r
function wtf($array, $stop = false){
	echo '<pre>'.print_r($array,1).'</pre>';
	if (!$stop){
		exit();
	}
}

// розширена функція mysqli_query
function q($query,$key = 0){
	$res = DB::_($key)->query($query);
	if($res === false){
		$info = debug_backtrace();
		$error = "QUERY:".$query."<br>\n".DB::_($key)->error."<br>\n".
				 "file: ".$info[0]['file']."<br>\n".
				 "line: ".$info[0]['line']."<br>\n".
				 "date: ".date("Y-m-d H:i:s")."<br>\n".
				 "===================================";
				 
		file_put_contents('./logs/mysql.log',strip_tags($error)."\n\n",FILE_APPEND);
		echo $error;
		exit();		 
	}
	return $res;
}

// функція для автоматичного змінення дати
function data($data){
	if(Core::$CREATED == date('Y')){
		return Core::$CREATED;
	} else {
		return Core::$CREATED.'-'.date('Y');
	}
}

// для многомірних масивів будем забирати пробіли (розширена функція trim для масивів)
function trimAll($el){
	if(!is_array($el)){
		$el = trim($el);
	} else {
		$el = array_map('trimAll',$el);
	}
	return $el;
} 

// розширена функція htmlspecialchars для масивів
function hsc($el){
	if(!is_array($el)){
		$el = htmlspecialchars($el);
	} else {
		$el = array_map('hsc',$el);
	}
	return $el;
}

// розширена функція mysqli_real_escape_string для обробки тексту на відправку у БД
function mres($el,$key = 0){
	return DB::_($key)->real_escape_string($el);
}

// функція (int) для многомірних масивів 
function ints($el){
	if(!is_array($el)){
		$el = (int)$el;
	} else {
		$el = array_map('ints',$el);
	}
	return $el;
}

// функція (float) для многомірних масивів 
function floatAll($el) {
	if(!is_array($el)) {
		$el = (float)($el);
	} else {
		$el = array_map('floatAll',$el);
	}
	return $el;	
}

// функція шерирує данні
function myHash($var){
	$salt = 'gyrr5ytff';
	$salt2 = 'kjh785t6f';
	$var = crypt(md5($var.$salt),$salt2);
	return $var;
}

// видалення папки
function removeDirectory($dir) {
	if ($objs = glob($dir."/*")) {
		foreach($objs as $obj) {
			is_dir($obj) ? removeDirectory($obj) : unlink($obj);
		}
	}
	rmdir($dir);
}