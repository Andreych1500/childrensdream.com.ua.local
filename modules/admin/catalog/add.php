<?php
// Добавлення товару
if(isset($_POST['ok'],$_POST['name'],$_POST['name_ru'],$_POST['seo_name'],$_POST['price'],$_POST['text'],$_POST['text_ru'],$_POST['description'],$_POST['description_ru'])){
	$_POST = trimAll($_POST);
	$errors = array();

	$isset = q("
		SELECT `id`
		FROM `catalog`
		WHERE `seo_name` = '".mres($_POST['seo_name'])."'
		LIMIT 1
	");

	if($isset->num_rows > 0){
		$errors['limit'] = 'isset-rrror';
	}
	
	if(empty($_POST['name'])){
		$errors['name'] = 'errors';
	}
	if(empty($_POST['name_ru'])){
		$errors['name_ru'] = 'errors';
	}
	if(empty($_POST['seo_name'])){
		$errors['seo_name'] = 'errors';
	}
	if(isset($_POST['availability'])){
		$_POST['availability'] = 1;
	}
	if(empty($_POST['price']) || !(int)$_POST['price']){
		$errors['price'] = 'errors';
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'errors';
	}
	if(empty($_POST['text_ru'])){
		$errors['text_ru'] = 'errors';
	}
	if(empty($_POST['description'])) {
		$errors['description'] = 'errors';
	}
	if(empty($_POST['description_ru'])) {
		$errors['description_ru'] = 'errors';
	}



	//необовязкові поля
	if(empty($_POST['sort'])){ $_POST['sort'] = '100'; }
	if(empty($_POST['form'])){ $_POST['form'] = ''; }
	if(empty($_POST['type'])){ $_POST['type'] = '';	}
	if(empty($_POST['form_ru'])){ $_POST['form_ru'] = ''; }
	if(empty($_POST['type_ru'])){ $_POST['type_ru'] = '';	}
	if(empty($_POST['size'])){ $_POST['size'] = '';	}
	if(empty($_POST['weight']) || !(int)$_POST['weight']){ $_POST['weight'] = ''; }
	if(empty($_POST['height']) || !(int)$_POST['height']){ $_POST['height'] = ''; }
	if(empty($_POST['rigidity'])){ $_POST['rigidity'] = '';	}
	if(empty($_POST['rigidity_ru'])){ $_POST['rigidity_ru'] = '';	}
	if(empty($_POST['garanty']) || !(int)$_POST['height']){ $_POST['garanty'] = '';	}
	if(empty($_POST['anatoming']) || !(int)$_POST['anatoming']){ $_POST['anatoming'] = 0; }
	if(empty($_POST['ortopeding']) || !(int)$_POST['ortopeding']){ $_POST['ortopeding'] = 0; }

    // seo tags
	if(empty($_POST['meta_title'])){ $_POST['meta_title'] = ''; }
	if(empty($_POST['meta_keywords'])){ $_POST['meta_keywords'] = ''; }
	if(empty($_POST['meta_description'])){ $_POST['meta_description'] = ''; }
	// end seo tags


	//anons photo
	$anons_photo = ((isset($_POST['anons_photo']))? explode('|',$_POST['anons_photo']) : '');
	//end anons photo

	//description_photo
	$descrip_photo = ((isset($_POST['descrip_photo']))? explode('|',$_POST['descrip_photo']) : '');
	//end description_photo

	//more_photos
	if(isset($_POST['more_photos']) && count($_POST['more_photos']) >= 1){
		foreach($_POST['more_photos'] as $key => $value){
			$more_src[$key] = explode('|', $value);
		}
		foreach($_POST['more_photos'] as $key => $to_more){
			if(empty($to_more)){ continue; }
			$ar_more[$key] = $to_more;
 		}
		if(isset($ar_more)) {
			$add_more_file = implode('#', $ar_more);
		} else {
			$add_more_file = '';
		}
	}
	//end more_photos


	if(!count($errors)){
		q(" INSERT INTO `catalog` SET
 			`sort`             = '".(int)$_POST['sort']."',
		    `name`             = '".mres($_POST['name'])."',
		    `name_ru`          = '".mres($_POST['name_ru'])."',
		    `seo_name`         = '".mres($_POST['seo_name'])."',
		    `meta_title`       = '".mres($_POST['meta_title'])."',
		    `meta_keywords`    = '".mres($_POST['meta_keywords'])."',
		    `meta_description` = '".mres($_POST['meta_description'])."',
		    `price`            = '".(int)$_POST['price']."',
		    `form`             = '".mres($_POST['form'])."',
		    `form_ru`          = '".mres($_POST['form_ru'])."',
			`type`             = '".mres($_POST['type'])."',
			`type_ru`          = '".mres($_POST['type_ru'])."',
			`size`             = '".mres($_POST['size'])."',
			`weight`           = '".(int)$_POST['weight']."',
			`height`           = '".(int)$_POST['height']."',
			`rigidity`		   = '".mres($_POST['rigidity'])."',
			`rigidity_ru`	   = '".mres($_POST['rigidity_ru'])."',
			`anatoming`        = '".(int)$_POST['anatoming']."',
			`ortopeding`       = '".(int)$_POST['ortopeding']."',
			`description`      = '".mres($_POST['description'])."',
			`text`             = '".mres($_POST['text'])."',
			`description_ru`   = '".mres($_POST['description_ru'])."',
			`text_ru`          = '".mres($_POST['text_ru'])."',
			`anons_photo`      = '".mres($anons_photo[0])."',
			`descrip_photo`    = '".mres($descrip_photo[0])."',
			`more_photos`      = '".mres($add_more_file)."',

			`garanty`          = '".(int)$_POST['garanty']."',
		    `availability`     = '".(int)$_POST['availability']."',
			`date`             = NOW()
		");
		
		$_SESSION['info']= 'Товар успішно доданий!';
		header("Location: /admin/catalog/");
		exit();
	}
}