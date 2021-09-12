<?php
/*buscar dados para grafico principal como JSON*/ 
include_once('../../conexao.php');
$select_chart = ('SELECT pope.data_ref, (select periodo from lista_periodos where id = pope.periodo) as periodo, sum(lanc.liquido) as total from periodos_operacao pope JOIN operacao ope on pope.id = ope.periodo JOIN lancamentos lanc on lanc.operacao = ope.id GROUP by data_ref, pope.periodo;
');
$prep = $con->prepare($select_chart);
$prep->execute();
while ($resultados = $prep->fetch(PDO::FETCH_ASSOC)){
	$resulado[] = $resultados;
}
echo json_encode($resulado);
?>