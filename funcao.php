<?php
/* Arquivo para gerar um JSON de informações de meu banco*/
include_once("banco/conexao.php");
function retorna($motorista,$con,$icaro){
	$query_mot = "SELECT * from pessoa where cpf = ".$_GET['cpf'];
	$resultado = $con->prepare($query_mot);
	$resultado->execute();
	$contar_lanc = $resultado ->rowCount();
	
	$linha=$resultado->fetch();
	if ($contar_lanc>0) {
		$valores['motorista'] = $linha['nome']." ".$linha['sobrenome'];
	}else{
		$valores['motorista'] = "";
	}
	return json_encode($valores);
}
if(isset($_GET['cpf'])){
	echo retorna($_GET['cpf'],$con,$icaro);
}
?>