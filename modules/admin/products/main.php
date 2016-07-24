<?php
if(isset($_REQUEST['add'])){
    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name_ua'] = (empty($_POST['name_ua'])? 'class="error"' : '');
        $check['name_ru'] = (empty($_POST['name_ru'])? 'class="error"' : '');
        $check['symbol_code'] = (empty($_POST['symbol_code'])? 'class="error"' : '');

        $primary = q("
            SELECT `id`
            FROM  `products`
            WHERE `symbol_code` = '".mres($_POST['symbol_code'])."'
            LIMIT 1
        ");

        if($primary->num_rows > 0){
            $check['symbol_code'] = 'class="error"';
        }

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            q(" INSERT INTO `products` SET
                `name_ua`      = '".$_POST['name_ua']."',
                `name_ru`      = '".$_POST['name_ru']."',
                `symbol_code`  = '".$_POST['symbol_code']."',
                `sort`         = ".(int)$_POST['sort'].",
                `user_custom`  = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."',
                `data_create`  = NOW()
            ");

            sessionInfo('/admin/products/', $messG['Елемент створено успішно!'], 1);
        }
    }
} elseif(isset($_REQUEST['edit'])) {
    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name_ua'] = (empty($_POST['name_ua'])? 'class="error"' : '');
        $check['name_ru'] = (empty($_POST['name_ru'])? 'class="error"' : '');
        $check['price'] = (empty($_POST['price'])? 'class="error"' : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            // More image
            $img_more = '';
            foreach($_POST['img_more'] as $k => $v){
                if(!empty($v)){
                    $img_more .= $v.'#';
                }
            }
            $img_more = trim($img_more, '#');

            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];
            $_POST['availability'] = !isset($_POST['availability'])? 0 : (int)$_POST['availability'];

            q(" UPDATE `products` SET
 			          `active`              = '".$_POST['active']."',
                `name_ua`             = '".$_POST['name_ua']."',
		            `name_ru`             = '".$_POST['name_ru']."',
		            `sort`                = '".(int)$_POST['sort']."',
		            `availability`        = '".(int)$_POST['availability']."',
		            `img_anons`           = '".$_POST['img_anons']."',
		            `img_circle`          = '".$_POST['img_circle']."',
		            `img_more`            = '".mres($img_more)."',
		            `price`               = '".(int)$_POST['price']."',
		            `size`                = '".(int)$_POST['size']."',
		            `anatoming`           = '".(int)$_POST['anatoming']."',
                `ortopeding`          = '".(int)$_POST['ortopeding']."',
		            `garanty`             = '".(int)$_POST['garanty']."',
		            `weight`              = '".(int)$_POST['weight']."',
			          `height`              = '".(int)$_POST['height']."',
		            `og_type`             = '".$_POST['og_type']."',
		            `og_url`              = '".$_POST['og_url']."',
		            `og_image`            = '".$_POST['og_image']."',
		            `meta_title_ua`       = '".$_POST['meta_title_ua']."',
		            `meta_keywords_ua`    = '".$_POST['meta_keywords_ua']."',
		            `meta_description_ua` = '".$_POST['meta_description_ua']."',
		            `meta_title_ru`       = '".$_POST['meta_title_ru']."',
		            `meta_keywords_ru`    = '".$_POST['meta_keywords_ru']."',
		            `meta_description_ru` = '".$_POST['meta_description_ru']."',
		            `description_ua`      = '".$_POST['description_ua']."',
			          `description_ru`      = '".$_POST['description_ru']."',
		            `text_ua`             = '".$_POST['text_ua']."',
			          `text_ru`             = '".$_POST['text_ru']."',
		            `form_ua`             = '".$_POST['form_ua']."',
		            `form_ru`             = '".$_POST['form_ru']."',
			          `type_ua`             = '".$_POST['type_ua']."',
			          `type_ru`             = '".$_POST['type_ru']."',
			          `rigidity_ua`		      = '".$_POST['rigidity_ua']."',
			          `rigidity_ru`	        = '".$_POST['rigidity_ru']."',
		            `img_seo_title_ua`    = '".$_POST['img_seo_title_ua']."',
 			          `img_seo_title_ru`    = '".$_POST['img_seo_title_ru']."',
                `img_seo_alt_ua`      = '".$_POST['img_seo_alt_ua']."',
 			          `img_seo_alt_ru`      = '".$_POST['img_seo_alt_ru']."',
 			          `user_custom`         = '".mres($_SESSION['user']['last_name'].' '.$_SESSION['user']['name'])."'
			          WHERE `id` = ".(int)$_REQUEST['edit']."
		        ");

            sessionInfo('/admin/products/', $messG['Редагування пройшло успішно!'], 1);
        }
    }

    $arResult = q("
        SELECT * 
        FROM `products`
        WHERE `id` = ".(int)$_REQUEST['edit']."
    ");

    if($arResult->num_rows == 0){
        sessionInfo('/admin/products/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = hsc($arResult->fetch_assoc());
    }
} else {
    if(isset($_POST['arr']) && count($_POST['arr']) > 0){ // Dynamic edit
        DynamicEditMenu::edit($_POST['arr'], 'products', '/admin/products/', $messG['Редагування пройшло успішно!']);
    }

    if(isset($_REQUEST['del'])){ // Delete one
        deleteElement($_REQUEST['del'], 'products', '/admin/products/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['delete']) && isset($_POST['ids'])){ // Delete ids
        deleteElement(implode(',', $_POST['ids']), 'products', '/admin/products/', $messG['Видалення пройшло успішно!']);
    }

    if(isset($_POST['deactivate']) && isset($_POST['ids'])){ // Deactivate
        deactivateElement(implode(',', $_POST['ids']), 'products');
        sessionInfo('/admin/products/', $messG['Деактивація пройшла успішно!'], 1);
    }

    if(isset($_POST['activate']) && isset($_POST['ids'])){ // Activate
        activeElement(implode(',', $_POST['ids']), 'products');
        sessionInfo('/admin/products/', $messG['Активація пройшла успішно!'], 1);
    }

    // Filter
    if(isset($_REQUEST['filterReset'])){
        unset($_SESSION['ADM_filter']['products']);
        header('Location: /admin/products/');
    }

    $_SESSION['ADM_filter']['products'] = (isset($_POST['filter'])? $_POST['filter'] : (isset($_SESSION['ADM_filter']['products'])? $_SESSION['ADM_filter']['products'] : ''));
    $htmlFilter = AdminFilter::htmlFormation('products', $arMainParam['length_admin'], $_SESSION['ADM_filter']['products']);
    $filter = (!empty($_SESSION['ADM_filter']['products'])? AdminFilter::filter($_SESSION['ADM_filter']['products'], 'products') : '');

    // Pagination
    $products = Pagination::formNav(array(
        'numPage'     => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'count_show'  => 5,
        'records_el'  => $adminParam['records_pagination'],
        'url'         => "/admin/products/",
        'db_table'    => "products",
        'css_class'   => "pagination-admin",
        'filter'      => $filter,
        'sort'        => '`sort` DESC, ',
        'notFound404' => 'N',
        'lang'        => '',
        'link_lang'   => '',
    ));
}