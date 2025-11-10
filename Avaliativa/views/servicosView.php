
<div class="container">
    <h1>Solicitar um Serviço</h1>
    <form action="enviar_solicitacao.php" method="post">
        <label for="nome_cliente">Seu nome:</label>
        <input type="text" id="nome_cliente" name="nome_cliente" required>

        <label for="carro_modelo">Modelo do carro:</label>
        <input type="text" id="carro_modelo" name="carro_modelo" required>

        <label for="carro_placa">Placa:</label>
        <input type="text" id="carro_placa" name="carro_placa" required>

        <label for="servico">Selecione os serviços:</label>
        <select id="servico" name="servico" required>
            <option value="">Selecione...</option>
            <?php foreach ($servicos as $servico):?>
                <option value="<?=$servico["ID_Servico"]?>"><?=$servico["Nome_Servico"]?></option>
            <?php endforeach;?>
        </select>

        <button type="submit">Enviar Solicitação</button>
    </form>
</div>
