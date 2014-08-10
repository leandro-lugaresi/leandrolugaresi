<?php
/**
 * This makes our life easier when dealing with paths. Everything is relative
 * to the application root now.
 */
chdir(dirname(__DIR__));

// Decline static file requests back to the PHP built-in webserver
if (php_sapi_name() === 'cli-server' && is_file(__DIR__ . parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH))) {
    return false;
}

error_reporting(E_ALL /*^ E_NOTICE ^ E_DEPRECATED ^ E_STRICT*/);
date_default_timezone_set("America/Sao_Paulo");
setlocale(LC_TIME, 'pt_BR.UTF-8', 'Portuguese_Brazil.1252');

// Setup autoloading
require 'init_autoloader.php';

// Run the application!
Zend\Mvc\Application::init(require 'config/application.config.php')->run();
