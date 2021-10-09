<?php
    include_once('../../conexao.php');
    function retorna($con)
    {
        $queryATR = "call lista_operacao(1)";
        $prepara = $con->prepare($queryATR);
        $prepara->execute();
        $contar = $prepara->rowCount();
        while ($linha = $prepara->fetch(PDO::FETCH_ASSOC)) {
            $linhas[] = $linha;
        }
    $prepara->closeCursor();
    return json_encode($linhas);
    }
echo retorna($con);