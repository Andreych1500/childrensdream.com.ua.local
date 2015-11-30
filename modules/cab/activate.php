<?php
Core::$META['title'] = 'activation';

// активація на сайті
if(isset($_GET['key1'],$_GET['hash'])){
	q("
		UPDATE `users` SET
		`active` = 1,
		`access` = 1
		WHERE `id` = ".(int)$_GET['key1']."
		AND `hash` = '".mres($_GET['hash'])."'
 	");
	$info = 'Вітаю ви активовані!';
} else {
	$info = 'Ви пройшли по неправельній силці!';
}