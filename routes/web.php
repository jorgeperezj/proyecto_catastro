<?php

use App\Controllers\AuthController;
use App\Controllers\DashboardController;

$router->map('GET', '/', [AuthController::class, 'loginForm'], 'login');
$router->map('POST', '/login', [AuthController::class, 'login'], 'login_post');
$router->map('GET', '/register', [AuthController::class, 'registerForm'], 'register');
$router->map('POST', '/register', [AuthController::class, 'register'], 'register_post');

$router->map('GET', '/dashboard', [DashboardController::class, 'index'], 'dashboard');

$router->map('GET', '/logout', [AuthController::class, 'logout'], 'logout');
