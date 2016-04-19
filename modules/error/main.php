<?php
if($_SERVER['REDIRECT_STATUS'] == '403'){
    $status_error = 403;
    header('HTTP/1.0 403 Forbidden');
} else {
    $status_error = 404;
    header("HTTP/1.0 404 Not Found");
}