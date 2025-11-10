<?php
function autoload($file)
{
    include __DIR__ . '\models/' . $file . ".php";
}
spl_autoload_register('autoload');

require_once "./controllers/homeController.php";
require_once "./controllers/servicoController.php";

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

switch ($uri) {
    case '/':
        homeController();
        break;
    case "/servicos":
        servicoController();
        break;
    default:
        echo "Bla";
        break;
}
