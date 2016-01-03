<?php
// редагування товара
if(isset($_POST['ok'],$_POST['name'],$_POST['seo_el_name'],$_POST['price'],$_POST['text'],$_POST['description'])){
    $_POST = trimAll($_POST);
    $errors = array();

    if(empty($_POST['name'])){
        $errors['name'] = 'errors';
    }
    if(empty($_POST['seo_el_name'])){
        $errors['seo_el_name'] = 'errors';
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
        q(" UPDATE `catalog_ru` SET
			`name` = '".mres($_POST['name'])."',
			`seo_name`       = '".mres($_POST['seo_el_name'])."',
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
			`descrip_photo`  = '".mres($descrip_photo[0])."',
			`more_photos`    = '".mres($add_more_file)."',

			`garanty`        = '".(int)$_POST['garanty']."',
		    `availability`   = '".(int)$_POST['availability']."'
			 WHERE `id`    = ".(int)$_GET['key2']."
		");
        $_SESSION['info'] = 'Зміни  провели успішно!';
        header("Location: /admin/catalog_ru/");
        exit();
    }

}

// перевірка чи товар існує
$products = q("
	SELECT *
	FROM `catalog_ru`
	WHERE `id` = ".(int)$_GET['key2']."
	LIMIT 1
");

if(!$products->num_rows){
    $_SESSION['info'] = 'Товара неіснує!';
    header("Location: /admin/catalog_ru/");
    exit();
}

$row = $products->fetch_assoc();


// arRow[more_photos]
if(!empty($row['more_photos'])){
    if(isset($_POST['more_photos']) > 0 && count($_POST['more_photos']) > 0){
        foreach ($_POST['more_photos'] as $key => $val) {
            $more_photos[$key] = explode('|', $val);
            $more_photos[$key][3] = $val;
        }
    } else {
        $more_photos = explode('#', $row['more_photos']);

        foreach ($more_photos as $key => $val) {
            $more_photos[$key] = explode('|', $val);
            $more_photos[$key][3] = $val;
        }
    }
}
// end arRow[more_photos]