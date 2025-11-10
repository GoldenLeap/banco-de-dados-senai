<?php

function homeController(){
    ob_start();
    require_once "views/homeView.php";
    $conteudo = ob_get_clean();
    $titulo = "Pagina inicial";
    require_once("views/template/base.php");
}