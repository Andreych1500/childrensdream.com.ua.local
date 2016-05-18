<?php
// --- DELETE ELEMENT ---
if(isset($_POST['delete']) && isset($_POST['ids'])){
    foreach($_POST['ids'] as $k=>$v){
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',',$_POST['ids']);

    q(" DELETE FROM `mails`
		WHERE `id` IN (".$ids.")
	");

    header("Location: /admin/mails/");
    exit();
}

// --- GET ALL ELEMENT OR FILTER---
$mails = q("
    SELECT *
    FROM `mails`
    ORDER BY `id` DESC
");