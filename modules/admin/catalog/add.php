<?php
// Добавлення товару
wtf($_POST,1);

if(isset($_POST['ok'],$_POST['name'],$_POST['seo_name'],$_POST['price'],$_POST['text'])){
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['name'])){
		$errors['name'] = 'errors';
	}
	if(empty($_POST['seo_name'])){
		$errors['seo_name'] = 'errors';
	}
	if(empty($_POST['price']) || !(int)$_POST['price']){
		$errors['price'] = 'errors';
	}
	if(isset($_POST['availability'])){
		$_POST['availability'] = 1;
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'errors';
	}
	if(empty($_POST['description'])) {
		$errors['description'] = 'errors';
	}


	//необовязкові поля
	if(empty($_POST['form'])){ $_POST['form'] = ''; }
	if(empty($_POST['type'])){ $_POST['type'] = '';	}
	if(empty($_POST['size'])){ $_POST['size'] = '';	}
	if(empty($_POST['weight']) || !(int)$_POST['weight']){ $_POST['weight'] = ''; }
	if(empty($_POST['height']) || !(int)$_POST['height']){ $_POST['height'] = ''; }
	if(empty($_POST['rigidity'])){ $_POST['rigidity'] = '';	}
	if(empty($_POST['garanty']) || !(int)$_POST['height']){ $_POST['garanty'] = '';	}
	if(empty($_POST['anatoming']) || !(int)$_POST['anatoming']){ $_POST['anatoming'] = 0; }
	if(empty($_POST['ortopeding']) || !(int)$_POST['ortopeding']){ $_POST['ortopeding'] = 0; }


	//anons photo
	$anons_photo = ((isset($_POST['anons_photo']))? explode('|',$_POST['anons_photo']) : '');
	//end anons photo



	/*if(!count($errors)){
		if($_FILES['file']['error'] == 0) {
			if(Uploader::upload($_FILES['file'],$_POST['size']) != 1){	
				$errors['file'] = Uploader::$error;
			}
    	}
	}*/
		
	if(!count($errors)){
		q(" INSERT INTO `catalog` SET
		    `name`           = '".mres($_POST['name'])."',
		    `seo_name`       = '".mres($_POST['seo_name'])."',
		    `price`          = '".(int)$_POST['price']."',
		    `form`           = '".mres($_POST['form'])."',
			`type`           = '".mres($_POST['type'])."',
			`size`           = '".mres($_POST['size'])."',
			`weight`         = '".(int)$_POST['weight']."',
			`height`         = '".(int)$_POST['height']."',
			`rigidity`		 = '".mres($_POST['rigidity'])."',
			`anatoming`      = '".(int)$_POST['anatoming']."',
			`ortopeding`     = '".(int)$_POST['ortopeding']."',
			`description`    = '".mres($_POST['description'])."',
			`text`           = '".mres($_POST['text'])."',
			`anons_photo`    = '".mres($anons_photo[0])."',

			`garanty`        = '".(int)$_POST['garanty']."',
		    `availability`   = '".(int)$_POST['availability']."',
			`date`           = NOW()
		");
		
		$_SESSION['info']= 'Товар успішно доданий!';
		header("Location: /admin/catalog/");
		exit();
	}
}