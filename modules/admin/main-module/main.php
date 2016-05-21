<?php
// --- UPDATE_FILE ---
if(isset($_REQUEST['reload'])){

    q(" UPDATE `main_core` SET
        `new_resource`  = ".date_timestamp_get(date_create())."
        WHERE `id` = 1
    ");

    $_SESSION['info'] = 'Файли успішно поновлені!';
    header("Location: /admin/main-module/");
    exit();
}

// --- ALL MODULE ---
$main_module = q("
    SELECT *
    FROM `pages`
    WHERE `dinamic-page` = 1
");

// --- INFORMATION SESSION ---
if(isset($_SESSION['info'])){
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}