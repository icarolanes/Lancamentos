<?php
session_start();
include_once('../../conexao.php');
/*variavel para contar as execuções bem suceditas*/
$qtdxml = count($_FILES["fileToUpload"]["tmp_name"]);


?>