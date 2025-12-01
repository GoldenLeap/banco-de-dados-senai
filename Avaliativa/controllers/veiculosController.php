<?php 
function veiculoController(){
    $data = [
        "veiculos" => Veiculo::getVeiculos() ?? '',
        "clientes" => Cliente::getClientes() ?? "",

    ];
    $act = $_GET["action"] ?? '';
    switch ($act){
        case 'add':
            $placa = $_POST['placa_veiculo'];
            $modelo = $_POST['modelo'];
            $marca = $_POST['marca'];
            $id_cliente = $_POST['id_cliente'];
            Veiculo::addVeiculo($placa, $modelo, $marca, $id_cliente);
            header('location: /veiculos');
            break;

    }
    render("veiculosView", "lista de veiculos", $data);
    
}