<?php
// видалення товарів
if(isset($_POST['delete']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }

    $ids = implode(',',$_POST['ids']);

    $delete_dir = q("
        SELECT `seo_name`
        FROM `catalog_ru`
        WHERE `id` IN (".$ids.")
    ");


    while($row =  $delete_dir->fetch_assoc()){
        removeDirectory('./uploaded/'.$row['seo_name']);
    }

    q(" DELETE FROM `catalog_ru`
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Товар успішно видалений!';
    header("Location: /admin/catalog_ru/");
    exit();
}

// active
if(isset($_POST['active']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `catalog_ru`
        SET `active` = 1
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Товар успішно активований!';
    header("Location: /admin/catalog_ru/");
    exit();
}

// deactivate
if(isset($_POST['deactive']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" UPDATE `catalog_ru`
        SET `active` = 0
		WHERE `id` IN (".$ids.")
	");

    $_SESSION['info'] = 'Товар успішно деактивований!';
    header("Location: /admin/catalog_ru/");
    exit();
}

$res = q("
    SELECT *
    FROM `catalog_ru`
    ORDER BY `id` DESC
");

if(isset($_SESSION['info'])){
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}