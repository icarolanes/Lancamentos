<?php
include_once('../../conexao.php');
function retorna($cnpj, $con)
{
    $query_em = ("call buscar_empresa('".$cnpj."')");
    $prep = $con->prepare($query_em);
    $prep->execute();
    $contar = $prep->rowCount();
    $linha = $prep ->fetch();
    if ($contar > 0) {
        $retorno['id']        = $linha['id'];
        $retorno['cnpj']      = $linha['xCNPJ'];
        $retorno['razao']     = $linha['xNome'];
        $retorno['fantasia']  = $linha['fantasia'];
        $retorno['cep']       = $linha['cep'];
        $retorno['estado']    = $linha['estado'];
        $retorno['cidade']    = $linha['cidade'];
        $retorno['bairro']    = $linha['bairro'];
        $retorno['rua']       = $linha['rua'];
        $retorno['situacao']  = true;
    } else {
        $retorno['situacao'] = false;
    }
    $prep->closeCursor();
    return json_encode($retorno);
}
if (isset($_GET['cnpj'])) {
    echo retorna($_GET['cnpj'], $con);
}
?>