<?php
function datahora($data,$tipo){

  switch ($tipo) {
    case '1':
    $data = date('d/m/y H:i', strtotime($data));
    break;
    
    case '2':
    

    break;

    default:
    // code...
    break;
  }
  return($data);
};
function numero($numero){
  $numero = number_format($numero,0,',','.');
  return($numero);
}



?>