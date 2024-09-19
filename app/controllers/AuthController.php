<?php

namespace App\Controllers;

use App\Models\User;
use Twig\Environment;
use Twig\Loader\FilesystemLoader;

class AuthController
{
    protected $twig;

    public function __construct()
    {
        $loader = new FilesystemLoader('../app/views');
        $this->twig = new Environment($loader);
    }

    public function loginForm()
    {
        echo $this->twig->render(name: 'login.twig');
    }

    public function login()
    {
        $email = $_POST['email'];
        $password = $_POST['password'];

        $user = User::where('email', $email)->first();

        if ($user && password_verify($password, $user->password)) {
            session_start();
            $_SESSION['user_id'] = $user->id;
            header('Location: /dashboard');
        } else {
            echo $this->twig->render('login.twig', ['error' => 'Credenciales incorrectas']);
        }
    }

    public function logout()
    {
        session_start();

        $_SESSION = [];

        if (ini_get('session.use_cookies')) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                $params['path'], $params['domain'],
                $params['secure'], $params['httponly']
            );
        }

        session_destroy();

        header('Location: /');
        exit();
    }

    public function registerForm()
    {
        echo $this->twig->render('register.twig');
    }

    public function register()
    {
        $user = new User();
        $user->email = $_POST['email'];
        $user->password = password_hash($_POST['password'], PASSWORD_BCRYPT);
        $user->save();

        session_start();
        $_SESSION['user_id'] = $user->id;
        header('Location: /dashboard');
    }

    public function requisitos()
    {
        echo "Hola, mundo!";
    }
}
