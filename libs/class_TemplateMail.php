<?php

class TemplateMail
{
    static $socLink = [
        'fb' => [
            'url'      => 'https://www.facebook.com/tmchildrensdream',
            'img'      => '/skins/default/img/mails/facebook.png',
            'alt_name' => 'FaceBook'
        ],
        // 'vk' => array(
        // 'url' => 'https://vk.com/tmchildrensdream',
        // 'img' => '/skins/default/img/mails/vk.png',
        // 'alt_name' => 'Vkontakte'
        // ),
        'g+' => [
            'url'      => 'https://plus.google.com/u/0/101299485141835241705/posts',
            'img'      => '/skins/default/img/mails/google_plus.png',
            'alt_name' => 'Google+'
        ],
        'in' => [
            'url'      => 'https://www.instagram.com/tm_childrens_dream',
            'img'      => '/skins/default/img/mails/instagram.png',
            'alt_name' => 'Instagram'
        ]
    ];

    static function formationMail($param_content, $symbol_code, $lang, $arMainParam, $no_act = 1) {

        $arSetting = hsc(q("
            SELECT * 
            FROM `admin_setting_mails`
            WHERE `id` = 1
        ")->fetch_assoc());

        if ($no_act == 1) {
            $no_text_act = 'AND `active` = 1';
        } else {
            $no_text_act = '';
        }

        $arNumType = q("
            SELECT * 
            FROM `admin_type_mails`
            WHERE `symbol_code` = '".$symbol_code."' ".$no_text_act."
            LIMIT 1
        ");

        if ($arNumType->num_rows > 0 && !arrOneEmpty($arSetting)) {

            $arType = hsc($arNumType->fetch_assoc());

            foreach (explode(',', $arType['list_length']) as $k => $v) {
                if ($v == $lang) {
                    $l = $k;
                    break;
                }
            }

            if ($lang == 'ua') {
                $langUrl = '';
            } else {
                $langUrl = $lang.'/';
            }

            $arSet = [
                'background' => $arMainParam['url_http_site'].'/skins/default/img/mails/pattern.png',
                'logoImage'  => $arMainParam['url_http_site'].'/skins/default/img/mails/logo.png',
                'theme'      => explode('#|#', $arType['theme_list'])[$l],
                'name'       => explode('#|#', $arType['name_list'])[$l],
                'text'       => explode('#|#', $arType['text'])[$l],
                'why'        => explode('#|#', $arType['why_list'])[$l],
                'wwwSite'    => $arSetting['wwwSite'],
                'phone'      => $arSetting['phone'],
                'email'      => $arSetting['email'],
                'urlToSite'  => $arMainParam['url_http_site'].'/'.$langUrl,
                'shops_ua'   => 'Каталог продукції',
                'shops_ru'   => 'Каталог продукции',
                'shops_en'   => 'Continue shopping:',
                'popular_ua' => 'Популярні товари:',
                'popular_ru' => 'Популярные товары:',
                'popular_en' => 'Popular goods:'
            ];

            // Goods
            $arGoods = q("
              SELECT *
              FROM `products`
              WHERE `id` IN (".$arSetting['ids_goods'].")
            ");

            Mail::$subject = $arSet['theme']; // Headers from list !!!
            Mail::$from = $arMainParam['from_email'];
            Mail::$hidden_copy = $arType['hidden_copy'];
            $content = explode('#|#', $arType['text'])[$l];

            if (is_array($param_content) && !empty($param_content)) {
                foreach ($param_content as $k => $v) {
                    if (is_array($v)) {
                        continue;
                    }

                    $content = preg_replace("~#".$k."#~uis", $v, $content);
                }
            }

            ob_start();
            ?>
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title><?=$arSet['theme']?></title>
            </head>
            <body style="background: url(<?=$arSet['background']?>) #ffffff; line-height:1.5; color:#482200; padding:30px 20px; font-size:17px;">
            <div role="header" style="text-align: center; border: 1px dashed #43D1E0; background:#ffffff; padding:10px; margin: auto; max-width: 538px;">
                <a href="<?=$arSet['urlToSite']?>" target="_blank" title="<?=$arSet['wwwSite']?>" style="outline:none; display:inline-block;">
                    <img src="<?=$arSet['logoImage']?>" alt="logo" style="width:auto">
                </a>
                <p style="font-size: 26px; margin:0; font-weight:bold;"><?=$arSet['name']?></p>
                <div style="clear:both;"></div>
            </div>
            <div role="main" style="border-left: 1px dashed #43D1E0; border-right: 1px dashed #43D1E0; background:#ffffff; font-family: sans-serif; padding: 10px; margin: auto; max-width: 538px;">

                <?=htmlspecialchars_decode($content)?>

                <div style="margin: 10px auto 20px; width: 100%; max-width: 250px; text-align: center; background: #43D1E0; font-size:20px;">
                    <a href="<?=hsc($arSet['urlToSite'])?>products/" target="_blank" title="" style="color:#ffffff; padding:5px 0; text-decoration:none; display: inline-block; width: 100%;"><?=hsc($arSet['shops_'.$lang])?></a>
                </div>
                <p style="font-weight:bold; text-align:center; margin:0 0 10px;"><?=hsc($arSet['popular_'.$lang])?></p>
                <?php while ($arResult = $arGoods->fetch_assoc()) { ?>
                    <div class="goods_children_dream_tm" style="margin: 1% 1% 5%; text-align:center;">
                        <a href="<?=$arSet['urlToSite']?>products/<?=hsc($arResult['symbol_code'])?>/" target="_blank" style="display:inline-block; width:100%;">
                            <img src="<?=$arMainParam['url_http_site'].hsc($arResult['img_anons'])?>" style="max-width:255px; width:100%;" alt="<?=hsc($arResult['name_'.$lang])?>">
                        </a>
                        <a href="<?=hsc($arSet['urlToSite'])?>products/<?=hsc($arResult['symbol_code'])?>/" target="_blank" style="width:100%; color:#482200;"><?=hsc($arResult['name_'.$lang])?></a>
                    </div>
                <?php } ?>
                <div style="clear:both;"></div>
            </div>
            <div role="footer" style="background:#ffffff; padding: 10px; color: #BFBFBF; text-align: center; border: 1px dashed #43D1E0; margin: auto; max-width: 538px;">
                <p style="margin:0 0 10px; font-size: 18px;">E-mail:
                    <a href="mailto:<?=$arSet['email']?>" style="color:#8B8B8B !important; font-weight:bold; text-decoration:none;"><?=$arSet['email']?></a> | Phone:
                    <a href="callto:<?=calltoPhone($arSet['phone'])?>" style="color:#8B8B8B !important; font-weight:bold; text-decoration:none;">+<?=calltoPhone($arSet['phone'])?></a>
                </p>
                <div style="font-size:0; margin:0 0 10px;">
                    <?php foreach (self::$socLink as $k => $v) { ?>
                        <a href="<?=$v['url']?>" target="_blank" style="display:inline-block; margin: 0 5px;"><img src="<?=$arMainParam['url_http_site'].$v['img']?>" alt="<?=$v["alt_name"]?>"></a>
                    <?php } ?>
                    <div style="clear:both;"></div>
                </div>
                <p style="font-size:14px;"><?=$arSet['why']?>
                    <a href="<?=$arSet['urlToSite']?>" target="_blank" style="color: #43D1E0; display: inherit;"><?=$arSet['wwwSite']?></a>
                </p>
                <p>&copy; <?=data(2015)?></p>
            </div>
            </body>
            </html>
            <?php
            $html = ob_get_contents();
            ob_get_clean();

            return $html;
        } else {
            Mail::$subject = 'Error '.$arSetting['wwwSite'];
            Mail::$from = $arMainParam['from_email'];
            Mail::$text = 'Сталася помилка при відправці листа, код: :'.$symbol_code;
            Mail::$to = $arSetting['test_email'];
            Mail::send();

            return false;
        }
    }
}