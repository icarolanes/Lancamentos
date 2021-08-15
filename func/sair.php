<?php
session_start();
session_destroy();
//remove todas as informacoes das variaveis globais
	unset(
$_SESSION['usuarioId'],			
$_SESSION['usuarioNome'],		
$_SESSION['usuarioNivelAcesso'],
$_SESSION['usuarioLogin'], 		
$_SESSION['usuarioSenha']);
	


//retorna ao portal publico
header("location: ../index.php");

?>
