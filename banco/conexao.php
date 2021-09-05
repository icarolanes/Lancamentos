<?php
include_once('../conexao.php');


/*

o metodo de conexão que usei foi o PDO.

try{
$con = new PDO('mysql:host=localhost;dbname=bd_name', 'user', 'pass', // conexao google hosts

array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, 
                PDO::ATTR_PERSISTENT => false,
                PDO::ATTR_EMULATE_PREPARES => false,
                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
            )

);
}
catch (PDOException $e)
{
echo 'Error: '. $e->getMessage();
exit();
}




*/
?>