<?php
/*buscar dados para grafico principal como JSON*/ 
include_once('../../conexao.php');
$select_chart = ('SELECT placa, sum(liquido) AS total FROM lancamentos group by placa');
$prep = $con->prepare($select_chart);
$prep->execute();
while ($resultados = $prep->fetch(PDO::FETCH_ASSOC)){
	$resulado[] = $resultados;
}
echo json_encode($resulado);
?>