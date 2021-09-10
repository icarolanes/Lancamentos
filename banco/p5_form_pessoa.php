<?php
session_start();
include('../../conexao.php');
include('banco/seguranca.php');
$nome = $_POST['nome'];
$sobrenome = $_POST['sobrenome'];
$cpf_formatado = $_POST['cpf'];
$cpf = preg_replace('/[^0-9]/', '', $cpf_formatado);


$query = "INSERT INTO `pessoa` (`nome`,`sobrenome`,`cpf`) VALUES ('$nome','$sobrenome','$cpf')";
$prepare = $con->prepare($query);
$prepare->execute();

$contar = $prepare->rowCount();
if ($contar>0) {
	$_SESSION['mensage'] = 'Cadastrado';
}else{
	$_SESSION['mensage'] = 'Não cadastrado';
}

?>