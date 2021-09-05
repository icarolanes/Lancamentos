<?php
include('seguranca.php');
include('conexao.php');
echo "<br>".$atr 				= $_POST['atr'];
echo "<br>".$responsavel 		= $_POST['responsavel'];
echo "<br>".$peri 				= $_POST['peri'];
echo "<br>".$data_ref			= $_POST['data_ref'];



$query_con = "SELECT * FROM `periodos_operacao` WHERE `data_ref` = '".$data_ref."' AND `periodo` = ".$peri." ";
$prepare = $con->prepare($query_con);
$prepare->execute();

$contar_per = $prepare ->rowCount();
if ($contar_per>0) {

	$_SESSION['mensagem'] = ('<div class="alert alert-warning alert-dismissible fade show" role="alert">
		<strong>Erro</strong> Periodo já cadastrado!
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>');

	header("Location: ".$_SERVER['HTTP_REFERER']);
	
}else{

	$query = "INSERT INTO `periodos_operacao`(`data_ref`, `responsavel`, `periodo`, `atracacao`) VALUES ('$data_ref','$responsavel ','$peri','$atr')";
	$prepare = $con->prepare($query);
	$prepare->execute();

	$contar_per = $prepare ->rowCount();
	if ($contar_per>0) {

		$_SESSION['mensagem'] = ('<div class="alert alert-success alert-dismissible fade show" role="alert">
			<strong>Sucesso</strong> Periodo Novo cadastrado!
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>');

		header("Location: ".$_SERVER['HTTP_REFERER']);

	}


}






?>