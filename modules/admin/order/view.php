<?php
// --- GET ELEMENT ---
$order = q("
    SELECT *
    FROM `order`
    WHERE `id` = ".(int)$_GET['id']."
    LIMIT 1
");

if($order->num_rows){
    $arResult = $order->fetch_assoc();
} else {
    header("Location: /admin/order/");
    exit();
}