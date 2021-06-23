<?php

class Route {
    static function start() {
        $controller_name = "products";
        $action_name = "index";
        $routes = explode('/', explode('?', $_SERVER["REQUEST_URI"])[0]);

        if (!empty($routes[1])) {
            $controller_name = $routes[1];
        }
        if (!empty($routes[2])) {
            $action_name = $routes[2];
        }

        $model_name = "model_" . $controller_name;
        $controller_class = "Controller" . $controller_name;
        $controller_name = "controller_" . $controller_name;
        $action_name = "action_" . $action_name;

        $model_file = strtolower($model_name) . ".php";
        $model_path = __DIR__ . "/../models/" . $model_file;
        if (file_exists($model_path)) {
            include $model_path;
        }

        $controller_file = strtolower($controller_name) . ".php";
        $controller_path = __DIR__ . "/../controllers/" . $controller_file;
        if (file_exists($controller_path)) {
            include $controller_path;
        } else {
            Route::page404();
        }

        $controller = new $controller_class;
        if (method_exists($controller, $action_name)) {
            if (isset($routes[3])) {
                $controller->$action_name($routes[3]);
            } else {
                $controller->$action_name();
            }
        }
    }

    static function page404() {
        $host = 'http://' . $_SERVER['HTTP_HOST'] . '/';
        header('HTTP/1.1 404 Not Found');
        header("Status: 404 Not Found");
        header('Location:' . $host . '404');
    }
}