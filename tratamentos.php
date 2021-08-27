<?php 
//arquivo de tratamento para tratar dados para listas.
function periodo($data,$periodo){
	$data = date('d - ', strtotime($data));
	$ret = $data.$periodo;
	return($ret);
};


?>