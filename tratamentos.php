<?php 
//arquivo de tratamento para tratar dados para listas.
function periodo($data,$periodo){
	$data = date('d/m/y H:i', strtotime($data));
	$ret = $data.$periodo;
	return($ret);
};


?>