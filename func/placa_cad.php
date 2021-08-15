<?php
//função descontinuada.
//ação foi transferida para formulario main 14.


//include('conexao.php');

session_start();
$placa 	= 	$_POST['placa'];
$tipo 	= 	$_POST['tipo'];
$page 	=	$_POST['pagina'];



$query_insert_placa = "INSERT INTO `placas`( `placa`, `tipo`) VALUES ('".$placa."','".$tipo."')";
$preparar = $con->prepare($query_insert_placa);
$preparar->execute();

$contar_placa = $preparar ->rowCount();

if ($contar_placa>0) {

	$_SESSION['mensagem'] = ('<div class="alert alert-success alert-dismissible fade show" role="alert">
		<strong>Sucesso</strong> Placa cadastrada!
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>');

	header("Location: ".$page);
	
}else{

	$_SESSION['mensagem'] = ('<div class="alert alert-warning alert-dismissible fade show" role="alert">
		<strong>ERRO!</strong> ocorreu algum erro, entre em contato com o suporte
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>');

}

header("Location: ".$page);



?>
