<?php

// --- GET ELEMENT ---

$mails = q("
    SELECT *
    FROM `mails`
    WHERE `id` = ".(int)$_GET['id']."
    LIMIT 1
");

if($mails->num_rows){
    $arResult = $mails->fetch_assoc();
    preg_match('#(<body)(.+)(body>)#uis', TemplateMailOrder::formateHtml(), $body);
} else {
    header("Location: /admin/mails/");
    exit();
}

// --- END GET ELEMENT ---