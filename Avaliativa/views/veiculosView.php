
<div class="">
    <h1>Lista de Veiculos</h1>
    <table border="1" cellpadding="10" cellspacing="0" width="100%">
        <thead>
            <tr style="background-color: #f2f2f2;">
            <th></th>    
            <th>Placa do Veiculo</th>
                <th>Modelo</th>
                <th>Marca</th>
                <th>ID do Cliente - Nome</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($veiculos as $veiculo): ?>
                <tr>
                    <td></td>
                    <td><?=$veiculo['Placa_veiculo'] ?></td>
                    <td><?=$veiculo['Modelo'] ?></td>
                    <td><?=$veiculo['Marca'] ?></td>
                    <td><?=$veiculo['ID_Cliente']. " - ". Cliente::getClienteById($veiculo["ID_Cliente"])['Nome_cliente']; ?></td>
                    <td>
                        <a href="/veiculos?action=edit&id=<?= $veiculo['Placa_veiculo'] ?>">Editar</a> |
                        <a href="/veiculos?action=delete&id=<?= $veiculo['Placa_veiculo'] ?>" 
                           onclick="return confirm('Tem certeza que deseja excluir?')">Deletar</a>
                    </td>
                </tr>
            <?php endforeach; ?>

        
            <tr style="background-color: #f9f9f9;">
                <td><em>novo</em></td>
                <form action="/veiculos?action=add" method="post" style="display: contents;">
                    <td><input type="text" name='placa_veiculo' required placeholder="Numero da placa"></td>
                    <td><input type="text" name="modelo" required></td>
                    <td><input type="text" name="marca"></td>
                    <td><select name="id_cliente" id="" required>
                        <?php foreach($clientes as $cliente):?>
                            <option value="<?= $cliente["ID_Cliente"]?>"><?= $cliente["ID_Cliente"] ?> - <?= $cliente['Nome_cliente'] ?></option>
                        <?php endforeach;?>
                    </select></td>
                    <td>
                        <button type="submit" style="background:green;color:white;padding:5px 10px;border:none;cursor:pointer;">
                            Adicionar
                        </button>
                    </td>
                </form>
            </tr>
        </tbody>
    </table>
</div>

<?php if (isset($_GET['action']) && $_GET['action'] === 'edit' && isset($_GET['id'])): ?>
<div style="margin-top: 30px; padding: 20px; border: 1px solid #ccc; background: #f8f8f8;">
    <h2>Editar veiculo</h2>

    <form action="/veiculos?action=editPost" method="post">
        <input type="hidden" name="id" value="<?=$_GET['id']?>">

        <label>ID:</label><br>
        <input type="text" value="<?=$_GET['id']?>" disabled style="margin-bottom:10px;"><br>

        <label>Nome:</label><br>
        <input type="text" name="nome_veiculo" value="<?=$veiculoEdit['Nome_veiculo']?>" required style="width:100%;padding:8px;margin-bottom:10px;"><br>

        <label>CPF:</label><br>
        <input type="text" name="cpf" value="<?=$veiculoEdit['CPF'] ?>" readonly style="width:100%;padding:8px;margin-bottom:10px;"><br>

        <label>Telefone:</label><br>
        <input type="text" name="telefone" value="<?=$veiculoEdit['Telefone'] ?>" style="width:100%;padding:8px;margin-bottom:10px;"><br>

        <button type="submit" style="background:#0066cc;color:white;padding:10px 20px;border:none;cursor:pointer;">
            Salvar Alterações
        </button>
        <a href="/veiculos" style="margin-left:10px;padding:10px 20px;background:#aaa;color:white;text-decoration:none;">
            Cancelar
        </a>
    </form>
</div>
<?php endif; ?>