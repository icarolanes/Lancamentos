<?php
include_once('../../conexao.php');
function retorna($cnpj,$con){
	$query_em = ("SELECT * from empresas where xCNPJ = ".$cnpj);
	$prep = $con->prepare($query_em);
	$prep->execute();
	$contar = $prep->rowCount();
	if ($contar > 0) {
		$retorno = true;
		return json_encode($retorno);
	}else{
		$retorno = false;
		return json_encode($retorno);
	}
}
if(isset($_GET['cnpj'])){
 retorna($_GET['cnpj'],$con);
}
?>