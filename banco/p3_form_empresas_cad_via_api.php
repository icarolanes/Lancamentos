<?php
session_start();
include('../../conexao.php');
include('banco/seguranca.php');


/*
$razao_social   = $_POST['razao_social'];
$nome_fantasia  = $_POST['nome_fantasia'];
$cnpj 			= $_POST['cnpj'];


$query = "INSERT INTO `empresas`(`xCNPJ`, `xNome`, `fantasia`) VALUES ('$cnpj','$razao_social','$nome_fantasia')";
$prepare = $con->prepare($query);
$prepare->execute();

$contar = $prepare ->rowCount();
*/

$_SESSION['mensagem'] = $_POST[];
?>