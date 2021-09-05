<?php
session_start();
if(($_SESSION['usuarioId'] == "") || ($_SESSION['usuarioNome'] == "" ) || ($_SESSION['usuarioNivel'] == "") || ($_SESSION['usuarioLogin'] == "")){

	 unset(
$_SESSION['usuarioId'],			
$_SESSION['usuarioNome'],		
$_SESSION['usuarioNivel'],
$_SESSION['usuarioLogin']); 		
	
	//Mensagem de erro

$_SESSION['loginErro'] = ('<div class="alert alert-warning" role="alert">
 <strong>  Usuario não indentificado!</strong><br> Acesse com seu Usuario
</div>');


//retorna ao loginsmall

header("location: sign-in/");
}else{



}
?>
