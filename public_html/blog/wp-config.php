<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define('DB_NAME', 'admin_sgblog');

/** Имя пользователя MySQL */
define('DB_USER', 'admin_sgblog');

/** Пароль к базе данных MySQL */
define('DB_PASSWORD', 'fC!BZUaJ~v-~');

/** Имя сервера MySQL */
define('DB_HOST', 'localhost');

/** Кодировка базы данных для создания таблиц. */
define('DB_CHARSET', 'utf8');

/** Схема сопоставления. Не меняйте, если не уверены. */
define('DB_COLLATE', '');

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'QfM.NUr|>w,I5{YN7x|WCDIV64`<M[(NL1a~/~a%4y~>[fV[4|qJ!(KB:Ji`TLMz');
define('SECURE_AUTH_KEY',  '!;-CYX3p$l_RC,8u>p_xhqwtCs*KXa-5]}ua]-|7vUN(K3B1i*.b+nP(mfk[8TcJ');
define('LOGGED_IN_KEY',    '^W`c#?p~0n9!8g}7f.]^l<Nha_-q+5yYU>bdhl+zEtMZ3,.0|K];(mTKubtUWJy<');
define('NONCE_KEY',        'M,bHgl,QI6JF.<=C, Aj-G&ualowA*JRj3}-+R{[Y]8AvYTME!U2+$dmO!Hz>;YE');
define('AUTH_SALT',        'dC=_!BL:}XoZFK,!i(P8ux}FY6<%BQo4s0!3p#B(f=O[BUl>+gNtyz9VUrSs^H9d');
define('SECURE_AUTH_SALT', '~M^]PE|9t=Jejg5cPs~VBqNBg`GdPVE1$IJ7{I*s_98Kc|w-n9X49y,9l?2K^u-i');
define('LOGGED_IN_SALT',   '>tn1t#=^KtSI l`+]9b.N*O_dhr7b2a%{*_4/*. z1Bg^o7F%Fpen#_-|-dUZ3i:');
define('NONCE_SALT',       'dA|+0FU&c`q}U|EqI W6{-<9GABPVF!8gR@-sfbB8fGoVX|La-3|zSOzr0ay}C(}');

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix  = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 * 
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Инициализирует переменные WordPress и подключает файлы. */
require_once(ABSPATH . 'wp-settings.php');
