<?php
session_start();
include('../../conexao.php');
//include('banco/seguranca.php');
function consultar_cep($cep,$con){
	$query_cep = "SELECT * FROM lista_cep WHERE cep = ".$cep['cep']." LIMIT 1";
	$prep_cep = $con->prepare($query_cep);
	$prep_cep->execute();
	$cont_cep = $prep_cep->rowCount();
	if ($cont_cep>0) {
		$val = $prep_cep->fetch();
		return($val['id']);
	}else{
		cadastra_cep($cep,$con);
	}
}
function cadastra_cep($cep,$con){
	$cepn = $cep['cep'];
	$uf = $cep['uf'];
	$cidade = $cep['cidade'];
	$bairro = $cep['bairro'];
	$rua = $cep['logradouro'];
	$query_cep = "INSERT into lista_cep (`cep`,`estado`,`cidade`,`bairro`,`rua`)
	VALUES (
	'$cepn',
	'$uf',
	'$cidade',
	'$bairro',
	'$rua')";
	$prepare_env_cep = $con->prepare($query_cep);
	$prepare_env_cep ->execute();
	$contar = $prepare_env_cep->rowCount();
	if ($contar>0) {
		return(true);
	}else{
		return(false);
	}
}
/*
  "cnpj": "92660604000182",
*/
  $cep['cep']                       = $_POST['cep'];
  $cep['desclog'] 					= $_POST['desclog'];
  $cep['logradouro']                = $_POST['logradouro'];
  $cep['bairro']                    = $_POST['bairro'];
  $cep['cidade']                 = $_POST['cidade'];
  $cep['uf']                        = $_POST['uf'];
  /*primeiro, verifica se cep já cadastrado*/
  $razao_social  = $_POST['razao'];
  $nome_fantasia = $_POST['fantasia'];
  $cnpj          = preg_replace("/[^0-9]/", "", $_POST['cnpj_cad']); 
  $cep = consultar_cep($cep,$con);
  $query = "INSERT INTO `empresas`(`xCNPJ`, `xNome`, `fantasia`,`cep`) 
  VALUES ('$cnpj','$razao_social','$nome_fantasia','$cep')";
  $prepare = $con->prepare($query);
  $prepare->execute();
  $contar = $prepare ->rowCount();
  if ($contar>0) {
  	
  	$_SESSION['mensagem'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
  	<strong>Cadastrado</strong>
  	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  	</div>';
  }else{
  	$_SESSION['mensagem'] = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
  	<strong>Holy guacamole!</strong> You should check in on some of those fields below.
  	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  	</div>';
  }
?>