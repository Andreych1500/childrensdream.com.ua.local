<?php
Core::$JS[] = '<script src="/skins/admin/js/mainEditMenu.js?v=1"></script>';

// --- EDIT ELEMENT ---
if(isset($_POST['resArr']) && count($_POST['resArr']) > 0){

    foreach($_POST['resArr'] as $key => $array){

        // --- add no checkbox ---
        if(!isset($array['active'])){
            $array['active'] = 0;
        }
        // --- end add no checkbox ---

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

    q("UPDATE `catalog` SET
        ".$qText."
        `user_custom` = '".mres($_SESSION['user']['FIO'])."'
        WHERE `id` IN (".$ids.")
    ");

    header("Location: /admin/catalog/");
    exit();
}
// --- END EDIT ELEMENT ---


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

    q(" DELETE FROM `catalog`
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/catalog/");
    exit();
}

// --- END DELETE ELEMENT AND FILE ---


// --- ACTIVE ELEMENT ---

if(isset($_POST['activates']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }

    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `catalog`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/catalog/");
    exit();
}

// --- END ACTIVE ELEMENT ---


// --- DEACTIVE ELEMENT ---

if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `catalog`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/catalog/");
    exit();
}

// --- END DEACTIVE ELEMENT ---


// --- ALL ELEMENT ---

$product = q("
    SELECT *
    FROM `product`
    ORDER BY `sort` DESC, `id` DESC
");

// --- END ALL ELEMENT