<?php

$env = parse_ini_file("./config/.env");
// Dados do db
$host = $env["MYSQL_HOST"];
$username = $env["MYSQL_USER"];
$pass = $env["MYSQL_PASS"];
$database = $env["DATABASE"];

// conexão mysql
$mysqli = new mysqli($host, $username, $pass, $database);

// Nome das colunas da tabela
$columns = ['titulo', 'carga_horaria', 'descricao'];

// Trazer o conteudo caso exista informações e dados do BD
$column = isset($_GET['column']) && in_array($_GET['column'], $columns) ? $_GET['column'] : $columns[0];
// Ordem crescente ou decrescente 
$sort_order = isset($_GET['order']) && strtolower($_GET['order']) == 'desc' ? 'DESC' : 'ASC';

$query = "SELECT * FROM Cursos ORDER BY $column $sort_order";

$result = $mysqli->query($query);
if ($result) {
    // Variaveis para a estrutura da tabela
    $upDown = str_replace(['ASC', 'DESC'], ['up', 'down'], $sort_order);
    $ascDesc = $sort_order == 'ASC' ? 'desc' : 'asc';
    $add_class = ' class=highlight';
?>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Banco de dados - Livraria</title>
        <style>
            html {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                padding: 10px;
            }

            table {
                border-collapse: collapse;
                width: 500px;
            }

            th {
                background-color: #54585d;
                border: 1px solid #54585d;
            }

            th:hover {
                background-color: #64686e;
            }

            th a {
                display: block;
                text-decoration: none;
                padding: 10px;
                font-weight: bolder;
                font-size: 16px;
            }

            th a i {
                margin-left: 5px;
                color: #ffffff1f;
            }

            td {
                padding: 10px;
                color: #636363;
                border: 1px solid #dddfe1;
            }

            tr {
                background-color: #fff;
            }

            tr .highlight {
                background-color: #f9fafb;
            }
        </style>
    </head>

    <body>
        <table>
            <tr>
                <th><a href="index.php?column=titulo&order=<?php echo $ascDesc; ?>">Titulo<i class="fas fa-sort<?php echo $column == "titulo" ? '-' . $upDown : ''; ?>"></i></a></th>
                <th><a href="index.php?column=carga_horaria&order=<?php echo $ascDesc; ?>">Carga Horaria<i class="fas fa-sort<?php echo $column == "carga_horaria" ? '-' . $upDown : ''; ?>"></i></a></th>
                <th><a href="index.php?column=descricao&order=<?php echo $ascDesc; ?>">Descrição<i class="fas fa-sort<?php echo $column == "descricao" ? '-' . $upDown : ''; ?>"></i></a></th>
            </tr>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td<?php echo $column == 'titulo' ? $add_class : ''; ?>><?php echo $row["titulo"] ?></td>
                        <td<?php echo $column == 'carga_horaria' ? $add_class : ''; ?>><?php echo $row["carga_horaria"] ?> Horas</td>
                            <td<?php echo $column == 'descricao' ? $add_class : ''; ?>><?php echo $row["descricao"] ?></td>
                </tr>
            <?php endwhile; ?>
        </table>
        <script src="https://kit.fontawesome.com/9c07739d3a.js" crossorigin="anonymous"></script>
    </body>

    </html>
<?php
    $result->free();
}
?>