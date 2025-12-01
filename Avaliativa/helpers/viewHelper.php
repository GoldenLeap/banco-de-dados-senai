<?php 
    function render($view, $title, $data=null){
        if($data !== null) extract($data);
        $titulo = $title;
        ob_start();
        require_once "views/$view.php";
        $conteudo = ob_get_clean();
        require_once "views/template/base.php";
    }
    function import_models(){
        require_once 'models/Connect.php';
        require_once 'models/Servicos.php';
        require_once 'models/Clientes.php';
        require_once 'models/Veiculo.php';
    }
    function import_controllers(){
        require_once 'controllers/estoqueController.php';
        require_once 'controllers/homeController.php';
        require_once 'controllers/clientesController.php';
        require_once 'controllers/servicoController.php';
        require_once 'controllers/veiculosController.php';
    }