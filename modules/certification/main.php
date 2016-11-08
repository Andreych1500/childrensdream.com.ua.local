<?php
$certification = q("
    SELECT *
    FROM `admin_policy_certification`
    ORDER BY `sort` DESC
");