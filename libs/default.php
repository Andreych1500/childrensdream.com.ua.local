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
	if(!is_array($el)){
		$el = DB::_($key)->real_escape_string($el);
	} else {
		$el = array_map('mres',$el);
	}

	return $el;
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

// перевірка на мобільний пристрій
function isMobile(){
	$useragent = $_SERVER['HTTP_USER_AGENT'];

	if(preg_match('/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i',$useragent, $matches) ||
	   preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i',substr($useragent,0,4),$matches2)
	) {
		return true;
	} else {
		return false;
	}
}

function bufferStartError404($lang,$link_langs){
ob_start();
		include './'.Core::$CONT.'/lang/'.$lang.'/lang.php';
		include './'.Core::$CONT.'/error/main.php';
		include './skins/'.Core::$SKIN.'/error/main.tpl';

		header("HTTP/1.0 404 Not Found");

		$content = ob_get_contents();
	ob_end_clean();

	return $content;
}