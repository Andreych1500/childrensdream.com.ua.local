<?php
// --- GET ELEMENT ---
$comments = q("
    SELECT *
    FROM `comments`
    WHERE `id` = ".(int)$_GET['id']."
    LIMIT 1
");

if($comments->num_rows){
    $arResult = $comments->fetch_assoc();
} else {
    header("Location: /admin/comments/");
    exit();
}