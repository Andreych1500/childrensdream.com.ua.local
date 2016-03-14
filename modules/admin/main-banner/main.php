<?php
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

    q(" DELETE FROM `main_banner`
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/main-banner/");
    exit();
}

// --- END DELETE ELEMENT AND FILE ---


// --- ACTIVE ELEMENT ---

if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }

    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `main_banner`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/main-banner/");
    exit();
}

// --- END ACTIVE ELEMENT ---


// --- DEACTIVE ELEMENT ---

if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `main_banner`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/main-banner/");
    exit();
}

// --- END DEACTIVE ELEMENT ---


// --- ALL ELEMENT ---

$main_banner = q("
    SELECT *
    FROM `main_banner`
    ORDER BY `sort` DESC, `id` DESC
");

// --- END ALL ELEMENT