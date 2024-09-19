<?php

namespace App\Controllers;

use Twig\Environment;
use Twig\Loader\FilesystemLoader;
use App\Middleware\AuthMiddleware;

class DashboardController
{
    protected $twig;

    public function __construct()
    {
        $loader = new FilesystemLoader('../app/views');
        $this->twig = new Environment($loader);
    }

    public function index()
    {
        AuthMiddleware::check();

        $message = 'Bienvenido al Dashboard';

        echo $this->twig->render('dashboard.twig', ['message' => $message]);
    }
}