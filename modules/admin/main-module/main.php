<?php

// --- ALL MODULE ---

$main_module = q("
    SELECT *,
    DATE_FORMAT(`date_custom`,'%d-%m-%Y  %H:%i:%s') AS `date_custom`
    FROM `pages`
    WHERE `dinamic-page` = 1
");

// --- END ALL MODULE ---