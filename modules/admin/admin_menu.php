<?php
$admin_menu = array(
    0 => array(
        'name'     => 'Слайди',
        'icon'     => 'window',
        'sections' => array(
            'Слайди' => array(
                'Головний баннер' => '/admin/setting/main-banner/',
            ),
        )
    ),
    1 => array(
        'name'     => 'Контент',
        'icon'     => 'content',
        'sections' => array(
            'Товари' => array(
                'Дитячі матраци' => '/admin/products/',
            ),
        )
    ),
    2 => array(
        'name'     => 'Зв\'язок',
        'icon'     => 'form',
        'sections' => array(
            'Операції' => array(
                'Відгуки'          => '/admin/comments/',
                'Зворотній звязок' => '/admin/comments/call-me/',
            ),
        )
    ),
    3 => array(
        'name'     => 'Магазин',
        'icon'     => 'shopping-bag',
        'sections' => array(
            'Магазин'         => array(
                'Замовлення'      => '/admin/order/',
                'Служби доставки' => '/admin/order/delivery-service/',
                'Вид оплати'      => '/admin/order/payment-type/',
            ),
            'Права власності' => array(
                'Сертифікати' => '/admin/setting/policy-certification/',
            ),
        )
    ),
    4 => array(
        'name'     => 'Настройки',
        'icon'     => 'settings',
        'sections' => array(
            'Модулі'              => array(
                'Головний модуль' => '/admin/setting/main-module/',
                'Модулі'          => '/admin/setting/modules-pages/',
            ),
            'Користувачі'         => array(
                'Список'          => '/admin/setting/user-list/',
                'Створити нового' => '/admin/setting/user-list/?add=ok',
            ),
            'Почтові події'       => array(
                'Тип шаблону'      => '/admin/setting/type-mails/',
                'Настройка листів' => '/admin/setting/setting-mails/',
                'Перегляд листів'  => '/admin/setting/view-mails/',
            ),
            'Резервне копіювання' => array(
                'Запуск Backup'       => '/admin/setting/backup/',
                'Налаштування Backup' => '/admin/setting/backup-setting/',
            ),
            'Кеш файлів'          => array(
                'Поновлення кешу' => '/admin/setting/update-files/',
            ),
            'Інтерфейс'           => array(
                'Персональні настройки' => '/admin/setting/personal-interface/',
                'Настройки сайту'       => '/admin/setting/site-interface/',
            ),
            'Переклад сайту'          => array(
                'Переклад слів' => '/admin/setting/lang-words/',
            ),
            'Таблиці баз даних'        => array(
                'Експорт'   => '/admin/setting/export-db/',
            ),
            'Контроль PHP'        => array(
                'PhpInfo' => '/admin/setting/php-info/',
            ),
        )
    ),
);