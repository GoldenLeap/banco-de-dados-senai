<?php 
    function servicoController(){
        $servicos = Servicos::GetServicos();
        ob_start();
        require_once __DIR__."/../views/servicosView.php";
        $conteudo = ob_get_clean();
        require_once __DIR__."/../views/template/base.php";

    }