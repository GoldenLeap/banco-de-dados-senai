<?php 
require_once(dirname(__FILE__) ."/connectDB.php");

$nome = $_POST['nome'];
$senha = $_POST['senha'];
$data_nascimento = $_POST['data_nascimento'];

$sql = "INSERT INTO usuario(nome, data_nascimento, senha) VALUES ('$nome', '$data_nascimento', '" . md5($senha) . "');";

if($conn->query($sql) === TRUE){
    echo "Dados salvos com sucesso!";
}else{
    echo "Erro: ". $conn->error;
}

$conn->close();
header("Location: index.html");
exit;