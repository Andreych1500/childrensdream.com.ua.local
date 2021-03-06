<?php
// Ajax More Element
if (isset($_REQUEST['ajax'])) {
    if (isset($_POST['nextLine'], $_POST['siteLang']) && array_search($_POST['siteLang'], explode(',', $GM['list_length'])) !== false && $_POST['nextLine'] > 0) {
        $countLine = 4;
        $lastNumber = $countLine * ((int)$_POST['nextLine'] - 1);
        $allElements = $countLine * (int)$_POST['nextLine'];
        $link_lang = $_POST['siteLang'] == 'ua'? '/' : '/ru/';
        $lang = $_POST['siteLang'] == 'ua'? 'ua' : 'ru';

        $all = q("
            SELECT `id`
            FROM `products`
            WHERE `active` = 1
        ");

        $products = q("
            SELECT `id`,`name_ua`,`symbol_code`,`price`,`availability`,`img_anons`,`name_ru`,`img_seo_alt_ua`,`img_seo_alt_ru`,`description_ua`,`description_ru`, `height`, `size`, `count_layers_ru`, `count_layers_ua`
            FROM `products`
            WHERE `active` = 1 
            ORDER BY `availability` DESC, `sort` DESC, `id`
            LIMIT ".$lastNumber.", ".$countLine."
        ");

        $all_count = $all->num_rows;
        $count = $products->num_rows;
        $end = 1;
        $html = '';

        if ($count > 0) {
            ob_start();
            while ($el = $products->fetch_assoc()) { ?>
                <div style="display: none" class="mattress" itemscope itemtype="http://schema.org/Product">
                    <a class="photos" href="<?=$link_lang?>products/<?=hsc($el['symbol_code'])?>/" itemprop="url">
                        <img src="<?=hsc($el['img_anons'])?>" alt="<?=hsc($el['img_seo_alt_'.$lang])?>" itemprop="image">
                        <span><?=($lang == 'ua'? 'Гарантія' : 'Гарантия')?></span>
                    </a>
                    <a class="links" href="<?=$link_lang?>products/<?=hsc($el['symbol_code'])?>/">
                        <span itemprop="name"><?=hsc($el['name_'.$lang])?></span>
                    </a>
                    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                        <div class="price"><?=number_format(hsc($el['price']), 0, ',', ' ')?> <?=$mess['PRICE']?></div>
                        <div class="aviability">
                            <span class="<?=(((int)$el['availability'] == 1)? 'icon-check-ok' : 'icon-cross')?>"></span>
                            <link itemprop="availability" href="<?=((int)$el['availability'] == 1? 'http://schema.org/InStock' : 'http://schema.org/OutOfStock')?>">
                            <span><?=(((int)$el['availability'] == 1)? $mess['AVIABILITY'] : $mess['NOAVIABILITY'])?></span>
                        </div>
                        <div class="anons-characteristic">
                            <div>
                                <?=($lang == 'ua'? 'Розмір: ' : 'Размер: ')?>
                                <span><?=hsc($el['size'])?> см.</span>
                            </div>
                            <div>
                                <?=($lang == 'ua'? 'Висота: ' : 'Высота: ')?>
                                <span><?=hsc($el['height'])?> см.</span>
                            </div>
                            <div>
                                <?=($lang == 'ua'? 'Слої: ' : 'Слои: ')?>
                                <span><?=hsc(preg_replace('#([0-9]|\(|\)|\\s)#uis', '', $el['count_layers_'.$lang]))?></span>
                            </div>

                            <?php if ((int)$el['availability'] == 1) {
                                if (array_key_exists('g'.(int)$el['id'], $cookies)) {
                                    $basket = 'backet-ok';
                                } else {
                                    $basket = '';
                                } ?>
                                <div class="add-shop <?=(!empty($basket)? $basket : '')?>"<?php if (empty($basket)) { ?> onclick="addToCard(<?=(int)$el['id']?>,'<?=$messG['BASKETOK']?>','1', this)"<?php } ?>>
                                    <?=(empty($basket)? '<span class="icon-basket"></span>' : '')?>
                                    <?=(!empty($basket)? $messG['BASKETOK'] : $messG['ADDSHOP'])?>
                                </div>
                            <?php } ?>
                        </div>
                        <link itemprop="itemCondition" href="http://schema.org/NewCondition">
                        <meta itemprop="seller" content="Children's Dream">
                        <meta itemprop="price" content="<?=hsc($el['price'])?>.00">
                        <meta itemprop="priceCurrency" content="UAH">
                    </div>
                    <meta itemprop="description" content="<?=hsc($el['description_'.$lang])?>">
                    <meta itemprop="brand" content="Children's Dream">
                </div>
            <?php }
            $html = ob_get_clean();
            if ($all_count <= $allElements) {
                $end = 0;
            }

            echo json_encode([
                'html' => $html,
                'end'  => $end
            ]);
            exit();
        } else {
            echo json_encode(['error' => 'warning']);
            exit();
        }
    } else {
        echo json_encode(['error' => 'warning']);
        exit();
    }
}

// Send call from
if (isset($_POST['ok'])) {
    $error = [];
    $_POST = trimAll($_POST);

    $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
    $check['email'] = (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)? 'class="error"' : '');
    $check['text'] = (empty($_POST['text'])? 'class="error"' : '');
    $check['them'] = (empty($_POST['them'])? 'class="error"' : '');
    $check['capcha'] = (($_POST['capcha'] != $_SESSION['rand_code'])? 'class="error"' : '');

    if (in_array('class="error"', $check)) {
        $error['stop'] = 1;
    }

    if (!count($error)) {
        $limit_access = q("
            SELECT `id`
            FROM `call_me`
            WHERE `user_ip` = '".mres($_SERVER['REMOTE_ADDR'])."' AND `data_create` >= NOW() - INTERVAL 1 DAY
            LIMIT 4
        ");

        $limit = (($limit_access->num_rows >= 2)? 'N' : 'Y');

        if ($limit == 'Y') {
            $_POST = mres($_POST);

            q(" INSERT INTO `call_me` SET
                `name`         = '".$_POST['name']."',
                `them`         = '".$_POST['them']."',
                `email`        = '".$_POST['email']."',
                `text`         = '".$_POST['text']."',
                `user_ip`      = '".mres($_SERVER['REMOTE_ADDR'])."',
                `data_create`  = NOW()
            ");

            Mail::$text = TemplateMail::formationMail('', 'call_me', $lang, $arMainParam);

            if (Mail::$text) {
                Mail::$to = $_POST['email'];
                Mail::send();
            }

            sessionInfo($link_lang.'#call', '#call_me', 2);
        }
    }
}

// Element products
$products = q("
    SELECT `id`,`name_ua`,`symbol_code`,`price`,`availability`,`img_anons`,`name_ru`,`img_seo_alt_ua`,`img_seo_alt_ru`,`description_ua`,`description_ru`, `height`, `size`, `count_layers_ru`, `count_layers_ua`
    FROM `products`
    WHERE `active` = 1 
    ORDER BY `availability` DESC, `sort` DESC, `id`
    LIMIT 8
");

// Element banners
$main_banner = q("
    SELECT *
    FROM `admin_main_banner`
    WHERE `active` = 1 ORDER BY `sort` DESC, `id` DESC
");