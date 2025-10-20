<?php
$nome = $_POST['nome'];
$nacionalidade = $_POST['nacionalidade'];
$data_nascimento = $_POST['data_nascimento'];

$conn = new mysqli('localhost', 'root', 'senaisp', 'livraria');

if($conn->connect_error){
    die("Erro de conexão". $conn->connect_error);
}

$sql = "INSERT INTO autores (nome_autor, nacionalidade, data_nascimento) VALUES ('$nome', '$nacionalidade', '$data_nascimento')";

if($conn->query($sql) === TRUE){
    echo "Dados salvos com sucesso!";
}else{
    echo "Erro: ". $conn->error;
}

$conn->close();
header("Location: index_2.html");
exit;
?>