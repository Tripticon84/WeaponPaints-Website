<?php
define('SKIN_LANGUAGE', getenv('SKIN_LANGUAGE') ?: 'skins_en');

define('DB_HOST', getenv('DB_HOST') ?: 'localhost');
define('DB_PORT', getenv('DB_PORT') ?: '3306');
define('DB_NAME', getenv('DB_NAME') ?: '');
define('DB_USER', getenv('DB_USER') ?: '');
define('DB_PASS', getenv('DB_PASS') ?: '');

define('WEB_STYLE_DARK', getenv('WEB_STYLE_DARK') === 'false' ? false : true);

define('STEAM_API_KEY', getenv('STEAM_API_KEY') ?: '');
define('STEAM_DOMAIN_NAME', getenv('STEAM_DOMAIN_NAME') ?: '');
define('STEAM_LOGOUT_PAGE', getenv('STEAM_LOGOUT_PAGE') ?: '');
define('STEAM_LOGIN_PAGE', getenv('STEAM_LOGIN_PAGE') ?: '');
