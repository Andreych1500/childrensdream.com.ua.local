<?php
// --- EDIT ELEMENT ---
if(isset($_POST['resArr']) && count($_POST['resArr']) > 0){

    foreach($_POST['resArr'] as $key => $array){

        // --- ADD NO CHECKBOX ---
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

    q("UPDATE `main_banner` SET
        ".$qText."
        `user_custom` = '".mres($_SESSION['user']['FIO'])."'
        WHERE `id` IN (".$ids.")
    ");

    header("Location: /admin/main-banner/");
    exit();
}

// --- DELETE ELEMENT AND FILE ---
if(isset($_POST['delete']) && isset($_POST['ids'])){

    foreach($_POST['ids'] as $key => $value){
        if(!empty($_POST['del'][$value])){
            $files = explode('|', $_POST['del'][$value]);

            foreach($files as $key2 => $value2){
                if(file_exists('.'.$value2)){
                    unlink('.'.$value2);
                }
            }
        }
    }

    $ids = implode(',', $_POST['ids']);

    q(" DELETE FROM `main_banner`
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/main-banner/");
    exit();
}

// --- ACTIVE ELEMENT ---
if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k => $v){
        $_POST['ids'][$k] = (int)$v;
    }

    $ids = implode(',', $_POST['ids']);

    q(" UPDATE `main_banner`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/main-banner/");
    exit();
}

// --- DEACTIVE ELEMENT ---
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k => $v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',', $_POST['ids']);

    q(" UPDATE `main_banner`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/main-banner/");
    exit();
}

// --- GET ALL ELEMENT ---
$main_banner = q("
    SELECT *
    FROM `main_banner`
    ORDER BY `sort` DESC, `id` DESC
");