<?php

class DynamicEditMenu
{
    static $ids = '';
    static $qText = '';
    static $primary = [
        0 => 'symbol_code',
        1 => 'login',
        2 => 'email',
        3 => 'module'
    ];

    static function edit($arrPost, $db_table, $url) {

        foreach ($arrPost as $k => $array) {

            // No checkbox
            if (!isset($array['active'])) {
                $array['active'] = 0;
            }

            foreach ($array as $name => $value) {
                $when[$name][$k] = $value;
            }

            self::$ids .= $k.',';
        }

        for ($i = 0; $i < count(self::$primary); ++$i) { // Primary key
            if (isset($when[self::$primary[$i]])) {
                foreach (array_count_values($when[self::$primary[$i]]) as $v) {
                    if ($v > 1) {
                        sessionInfo($url, self::$primary[$i].' primary key!');
                    }
                }
            }
        }

        self::$ids = trim(self::$ids, ',');

        foreach ($when as $colum => $arrayId) {
            self::$qText .= "`".$colum."` = CASE ";
            foreach ($arrayId as $id => $value) {
                self::$qText .= " WHEN `id` = ".$id." THEN '".mres($value)."'";
            }
            self::$qText .= " END,";
        }

        q("
            UPDATE `".$db_table."` SET
            ".self::$qText."
            `user_custom` = '".mres($_SESSION['user']['last_name'].''.$_SESSION['user']['name'])."'
             WHERE `id` IN (".self::$ids.")
        ");

        return true;
    }
}