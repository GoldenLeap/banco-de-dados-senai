<?php
require_once("connectDB.php");

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM usuario WHERE id_usuario = $id");
$row = $result->fetch_assoc();

?>

<form action="atualizar.php" method="POST">
    ID: 
    <input type="text" name="id" value="<?= $row['id_usuario'];?>"> <br> 
    Nome: 
    <input type="text" name="nome" value="<?= $row['nome'];?>"> <br>
    Email: 
    <input type="date" name="data_nascimento" value="<?=$row['data_nascimento'];?>"><br> 
    <input type="submit" value="Atualizar">
</form>