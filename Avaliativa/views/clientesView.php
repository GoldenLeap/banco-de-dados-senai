<div class="">
    <h1>Lista de Clientes</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>CPF</th>
            <th>Telefone</th>
            <th>Ação</th>
        </tr>
            <?php foreach ($clientes as $cliente): ?>
                <tr>
                    <th><?php echo $cliente['ID_Cliente'] ?></th>
                    <th><?php echo $cliente['Nome_cliente'] ?></th>
                    <th><?php echo $cliente['CPF'] ?></th>
                    <th><?php echo $cliente['Telefone'] ?></th>
                    <th>
                        <a href="/clientes?action=edit&id=<?php echo $cliente['ID_Cliente'] ?>">Edit</a>
                        <a href="/clientes?action=delete&id=<?php echo $cliente['ID_Cliente'] ?>">Deletar</a>
                    </th>
                </tr>
            <?php endforeach; ?>
    </table>''
</div>
<div class=<?php echo (!isset($_GET['action']) ?'': $_GET['action'] == 'edit')? '' : 'hidden'?>>
<form action="?action=editPost" method="post">
    <h1>Editar Cliente</h1>
    <label for="">ID_Cliente</label>
    <input type="text" readonly name="id" id="" value='<?php echo $_GET["id"]?>'>
    <label for="nome_cliente">Nome Cliente</label>
    <input type="text" name="nome_cliente" value='<?php echo $clientsEdit["Nome_cliente"] ?>' id="">
    <label for="cpf">CPF</label>
    <input type="text" name="cpf" readonly value='<?php echo $clientsEdit["CPF"]?>' id="">
    <label for="Telefone">Telefone</label>
    <input type="text" name="telefone" value='<?php echo $clientsEdit["Telefone"]?>' id="">
    <button type="submit">Editar</button>
</form>
</div>