<?php

require_once 'helpers/viewHelper.php';
import_models();
import_controllers();
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

switch ($uri) {
    case '/':
        homeController();
        break;
    case "/servicos":
        servicoController();
        break;
    case "/estoque":
        estoqueController();
        break;
    case "/clientes":
        clientesController();
        break;
    default:
        echo "Bla";
        break;
}
