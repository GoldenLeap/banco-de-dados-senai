<?php 
    require_once "./connectDB.php";
    $id = $_GET['id'];
    $stmt = $conn->prepare("DELETE FROM usuarios WHERE id_usuario = ? ");
    $stmt->bind_param("i", $id);

    if($stmt->execute()){
        echo "Usuario deletado com sucesso";
    }else{
        echo "Erro ao deletar: " . $stmt->error;
    }
    echo "<br><a href='listar.php'>Voltar para a lista </a>";

    $stmt->close();
    $conn->close();
?>