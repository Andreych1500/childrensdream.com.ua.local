<?php 

class Mail{
	static $subject = 'Заголовок';
	static $from = '';
	static $to = '';
	static $text = 'You have registered on the site, in order to confirm this by email please:';
	static $type_list = 'text/html';
	static $headers = '';
	
	static function Send(){
		self::$headers = '=?utf-8?b?'.base64_encode(self::$subject).'?='; //кодіровка
		self::$headers = "Content-type: ".self::$type_list."; charset=\"utf-8\"\r\n";
		
		self::$headers .= "From: ".self::$from."\r\n";//з якого email було відправлено
		self::$headers .= "MIME-Version: 1.0\r\n";//тип листа
		self::$headers .= "Date: ".date('D, d M Y h:s:s O')."\r\n";//дата листа коли було відправлено
		self::$headers .= "Precedence: bulk\r\n";//лист в одну сторону...відповіді непотребує...приклад:після реєстрації*
			
		return	mail(self::$to,self::$subject,self::$text,self::$headers);
	}	
	
	static function testSend(){
		if(mail(self::$to,'English words','English words')){
			echo 'Лист відправлений';
			echo '<br>';
			echo 'кому '.Mail::$to;
			echo '<br>';
			echo 'ким '.Mail::$from;
			echo '<br>';
			echo 'тема '.Mail::$subject;
			echo '<br>';
			echo 'текст'.Mail::$text;
			echo '<br> ';
		} else {
			echo 'Лист не відправлений';
		}
		exit();
	}
}

