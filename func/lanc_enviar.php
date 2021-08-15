<?php
session_start();
include('conexao.php');

$atra			=	$_POST['atra'];
$tipo			=	$_POST['oper'];//TIPO
$doc			=	$_POST['doc'];
$data			=	$_POST['data'];
$transp		    = 	$_POST['transportadora']; // transportadora, criar campo no formulario anterior
$cpf 			= 	$_POST['cpf'];// consultar no banco o cpf para pegar o ID da pessoa
$motorista 	    = 	$_POST['motorista'];// se não tiver cpf no banco, realizar cadastro automaticamente
$pe 			= 	$_POST['pe'];
$placa          =   $_POST['placa'];
$_POST['carreta'][0];
$_POST['carreta'][1];
$bruto 		    = 	$_POST['bruto'];
$liquido 		= 	$_POST['liquido'];
$tara           = $bruto - $liquido;
$usuario 		= 	$_SESSION['usuarioId'];
$armazem 		= 	$_POST['arma'];





function return_form(){

    echo "alguem me chamou";
}

function cadastra_pessoa ($nome_completo,$cpf,$con){
    $sep = explode(" ",$nome_completo,2);
    
    $nome = $sep[0];
    $sobrenome = $sep[1];
    $cpf;
    
    $query_insert = "INSERT into pessoa (`nome`,`sobrenome`,`cpf`) VALUES ('$nome','$sobrenome','$cpf')";
    $prepare_pes = $con->prepare();
    $prepare_pes->execute();

    $contar_cad = $prepare_pes ->rowCount();

    if ($contar_cad>0) {
        buscar_pessoa($cpf,$motorista,$con);
    }else{

        return_form();

    }
}

function buscar_pessoa ($cpf,$motorista, $con){

    $busca_cpf = "SELECT * FROM pessoa where cpf = ".$cpf." limit 1";
    $resultado = $con->prepare($busca_cpf);
    $resultado->execute();
    $contar_pessoa = $resultado ->rowCount();
    if ($contar_pessoa>0) {
        $pessoa = $resultado->fetch();
        $id_cpf = $pessoa['id'];

        return($id_cpf);
    } else{
        cadastra_pessoa($motorista,$cpf,$con);
    }
}; // fim busca pessoa

function busca_empresa($transp,$con){

    $busca_transp = "SELECT id FROM empresas where xCNPJ = ".$transp." limit 1";
    $resultado_tra = $con->prepare($busca_transp);
    $resultado_tra->execute();
    $cont_res = $resultado_tra ->rowCount();
    if ($cont_res>0) {
        $empresa_tra = $resultado_tra->fetch();
        $transp = $empresa_tra['id'];
        
        return($transp);
    }
}; // fim busca empresa

function busca_carreta ($carreta,$con){
    $select = "SELECT * FROM placas where placa like '".$carreta."' limit 1";
    $prepare_placa = $con->prepare($select);
    $prepare_placa->execute();
    $contar_plac = $prepare_placa->rowCount(); 
    if ($contar_plac>0) {
        $pla=$prepare_placa->fetch();
        $carreta = $pla['id'];
        return($carreta);
    }else{

      if ($carreta == "") {

        return($carreta);
        
    }  else{
        cadastra_carreta($carreta,$con);
    }
}
} // fim busca carreta
function cadastra_carreta ($carreta,$con){
    $inser = "INSERT INTO placas (`placa`,`tipo`) VALUES ('$carreta','2')";
    $prepare_ins = $con->prepare($inser);
    $prepare_ins->execute();
    $contar_plac_cad = $prepare_ins->rowCount(); 
    if ($contar_plac_cad>0) {
        $carreta = $carreta;
        busca_carreta($carreta,$con);
    }else{
        return_form();
    }
}//fim cadastra carreta


$id_cpf = buscar_pessoa($cpf,$motorista,$con);
$transp = busca_empresa($transp,$con);


for ($pl=0; $pl < 2 ; $pl++) { 

    if ($_POST['carreta'][$pl]=="") {

       $placa_final[$pl] = 'NULL';

   }else{
       $placa_final[$pl] = busca_carreta($_POST['carreta'][$pl],$con);
   }


}





/*


echo "<fieldset>";
echo "itens para enviar ao banco";

echo "<br>atra: "     .$atra;
echo "<br>tipo: "     .$tipo;
echo "<br>doc: "      .$doc;
echo "<br>data: "     .$data;
echo "<br>transp: "   .$transp;
echo "<br>id_cpf: "   .$id_cpf;
echo "<br>placa: "    .$placa;
echo "<br>carreta1: " .$placa_final[0];
echo "<br>carreta2: " .$placa_final[1];
echo "<br>pe: "       .$pe;
echo "<br>bruto: "    .$bruto;
echo "<br>liquido: "  .$liquido;
echo "<br>tara: "     .$tara;
echo "<br>armazem: "  .$armazem;
echo "<br>usuario: "  .$usuario;
echo "</fieldset>";


*/




$query_insert = "INSERT INTO `lancamentos`(
`atracacao`,
`tipo`,
`documento`,
`data`,
`transp`,
`motorista`,
`placa`,
`carreta1`,
`carreta2`,
`periodo`,
`bruto`,
`liquido`,
`tara`,
`armazem`,
`usuario`
)
VALUES(
$atra, 
$tipo,
$doc,
'$data',
$transp, 			
$id_cpf, 			
$placa,
$placa_final[0],
$placa_final[1],
'$pe',
'$bruto',
'$liquido',
'$tara',
'$armazem',
'$usuario'
)";


$prepare = $con->prepare($query_insert);
$prepare->execute();
$contar_exec = $prepare ->rowCount();
$page = "../index.php?p=6&n=".$atra;
if ($contar_exec>0) {

    //SUCESSO
    $_SESSION['mensagem'] = ('<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Sucesso</strong> !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>');


    header("Location: ".$page);

}else{

/// ERRO
    $_SESSION['mensagem'] = ('<div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Erro</strong>!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>');

    header("Location: ".$page);

}




?>