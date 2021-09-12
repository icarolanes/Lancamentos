<?php
include_once('../../conexao.php');
function retorna($cnpj,$con){
	$query_em = ("SELECT * from empresas where xCNPJ = ".$cnpj);
	$prep = $con->prepare($query_em);
	$prep->execute();
	$contar = $prep->rowCount();
	$linha = $prep ->fetch();
	if ($contar > 0) {
		$retorno['id'] = $linha['id'];
		$retorno['cnpj'] = $linha['xCNPJ'];
		$retorno['razao'] = $linha['xNome'];
		$retorno['fantasia'] = $linha['fantasia'];
		$retorno['situacao'] = true;
	}else{
		$retorno['situacao'] = false;
	}
		return json_encode($retorno);
}
if(isset($_GET['cnpj'])){
 echo retorna($_GET['cnpj'],$con);
}
?>