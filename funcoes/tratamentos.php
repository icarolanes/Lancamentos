<?php 
//arquivo de tratamento para tratar dados para listas.
function periodo($data,$periodo){
	$data = date('d - ', strtotime($data));
	$ret = $data.$periodo;
	return($ret);
};
//formato de data
function datahora($data,$tipo){
	switch ($tipo) {
		case '1':
		$data = date('d/m/y H:i', strtotime($data));
		break;
		
		case '2':
		$data = date('d/m/Y ', strtotime($data));
		break;
		default:
    // code...
		break;
	}
	return($data);
};
//formatação de numero
function numero($numero){
	$numero = number_format($numero,0,',','.');
	return($numero);
}

//verificar meta
function meta($meta,$total){

	if ($meta <= $total) {
		$retorno = "Meta alcançada";
	}else{
		$retorno = "Meta não alcançada";
	}

	return($retorno);
}


?>