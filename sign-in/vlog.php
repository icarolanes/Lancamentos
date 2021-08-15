<?php
session_start();
$usuariot = $_POST['usuario'];
$senhat = base64_encode($_POST['senha']);

include('../func/conexao.php');


$queryu = "SELECT u.id as id, u.usuario as usuario, u.senha as senha, u.tipo as tipo, p.nome as pessoa FROM usuarios u join pessoa p on u.nome = p.id  WHERE usuario='$usuariot' AND senha='$senhat' LIMIT 1";

$resultado = $con ->prepare($queryu);
$resultado ->execute();

$Dusuario=$resultado->fetch();
//$resultado = mysql_fetch_assoc($result);

//echo"Usuario: " .$resultado['nome'];

if(empty($Dusuario)){
//erro
	$randon = rand(1,5);

	switch ($randon) {
		case '1':
		$cor = "alert-danger";
		$message = "tem certeza que digitou sua senha corretamente??";
		break;

		case '2':
		$cor = "alert-danger";
		$message = "tenta novamente por favor!!";
		break;

		case '3':
		$cor = "alert-danger";
		$message = "senha errada, tente novamente";
		break;
		case '4':
		$cor = "alert-danger";
		$message = "algo errado não está certo!";
		break;

		case '5':
		$cor = "alert-danger";
		$message = "Repita!";
		break;
		default:
		# code...
		break;
	}

	$_SESSION['loginErro'] = ("<div class='alert ".$cor." alert-dismissible fade show' role='alert'>
		<strong>".$message."</strong>

		</div>");


//retorna ao login

	header("Location: index.php");

}else{
//definir atributos de usuario
	$_SESSION['usuarioId']			= $Dusuario['id'];
	$_SESSION['usuarioNome']		= $Dusuario['pessoa'];
	$_SESSION['usuarioNivel']		= $Dusuario['tipo'];
	$_SESSION['usuarioLogin'] 		= $Dusuario['usuario'];

	echo	$_SESSION['loginErro'] = ("<div class='alert alert-success alert-dismissible fade show' role='alert'>
		Login de <strong>".$_SESSION['usuarioNome']."</strong> realizado com sucesso!
		</div>");

	header("Location: ../");


}

?>