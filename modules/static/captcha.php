<?php
session_start();
$string = "";
for ($i = 0; $i < 5; $i++) {
    $string .= chr(rand(97, 122));
}

$_SESSION['rand_code'] = $string;

$image = imagecreate(170, 55);
$color = imagecolorallocate($image, 200, 100, 90);
$white = imagecolorallocate($image, 255, 255, 255);

imagefilledrectangle($image, 0, 0, 399, 99, $white);
imagettftext($image, 30, 0, 10, 40, $color, "fonts/verdana.ttf", $_SESSION['rand_code']);

header("Content-type: image/png");
imagepng($image, null, 9, PNG_NO_FILTER);