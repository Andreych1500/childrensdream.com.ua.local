<?php
Core::$JS[] = '<script src="/skins/admin/js/addPhoto.js?v=1"></script>';

// --- EDIT ELEMENT ---
if(isset($_POST['ok'])){
	$_POST = trimAll($_POST);
	$errors = array();

	if(empty($_POST['name_ua'])){ $errors['name_ua'] = 'errors'; }
	if(empty($_POST['name_ru'])){ $errors['name_ru'] = 'errors'; }
	if(empty($_POST['seo_el_name'])){ $errors['seo_el_name'] = 'errors'; }
	if(isset($_POST['availability'])){ $_POST['availability'] = 1; }
	if(isset($_POST['active'])){ $_POST['active'] = 1; }
	if(empty($_POST['price']) || !(int)$_POST['price']){ $errors['price'] = 'errors'; }
	if(empty($_POST['text_ua'])){ $errors['text_ua'] = 'errors'; }
	if(empty($_POST['text_ru'])){ $errors['text_ru'] = 'errors'; }
	if(empty($_POST['description_ua'])){ $errors['description_ua'] = 'errors'; }
	if(empty($_POST['description_ru'])) { $errors['description_ru'] = 'errors';	}


	// --- NO MANDATORY FIELDS ---
	if(empty($_POST['sort'])){ $_POST['sort'] = '100'; }
	if(empty($_POST['form_ua'])){ $_POST['form_ua'] = ''; }
	if(empty($_POST['type_ua'])){ $_POST['type_ua'] = '';	}
	if(empty($_POST['form_ru'])){ $_POST['form_ru'] = ''; }
	if(empty($_POST['type_ru'])){ $_POST['type_ru'] = '';	}
	if(empty($_POST['size'])){ $_POST['size'] = '';	}
	if(empty($_POST['weight']) || !(int)$_POST['weight']){ $_POST['weight'] = ''; }
	if(empty($_POST['height']) || !(int)$_POST['height']){ $_POST['height'] = ''; }
	if(empty($_POST['rigidity_ua'])){ $_POST['rigidity_ua'] = '';	}
	if(empty($_POST['rigidity_ru'])){ $_POST['rigidity_ru'] = '';	}
	if(empty($_POST['garanty']) || !(int)$_POST['height']){ $_POST['garanty'] = '';	}
	if(empty($_POST['anatoming']) || !(int)$_POST['anatoming']){ $_POST['anatoming'] = 0; }
	if(empty($_POST['ortopeding']) || !(int)$_POST['ortopeding']){ $_POST['ortopeding'] = 0; }

	// SEO
	if(empty($_POST['meta_title_ua'])){ $_POST['meta_title_ua'] = ''; }
	if(empty($_POST['meta_keywords_ua'])){ $_POST['meta_keywords_ua'] = ''; }
	if(empty($_POST['meta_description_ua'])){ $_POST['meta_description_ua'] = ''; }
	if(empty($_POST['meta_title_ru'])){ $_POST['meta_title_ru'] = ''; }
	if(empty($_POST['meta_keywords_ru'])){ $_POST['meta_keywords_ru'] = ''; }
	if(empty($_POST['meta_description_ru'])){ $_POST['meta_description_ru'] = ''; }
	if(empty($_POST['img_seo_title_ua'])){ $_POST['img_seo_title_ua'] = '';	}
	if(empty($_POST['img_seo_title_ru'])){ $_POST['img_seo_title_ru'] = '';	}
	if(empty($_POST['img_seo_alt_ua'])){ $_POST['img_seo_alt_ua'] = '';	}
	if(empty($_POST['img_seo_alt_ru'])){ $_POST['img_seo_alt_ru'] = '';	}


	// --- FUNCTION IMAGE ---
	$cAnonsPhoto = ((isset($_POST['cAnonsPhoto']))? explode('|',$_POST['cAnonsPhoto']) : '');
	$cCirklePhoto = ((isset($_POST['cCirklePhoto']))? explode('|',$_POST['cCirklePhoto']) : '');

		// --- MORE PHOTO ---
		if(isset($_POST['cMorePhoto']) && count($_POST['cMorePhoto']) >= 1){
			foreach($_POST['cMorePhoto'] as $key => $value){
				$cMorePhoto[$key] = explode('|', $value);
				$cMorePhoto[$key][3] = $value;
			}
			foreach($_POST['cMorePhoto'] as $key => $to_more){
				if(empty($to_more)){ continue; }
				$ar_more[$key] = $to_more;
			}
			if(isset($ar_more)) {
				$addcMorePhoto = implode('#', $ar_more);
			} else {
				$addcMorePhoto = '';
			}
		}
		// --- END MORE PHOTO ---
	// --- END FUNCTION IMAGE ---


	if(!count($errors)){
		q(" UPDATE `catalog` SET
 			`sort`                = '".(int)$_POST['sort']."',
		    `name_ua`             = '".mres($_POST['name_ua'])."',
		    `name_ru`             = '".mres($_POST['name_ru'])."',
		    `price`               = '".(int)$_POST['price']."',
		    `form_ua`             = '".mres($_POST['form_ua'])."',
		    `form_ru`             = '".mres($_POST['form_ru'])."',
			`type_ua`             = '".mres($_POST['type_ua'])."',
			`type_ru`             = '".mres($_POST['type_ru'])."',
			`size`                = '".mres($_POST['size'])."',
			`weight`              = '".(int)$_POST['weight']."',
			`height`              = '".(int)$_POST['height']."',
			`rigidity_ua`		  = '".mres($_POST['rigidity_ua'])."',
			`rigidity_ru`	      = '".mres($_POST['rigidity_ru'])."',
			`anatoming`           = '".(int)$_POST['anatoming']."',
			`ortopeding`          = '".(int)$_POST['ortopeding']."',
			`description_ua`      = '".mres($_POST['description_ua'])."',
			`description_ru`      = '".mres($_POST['description_ru'])."',
			`text_ua`             = '".mres($_POST['text_ua'])."',
			`text_ru`             = '".mres($_POST['text_ru'])."',
			`active`              = '".(int)$_POST['active']."',
			`garanty`             = '".(int)$_POST['garanty']."',
		    `availability`        = '".(int)$_POST['availability']."',

		    `cAnonsPhoto`         = '".mres($cAnonsPhoto[0])."',
			`cCirklePhoto`        = '".mres($cCirklePhoto[0])."',
			`cMorePhoto`          = '".mres($addcMorePhoto)."',

		    `seo_name`            = '".mres($_POST['seo_el_name'])."',
		    `meta_title_ua`       = '".mres($_POST['meta_title_ua'])."',
		    `meta_keywords_ua`    = '".mres($_POST['meta_keywords_ua'])."',
		    `meta_description_ua` = '".mres($_POST['meta_description_ua'])."',
		    `meta_title_ru`       = '".mres($_POST['meta_title_ru'])."',
		    `meta_keywords_ru`    = '".mres($_POST['meta_keywords_ru'])."',
		    `meta_description_ru` = '".mres($_POST['meta_description_ru'])."',

			`img_seo_title_ua`    = '".mres($_POST['img_seo_title_ua'])."',
 			`img_seo_title_ru`    = '".mres($_POST['img_seo_title_ru'])."',
 			`img_seo_alt_ua`      = '".mres($_POST['img_seo_alt_ua'])."',
 			`img_seo_alt_ru`      = '".mres($_POST['img_seo_alt_ru'])."',
 			`user_custom`         = '".mres($_SESSION['user']['FIO'])."'

			 WHERE `id`    = ".(int)$_GET['id']."
		");


		header("Location: /admin/catalog");
		exit();
	}

}


// --- GET ELEMENT ---

$catalog = q("
	SELECT *
	FROM `catalog`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");

if($catalog->num_rows){
	$row = $catalog->fetch_assoc();
} else {
	header("Location: /admin/catalog/");
	exit();
}

// --- END GET ELEMENT ---


// --- FUNCTION cMorePhoto ---
if(!empty($row['cMorePhoto']) && !isset($cMorePhoto)){
	$cMorePhoto = explode('#', $row['cMorePhoto']);

	foreach ($cMorePhoto as $key => $val) {
		$cMorePhoto[$key] = explode('|', $val);
		$cMorePhoto[$key][3] = $val;
	}
} else {
	if(!isset($cMorePhoto)){
		$cMorePhoto[0] = array(
			0 => '',
			1 => '',
			2 => '',
			3 => '',
		);
	}
}
// --- END FUNCTION cMorePhoto ---

/*
 /uploaded/catalog/20160315143719img64201.jpeg|catalog|20160315143719img64201.jpeg#/uploaded/catalog/20160315143727img35757.jpeg|catalog|20160315143727img35757.jpeg#/uploaded/catalog/20160315143731img21909.jpeg|catalog|20160315143731img21909.jpeg#/uploaded/catalog/20160315143735img83778.jpeg|catalog|20160315143735img83778.jpeg#/uploaded/catalog/20160315143738img63514.jpeg|catalog|20160315143738img63514.jpeg
 */

//// one more file
//$file_name = ((isset($errors))? ((!empty($more_photos[0][2]))? ((!empty($more_src[0][2]))? hsc($more_src[0][2]) : 'Файл не вибраний') : ((!empty($more_src[0][0]))? hsc($more_src[0][2]) : 'Файл не вибраний')) : ((!empty($more_photos[0][2]))? hsc($more_photos[0][2]) : 'Файл не вибраний'));
//$file_value = ((isset($errors))? ((!empty($_POST['more_photos'][0]))? hsc($_POST['more_photos'][0]) : '') : ((!empty($more_photos[0][3]))? hsc($more_photos[0][3]) : ''));
//$file_hidden = ((!empty($_POST['more_photos'][0]))? '' : ((!empty($more_photos[0]) && !isset($errors))? '' : ((!empty($more_src[0][0]))? '' : 'hidden')));
//$file_photo = ((isset($_POST['more_photos'][0]))? ((!empty($more_src[0][0]))? hsc($more_src[0][0]) : '') : ((!empty($more_photos[0][0]))? hsc($more_photos[0][0]) : ''));
//// end one more file
//
//// more file
//if(!isset($more_photos) && isset($more_src)){
//	$more_photos = $more_src;
//}
//// end more file