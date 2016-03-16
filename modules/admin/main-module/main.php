<?php

// --- ALL MODULE ---

$main_module = q("
    SELECT *
    FROM `pages`
    WHERE `dinamic-page` = 1
");

// --- END ALL MODULE ---