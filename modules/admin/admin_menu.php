<?php
$admin_menu = array(
    'ua' => array(
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
                    'Відгуки'            => '/admin/comments/',
                    'Зворотній зв\'язок' => '/admin/comments/call-me/',
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
                'Переклад сайту'      => array(
                    'Переклад слів' => '/admin/setting/lang-words/',
                ),
                'Таблиці баз даних'   => array(
                    'Експорт' => '/admin/setting/export-db/',
                ),
                'Контроль PHP'        => array(
                    'PhpInfo' => '/admin/setting/php-info/',
                ),
            )
        ),
    ),

    'ru' => array(
        0 => array(
            'name'     => 'Слайды',
            'icon'     => 'window',
            'sections' => array(
                'Слайды' => array(
                    'Главный баннер' => '/admin/setting/main-banner/',
                ),
            )
        ),
        1 => array(
            'name'     => 'Контент',
            'icon'     => 'content',
            'sections' => array(
                'Товары' => array(
                    'Детские матрасы' => '/admin/products/',
                ),
            )
        ),
        2 => array(
            'name'     => 'Связь',
            'icon'     => 'form',
            'sections' => array(
                'Операции' => array(
                    'Отзывы'         => '/admin/comments/',
                    'Обратная связь' => '/admin/comments/call-me/',
                ),
            )
        ),
        3 => array(
            'name'     => 'Магазин',
            'icon'     => 'shopping-bag',
            'sections' => array(
                'Магазин'             => array(
                    'Заказ'           => '/admin/order/',
                    'Службы доставки' => '/admin/order/delivery-service/',
                    'Вид оплаты'      => '/admin/order/payment-type/',
                ),
                'Права собственности' => array(
                    'Сертификаты' => '/admin/setting/policy-certification/',
                ),
            )
        ),
        4 => array(
            'name'     => 'Настройки',
            'icon'     => 'settings',
            'sections' => array(
                'Модули'                => array(
                    'Главный модуль' => '/admin/setting/main-module/',
                    'Модули'         => '/admin/setting/modules-pages/',
                ),
                'Пользователи'          => array(
                    'Список'         => '/admin/setting/user-list/',
                    'Создать нового' => '/admin/setting/user-list/?add=ok',
                ),
                'Почтовые события'      => array(
                    'Тип шаблона'     => '/admin/setting/type-mails/',
                    'Настройка писем' => '/admin/setting/setting-mails/',
                    'Просмотр писем'  => '/admin/setting/view-mails/',
                ),
                'Резервное копирование' => array(
                    'Запуск Backup'    => '/admin/setting/backup/',
                    'Настройка Backup' => '/admin/setting/backup-setting/',
                ),
                'Кэш файлов'            => array(
                    'Обновления кэша' => '/admin/setting/update-files/',
                ),
                'Интерфейс'             => array(
                    'Персональные настройки' => '/admin/setting/personal-interface/',
                    'Настройки сайта'        => '/admin/setting/site-interface/',
                ),
                'Перевод сайта'         => array(
                    'Перевод слов' => '/admin/setting/lang-words/',
                ),
                'Таблицы баз данных'    => array(
                    'Экспорт' => '/admin/setting/export-db/',
                ),
                'Контроль PHP'          => array(
                    'PhpInfo' => '/admin/setting/php-info/',
                ),
            )
        ),
    ),

    'en' => array(
        0 => array(
            'name'     => 'Slides',
            'icon'     => 'window',
            'sections' => array(
                'Slides' => array(
                    'Main banner' => '/admin/setting/main-banner/',
                ),
            )
        ),
        1 => array(
            'name'     => 'Content',
            'icon'     => 'content',
            'sections' => array(
                'Items' => array(
                    'Childrens mattresses' => '/admin/products/',
                ),
            )
        ),
        2 => array(
            'name'     => 'Communication',
            'icon'     => 'form',
            'sections' => array(
                'Operations' => array(
                    'Reviews'  => '/admin/comments/',
                    'Feedback' => '/admin/comments/call-me/',
                ),
            )
        ),
        3 => array(
            'name'     => 'Shop',
            'icon'     => 'shopping-bag',
            'sections' => array(
                'Shop'      => array(
                    'Order'             => '/admin/order/',
                    'Delivery services' => '/admin/order/delivery-service/',
                    'Payment type'      => '/admin/order/payment-type/',
                ),
                'Ownership' => array(
                    'Certifications' => '/admin/setting/policy-certification/',
                ),
            )
        ),
        4 => array(
            'name'     => 'Settings',
            'icon'     => 'settings',
            'sections' => array(
                'Modules'          => array(
                    'Main module' => '/admin/setting/main-module/',
                    'Modules'     => '/admin/setting/modules-pages/',
                ),
                'Users'            => array(
                    'List'            => '/admin/setting/user-list/',
                    'Create new user' => '/admin/setting/user-list/?add=ok',
                ),
                'Post events'      => array(
                    'Template type'   => '/admin/setting/type-mails/',
                    'Mail setting'    => '/admin/setting/setting-mails/',
                    'Letters preview' => '/admin/setting/view-mails/',
                ),
                'Backup'           => array(
                    'Start Backup'   => '/admin/setting/backup/',
                    'Setting Backup' => '/admin/setting/backup-setting/',
                ),
                'File cache'       => array(
                    'Cache updates' => '/admin/setting/update-files/',
                ),
                'Interface'        => array(
                    'Personal settings' => '/admin/setting/personal-interface/',
                    'Site settings'     => '/admin/setting/site-interface/',
                ),
                'Translation site' => array(
                    'Words translation' => '/admin/setting/lang-words/',
                ),
                'Database Tables'  => array(
                    'Export' => '/admin/setting/export-db/',
                ),
                'Control PHP'      => array(
                    'PhpInfo' => '/admin/setting/php-info/',
                ),
            )
        ),
    ),
);