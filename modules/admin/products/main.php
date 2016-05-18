<?php
Core::$JS[] = '<script src="/skins/admin/js/mainEditMenu.js?v=1"></script>';

// --- EDIT ELEMENT ---
if(isset($_POST['resArr']) && count($_POST['resArr']) > 0){

    foreach($_POST['resArr'] as $key => $array){

        // --- add no checkbox ---
        if(!isset($array['active'])){
            $array['active'] = 0;
        }

        foreach($array as $name => $value){
            $when[$name][$key] = $value;
        }
        $ids .= $key.',';
    }

    foreach($when as $colum => $arrayId){
        $qText .= "`".$colum."` = CASE ";
        foreach($arrayId as $id => $value){
            $qText .= " WHEN `id` = ".$id." THEN '".$value."'";
        }
        $qText .= " END,";
    }

    $ids = trim($ids, ',');

    q("UPDATE `products` SET
        ".$qText."
        `user_custom` = '".mres($_SESSION['user']['FIO'])."'
        WHERE `id` IN (".$ids.")
    ");

    header("Location: /admin/products/");
    exit();
}

// --- DELETE ELEMENT AND FILE ---
if(isset($_POST['delete']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $key=>$value){
        if(!empty($_POST['del'][$value])){
            $files = explode('|',$_POST['del'][$value]);

            foreach($files as $key2 => $value2){
                if(file_exists('.'.$value2)){
                    unlink('.'.$value2);
                }
            }
        }
    }

    $ids = implode(',',$_POST['ids']);

    q(" DELETE FROM `products`
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/products/");
    exit();
}

// --- ACTIVE ELEMENT ---
if(isset($_POST['activates']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }

    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `products`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/products/");
    exit();
}

// --- DEACTIVE ELEMENT ---
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `products`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/products/");
    exit();
}

// --- ALL ELEMENT ---
$products = q("
    SELECT *
    FROM `products`
    ORDER BY `sort` DESC, `id` DESC
");