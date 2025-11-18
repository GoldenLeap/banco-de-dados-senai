
<div class="">
    <h1>Lista de Clientes</h1>
    <table border="1" cellpadding="10" cellspacing="0" width="100%">
        <thead>
            <tr style="background-color: #f2f2f2;">
                <th>ID</th>
                <th>Nome</th>
                <th>CPF</th>
                <th>Telefone</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($clientes as $cliente): ?>
                <tr>
                    <td><?=$cliente['ID_Cliente'] ?></td>
                    <td><?=$cliente['Nome_cliente'] ?></td>
                    <td><?=$cliente['CPF'] ?></td>
                    <td><?=$cliente['Telefone'] ?></td>
                    <td>
                        <a href="/clientes?action=edit&id=<?= $cliente['ID_Cliente'] ?>">Editar</a> |
                        <a href="/clientes?action=delete&id=<?= $cliente['ID_Cliente'] ?>" 
                           onclick="return confirm('Tem certeza que deseja excluir?')">Deletar</a>
                    </td>
                </tr>
            <?php endforeach; ?>

        
            <tr style="background-color: #f9f9f9;">
                <td><em>novo</em></td>
                <form action="/clientes?action=add" method="post" style="display: contents;">
                    <td><input type="text" name="nome_cliente" required placeholder="Nome completo"></td>
                    <td><input type="text" name="cpf" required placeholder="000.000.000-00" maxlength="14"></td>
                    <td><input type="text" name="telefone" placeholder="(00) 00000-0000"></td>
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
    <h2>Editar Cliente</h2>

    <form action="/clientes?action=editPost" method="post">
        <input type="hidden" name="id" value="<?=$_GET['id']?>">

        <label>ID:</label><br>
        <input type="text" value="<?=$_GET['id']?>" disabled style="margin-bottom:10px;"><br>

        <label>Nome:</label><br>
        <input type="text" name="nome_cliente" value="<?=$clienteEdit['Nome_cliente']?>" required style="width:100%;padding:8px;margin-bottom:10px;"><br>

        <label>CPF:</label><br>
        <input type="text" name="cpf" value="<?=$clienteEdit['CPF'] ?>" readonly style="width:100%;padding:8px;margin-bottom:10px;"><br>

        <label>Telefone:</label><br>
        <input type="text" name="telefone" value="<?=$clienteEdit['Telefone'] ?>" style="width:100%;padding:8px;margin-bottom:10px;"><br>

        <button type="submit" style="background:#0066cc;color:white;padding:10px 20px;border:none;cursor:pointer;">
            Salvar Alterações
        </button>
        <a href="/clientes" style="margin-left:10px;padding:10px 20px;background:#aaa;color:white;text-decoration:none;">
            Cancelar
        </a>
    </form>
</div>
<?php endif; ?>