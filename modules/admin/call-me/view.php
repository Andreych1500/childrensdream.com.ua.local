<?php
// --- GET ELEMENT ---
$call_me = q("
    SELECT *
    FROM `call_me`
    WHERE `id` = ".(int)$_GET['id']."
    LIMIT 1
");

if($call_me->num_rows){
    $arResult = $call_me->fetch_assoc();
} else {
    header("Location: /admin/call-me/");
    exit();
}