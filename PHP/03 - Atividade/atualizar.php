<?php
require_once('connectDB.php');

$id = $_POST['id'];
$nome = $_POST['nome'];
$email = $_POST['data_nascimento'];

$sql = "UPDATE usuario SET nome='$nome', data_nascimento='$email' WHERE id_usuario=$id";

if($conn->query($sql) === TRUE){
    echo "Dados atualizados com sucesso!";
    echo "<br><a href='index.html'>Voltar</a>";
}else{
    echo "Erro: ". $conn->error;
}

$conn->close();
