<?php
include_once('../../conexao.php');
function retorna($cnpj,$con){
	$query_em = ("SELECT emp.id as id, emp.xCNPJ, emp.xNome, emp.fantasia, cep.cep, cep.estado,cep.cidade,cep.bairro,cep.rua FROM `empresas` emp left join `lista_cep` cep on cep.id = emp.cep where xCNPJ = ".$cnpj);
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
	}else{
		$retorno['situacao'] = false;
	}
		return json_encode($retorno);
}
if(isset($_GET['cnpj'])){
 echo retorna($_GET['cnpj'],$con);
}
?>