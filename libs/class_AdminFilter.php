<?php
class AdminFilter{
    static $filter_inputs = '';
    static $filter = '';
    static $filter_option = array();
    static $j = 0;

    static function htmlFormation($db_table, $lang, $post){
        include './libs/filter/lang/inp_lang_'.$lang.'.php';
        include './libs/filter/param.php';

        $columns = q("SHOW COLUMNS FROM `".$db_table."`");

        while($arFilter = $columns->fetch_assoc()){
            if(!key_exists($arFilter['Field'], $filter_object[$db_table][$lang])){
                continue;
            }

            self::$filter_inputs .= AdminFilter::inputsFormation($arFilter, $filter_object[$db_table][$lang][$arFilter['Field']], (isset($post[$arFilter['Field']])? $post[$arFilter['Field']] : ''), $inpMess);
        }

        return array('filter_inputs' => self::$filter_inputs, 'filter_option' => self::$filter_option);
    }

    static function inputsFormation($ar, $name, $post, $inpMess){
        $inputs = '';

        if(preg_match("#^(timestamp|datetime)#us", $ar['Type'], $matches)){ // No date
            return false;
        }

        self::$filter_option[] = $name;
        $act = (isset($_COOKIE['filter']) && in_array(self::$j, (array)json_decode($_COOKIE['filter']))? 'act-option' : '');
        $disabled = (isset($_COOKIE['filter']) && in_array(self::$j, (array)json_decode($_COOKIE['filter']))? '' : 'disabled');
        ++self::$j;

        if(preg_match("#^int#uis", $ar['Type'])){
            $inputs .= '<div class="input-value '.$act.'">
                    <div class="name-section">'.$name.':</div>
                    <input '.$disabled.' type="text" name="filter['.$ar['Field'].']" value="'.(isset($post)? $post : "").'">
                   </div>';
        }

        if(preg_match("#^tinyint#uis", $ar['Type'])){
            $inputs .= '<div class="input-value '.$act.'">
                    <div class="name-section">'.$name.':</div>
                    <select '.$disabled.' name="filter['.$ar['Field'].']">';

            foreach($inpMess[$ar['Field']] as $k => $v){
                $inputs .= '<option value="'.$k.'" '.(($post == $k && strlen($k) == strlen($post))? 'selected' : '').'>'.$v.'</option>';
            }

            $inputs .= ' </select></div > ';
        }

        if(preg_match("#^text#uis", $ar['Type'])){
            $inputs .= '<div class="input-value '.$act.'">
                          <div class="name-section">'.$name.':</div>
                          <input '.$disabled.' type="text" name="filter['.$ar['Field'].']" value="'.(isset($post)? $post : "").'">
                        </div>';
        }

        if(preg_match("#^varchar#uis", $ar['Type'])){
            $inputs .= '<div class="input-value '.$act.'">
                          <div class="name-section">'.$name.':</div>
                          <input '.$disabled.' type="text" name="filter['.$ar['Field'].']" value="'.(isset($post)? $post : "").'">
                        </div>';
        }

        return $inputs;
    }

    static function filter($arFilter, $db_table){
        $f_post = array();
        $columns = q("SHOW COLUMNS FROM `".$db_table."`");

        while($column = $columns->fetch_assoc()){
            if(isset($arFilter[$column['Field']])){
                $f_post[$column['Field']] = $arFilter[$column['Field']];
            }
        }

        $like = 'WHERE';

        foreach($f_post as $k => $v){

            if(is_array($v)){
                continue;
            }

            if(strlen($v) && isset($like)){
                self::$filter .= $like.' `'.$k.'` LIKE \'%'.$v.'%\'';
                unset($like);
                continue;
            }

            if(!isset($like) && strlen($v)){
                self::$filter .= ' AND `'.$k.'` LIKE \'%'.$v.'%\'';
            }
        }

        return self::$filter;
    }
}