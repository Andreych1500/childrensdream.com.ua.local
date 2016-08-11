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
                'Перевод сайта'        => array(
                    'Перевод слов' => '/admin/setting/lang-words/',
                ),
                'Таблицы баз данных'     => array(
                        'Экспорт' => '/admin/setting/export-db/',
                ),
                'Контроль PHP'          => array(
                    'PhpInfo' => '/admin/setting/php-info/',
                ),
            )
        ),
    ),

    'en' => array(),
);