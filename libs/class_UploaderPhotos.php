<?php
class UploaderPhotos {

    static $error = '';
    static $filename = '';
    static $tmp = array ('image/jpeg','image/gif','image/png');
    static $tup = array ('jpg','gif','jpeg','png');
    static $info = array();

    static function upload($file, $width, $directory){
        if($file['size'] < 500 || $file['size'] > 50000000) {
            self::$error = 'Розмір файла нам не підходить';
        } elseif(!in_array($file['type'],self::$tmp)){
            self::$error = 'Тип файла не відходить';
        } else {
            preg_match('#\.([a-z]+)$#ui',$file['name'],$matches);
            if(isset($matches[1])){
                $matches[1] = mb_strtolower($matches[1]);

                $temp = getimagesize($file['tmp_name']);

                if(!file_exists('../uploaded/'.$directory)){
                    mkdir('../uploaded/'.$directory); //створення окремої папки для товара папки
                }

                $namefile = date('Ymd-His').'img'.rand(10000,99999);

                if($temp['mime'] == 'image/png'){
                    $namefile = date('YmdHis').'img'.rand(10000,99999).'.png';
                } elseif($temp['mime'] == 'image/jpeg'){
                    $namefile = date('YmdHis').'img'.rand(10000,99999).'.jpeg';
                } elseif($temp['mime'] == 'image/gif'){
                    $namefile = date('YmdHis').'img'.rand(10000,99999).'.gif';
                }

                $name = '/uploaded/'.$directory.'/'.$namefile;

                self::$filename = $name;

                self::$info['name_dir']  = $directory;
                self::$info['name_file'] = $namefile;
                self::$info['file']      = $name;

                if(!in_array($matches[1],self::$tup)){
                    self::$error = 'Не підходить розширення зображення';
                } elseif(!in_array($temp['mime'],self::$tmp)){
                    self::$error = 'Не підходить тип файла, можна загружати лише зображення';
                } elseif($temp[1] < 30 || $temp[0] < 40){
                    self::$error = 'Не підходить розмір зображення';
                } elseif($temp[1] > $temp[0] * 5){
                    self::$error = 'Не підходить розмір зображення';
                } elseif($temp[1] >= 10000 || $temp[0] >= 10000){
                    self::$error = 'Розширення у пікселях занадто велике';
                }  elseif(!move_uploaded_file($file['tmp_name'],'..'.$name)){
                    self::$error = 'Зображення не загружено! Ошибка';
                } else {
                    UploaderPhotos::resize($name,$width);
                    return self::$info;
                }
            } else {
                self::$error = 'Даний файл не є зображенням. Допускається тип файлів: jpeg,jpg,png,gif';
            }
        }

    }

    static function resize($name,$width){

        $temp = getimagesize($_SERVER['DOCUMENT_ROOT'].$name); // дістаєм дійсну ширину і висоту зображення

        $new_width = $width;//$dst_w - нова ширина зображення
        $new_height = ($temp['1'] * $new_width)/$temp['0'];//$dst_h - нова висота зображення

        // Вісь x,y , переміщення вихідного картинки
        $dst_x = 0;
        $dst_y = 0;
        // Вісь x,y , переміщення вхідного картинки
        $src_x = 0;
        $src_y = 0;

        $src_w =  $temp[0];
        $src_h =  $temp[1];

        $dst_w = $new_width;
        $dst_h = $new_height;

        $dst_image = imagecreatetruecolor($new_width, $new_height);//створюєм каркас зображення з шириною і висотою

        if($temp['mime'] == 'image/png'){
            $src_image = imagecreatefrompng($_SERVER['DOCUMENT_ROOT'].$name); //заливаєм зображеня з його забраження або URL

            imagealphablending($dst_image, false);
            imagesavealpha($dst_image,true);

            $transparent = imagecolorallocatealpha($dst_image, 255, 255, 255, 127);

            imagefilledrectangle($dst_image, 0, 0, 140, 140, $transparent);

            imagecopyresampled($dst_image, $src_image, $dst_x, $dst_y, $src_x, $src_y, $dst_w, $dst_h, $src_w, $src_h);
            imagepng($dst_image, '..'.$name, 9);

            imagedestroy($dst_image);
            imagedestroy($src_image);

        } elseif($temp['mime'] == 'image/jpeg'){
            $src_image = imagecreatefromjpeg($_SERVER['DOCUMENT_ROOT'].$name);

            $whiteBackground = imagecolorallocate($dst_image, 255, 255, 255);
            imagefill($dst_image,0,0,$whiteBackground);

            imagecolortransparent($dst_image, $whiteBackground);

            imagecopyresampled($dst_image, $src_image, $dst_x, $dst_y, $src_x, $src_y, $dst_w, $dst_h, $src_w, $src_h);
            imagejpeg($dst_image,'..'.$name, 75);

        } elseif($temp['mime'] == 'image/gif'){
            $src_image = imagecreatefromgif($_SERVER['DOCUMENT_ROOT'].$name);

            imagecopyresampled($dst_image, $src_image, $dst_x, $dst_y, $src_x, $src_y, $dst_w, $dst_h, $src_w, $src_h);
            imagegif($dst_image,'..'.$name);
        }
    }
}