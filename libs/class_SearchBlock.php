<?php

class SearchBlock{

	static function search($name,$message){
		
		$name = preg_quote($name);
		
		$name = "#$name#ui";
		
		$text = preg_match($name, $message);
		
		return $text;
	}
}
