<?php

function clientesController()
{

    $action = $_GET["action"] ?? "";
    $data   = [
        "clientes" => Cliente::getClientes(),
    ];
    switch ($action) {
        case "edit":
            $data["clienteEdit"] = edit();
            break;
        case "editPost":
            update();
            break;
        case "delete":
            Cliente::deleteCliente($_GET["id"]);
            header("location: /clientes");
            break;
        case "add":
            addClient();    
            break;
        default:
            $data[""] = "";
            break;
    }
    render("clientesView", "Lista de Clientes", $data);
}

function edit()
{
    $clientsEdit = Cliente::getClienteById($_GET["id"]);
    return $clientsEdit;
}
function update(){
    Cliente::setClienteName($_POST["id"],$_POST["nome_cliente"]);
    Cliente::setClienteTelefone($_POST["id"],$_POST["telefone"]);
    header("location: /clientes");
}
function addClient(){
    Cliente::addCliente($_POST['cpf'], $_POST['nome_cliente'], $_POST['telefone']);
    header('location: /clientes');
}