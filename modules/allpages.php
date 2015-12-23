<?php
Core::$JS[] =  '<script type="text/javascript" src="/skins/default/js/script.js"></script>';

if(preg_match('#^ru#ius',Core::$CONT['castom']) && Core::$LANGUAGE['status']){
    $langs = Core::$LANGUAGE['allow']['ru'];
} else {
    $langs = Core::$LANGUAGE['default'];
}