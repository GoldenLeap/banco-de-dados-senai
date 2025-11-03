<?php
require_once("connectDB.php");
$result = $conn->query("SELECT * FROM usuarios");

echo "<h2>Usuarios</h2>";
echo "<table border='i'>";
echo "<tr><th>ID</th><th>Nome</th><th>Email</th><th>Ações</th></tr>";

while ($row = $result->fetch_assoc()){
    echo "<tr>
        <td>{$row['id_usuario']}</td>
        <td>{$row['nome']}</td>
        <td>{$row['email']}</td>
        <td><a href='editar.php?id={$row['id_usuario']}'>Editar</a> |
        <a href='delete.php?id={$row['id_usuario']}' onclick='return confirm(\"Deseja deletar o usuario?\")'>Deletar</a></td>
        
        </tr>";
}
echo "</table>";
$conn->close();
?>
<a href="index.html"><button type="button">Página Inicial</button></a>