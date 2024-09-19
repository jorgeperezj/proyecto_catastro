<?php

// Cargar el autoload de Composer
require_once __DIR__ . '/../vendor/autoload.php';

// Cargar el archivo bootstrap que inicia la app y las configuraciones
require_once __DIR__ . '/../bootstrap.php';

// Crear la instancia de AltoRouter
$router = new AltoRouter();

// Definir la base URL (ajusta según tu estructura de URL)
$router->setBasePath('');

// Definir rutas
require_once __DIR__ . '/../routes/web.php';

// Coincidencia de ruta
$match = $router->match();

// Verificar si la ruta coincide
if ($match) {
    list($controller, $method) = $match['target'];

    // Verificar si el controlador y método son invocables
    if (is_callable([new $controller, $method])) {
        call_user_func_array([new $controller, $method], $match['params']);
    } else {
        echo 'Método no encontrado';
    }
} else {
    // Página no encontrada
    header($_SERVER["SERVER_PROTOCOL"] . ' 404 Not Found');
    echo 'Página no encontrada';
}
