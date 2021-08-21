<?php
session_start();
include('conexao.php');
//variavel para contar as execuções bem suceditas
$itens_ja_cadastrados = 0;
$notas_ja_cadastradas = 0;

$itens_cadastrados = 0;
$notas_cadastradas = 0;


$qtdxml = count($_FILES["fileToUpload"]["tmp_name"]);

for ($i=0; $i < $qtdxml ; $i++) { 
    //echo "<fieldset>";
    $filexml = simplexml_load_file($_FILES["fileToUpload"]["tmp_name"][$i]);
    $chave =    $filexml->protNFe->infProt->chNFe;
    
    $nNF =      $filexml->NFe->infNFe->ide->nNF;
    $serie =    $filexml->NFe->infNFe->ide->serie;
    $tpNF =     $filexml->NFe->infNFe->ide->tpNF;
//natureza da operação
    $natOp =    $filexml->NFe->infNFe->ide->natOp;
    //data e hora da emissão
    $dhEmi =    $filexml->NFe->infNFe->ide->dhEmi;
//emitente
    $emi_nome = $filexml->NFe->infNFe->emit->xNome;
    $emi_cnpj = $filexml->NFe->infNFe->emit->CNPJ;
    
//geral volumes
    $qtdvol = $filexml->NFe->infNFe->transp->vol->qVol;
    
//identificação geral da nota
    $Numeracao_item = $filexml->NFe->infNFe->transp->vol->nVol;
//peso da nota
    $Pbruto = doubleval($filexml->NFe->infNFe->transp->vol->pesoB);
    $Pliquido = doubleval($filexml->NFe->infNFe->transp->vol->pesoL);
//valor da nota
    $vProd = doubleval($filexml->NFe->infNFe->total->ICMSTot->vProd);
    $vNF = doubleval($filexml->NFe->infNFe->total->ICMSTot->vNF);
//transportadora
    $transp_nome = $filexml->NFe->infNFe->transp->transporta->xNome;
    $transp_cnpj = $filexml->NFe->infNFe->transp->transporta->CNPJ;
    /*
    echo "<p>";
    echo "Chave:   ".$chave."<br>";
    echo "Nº Nota: ".$nNF."<br>";
    echo "serie:"   .$serie."<br>";
    echo "tpNF:"    .$tpNF."<br>";
    echo "natOp:   ".$natOp."<br>";
    echo "dhEmi:   ".$dhEmi."<br>";
    echo "<hr>";
    echo "Emissor: ".$emi_nome."<br>";
    echo "CNPJ: ".$emi_cnpj."<br>";
    echo "<hr>";
    echo "Volumes: ".$qtdvol."<br>";
    echo "transportadora: ".$transp_nome."<br>";
    echo "Cnpj transportadora: ".$transp_cnpj."<br>";
    echo "<hr>";
    echo "Numeracao: ".$Numeracao_item."<br>";
    echo "Pbruto: ".$Pbruto ."<br>";
    echo "Pliquido: ".$Pliquido ."<br>";
   //valor da nota
    echo "Valor dos produtos:   ".$vProd ."<br>";
    echo "Valor da nota:        ".$vNF ."<br>";

*/


//contagem de itens
    $qtd_itens = count($filexml->NFe->infNFe->det);
//campo para verificação e execução de insert
//verificar empresas. beneficiario e transportadoras que serão convertidos em um unico digito (id de empresas)
    $CadEmp[0]      =   $emi_nome;
    $ConsCnpj[0]    =   $emi_cnpj;
    if (isset($transp_nome) or isset($transp_cnpj)) {
        $CadEmp[1]      =   $transp_nome;
        $ConsCnpj[1]    =   $transp_cnpj;
    // code...
    }else{
     $CadEmp[1]      =   "não informado";
     $ConsCnpj[1]    =   "999999999999";
 }
 //inicio de for para cadstro de empresa
 for ($foremp=0; $foremp < 2 ; $foremp++) { 

    $QconsEMp = "SELECT * FROM empresas where xCNPJ = ".$ConsCnpj[$foremp]."";
    $consultar = $con ->prepare($QconsEMp);
    $consultar ->execute();

    $contar_empresas = $consultar ->rowCount();

    if($contar_empresas > 0){

        $QconsEMp = "SELECT * FROM empresas where xCNPJ = $ConsCnpj[$foremp] limit 1";
        $consultar = $con ->prepare($QconsEMp);
        $consultar ->execute();
        $consultar = $consultar->fetch();
        $idemp[$foremp] = $consultar['id'];

    }else{

//empresa consultada inexistente, declarar um insert para cadastro de empresa automaticamente.

        $QcadEmp = "INSERT INTO empresas (`xNome`,`xCNPJ`) VALUES ('$CadEmp[$foremp]','$ConsCnpj[$foremp]')";
        $cadastrar = $con ->prepare($QcadEmp);
        $cadastrar ->execute();
        $contar_se_cadastro_de_empresa = $cadastrar ->rowCount();
        if($contar_se_cadastro_de_empresa > 0){

//contar se cadastrou empresa de _____________________________________________________ se cadastrou, realizar consulta para buscar o id.

          $QconsEMp = "SELECT * FROM empresas where xCNPJ = $ConsCnpj[$foremp]";
          $consultar = $con ->prepare($QconsEMp);
          $consultar ->execute();
          $consultar = $consultar->fetch();
          $idemp[$foremp] = $consultar['id'];
      }else{
//contar erro e colocar em log para consulta posterior.
//insert into log informação (empresa cadastrada. cnpj e nome)
      }
}//fim if
}//fim de for para cadastro de empresa
$emissor = $idemp[0];
$transport = $idemp[1];
$info_comp_nota_t = $filexml->NFe->infNFe->infAdic->infCpl;

$info_comp_nota =  filter_var($info_comp_nota_t,FILTER_SANITIZE_ADD_SLASHES);

//verificar se ja está cadastrado a nota fiscal

$QconsChave = "SELECT * FROM nf_ident where chave = '$chave' limit 1";
$consultarNF = $con ->prepare($QconsChave);
$consultarNF ->execute();

$contar_se_nota_cadastrada = $consultarNF ->rowCount();

if($contar_se_nota_cadastrada > 0){ 

    $notas_ja_cadastradas++;

    //echo "nota anteriormente cadastrada";----------------------------------------------------

}else{

    $notas_cadastradas++;

//execute

    $QinsertNF =  ("INSERT INTO `nf_ident`(`chave`,`nNF`,`serie`,`tpNF`,`dhEmi`,`emissor`,`qtdvol`,`Numeracao_item`,`Pbruto`,`Pliquido`,`vProd`,`vNF`,`transport`,`info_comp_nota`) VALUES ('$chave','$nNF','$serie','$tpNF','$dhEmi','$emissor','$qtdvol','$Numeracao_item','$Pbruto','$Pliquido','$vProd','$vNF','$transport','$info_comp_nota')");

    $cadastrar = $con ->prepare($QinsertNF);
    $cadastrar ->execute();

    $count = $cadastrar ->rowCount();

}

$QconsChave = "SELECT * FROM nf_ident where chave = '$chave' limit 1";
$consultarNF = $con ->prepare($QconsChave);
$consultarNF ->execute();
$consultarNF = $consultarNF->fetch();
$idnf = $consultarNF['id'];

// listando os itens da nota para cadastro
for ($i2=0; $i2 < $qtd_itens ; $i2++) { 
    $det = ($filexml->NFe->infNFe->det[$i2]);
    $item = ($filexml->NFe->infNFe->det[$i2]->prod);
    $item_cProd     =       $item->cProd;
    $item_xProd     =       $item->xProd;
    $infAdProd      =       $det->infAdProd;
    $item_NCM       =       $item->NCM;
    $item_CFOP      =       $item->CFOP;
    $item_uCom      =       $item->uCom;
    $item_qCom      =      doubleval($item->qCom);
    $item_vUnCom    =      doubleval($item->vUnCom);
    $item_vProd     =      doubleval($item->vProd);
/*
    echo "<p>";
    //echo "<fieldset>";
    echo  "codigo do produto(nf): ". $item_cProd."<br>";
       //cEAN é o codigo de barras do produto ""
      //  echo  "cEAN: ". $item_cEAN =     $item->cEAN."<br>";
      //descrição do produto
    echo  "xProd: ". $item_xProd."<br>";
    echo "infAdProd: ".$infAdProd."<br>";
    echo  "NCM: ". $item_NCM."<br>";
    echo  "CFOP: ". $item_CFOP."<br>";
       //unidade de medida
    echo  "uCom: ". $item_uCom."<br>";
       //valor da medida
    echo  "qCom: ". $item_qCom."<br>";
       //valor unitario
    echo  "vUnCom: ". $item_vUnCom."<br>";
    echo  "vProd: ". $item_vProd."<br>";
    //echo "</fieldset>";
    echo "</p>";
*/
// execute verificação antes de enviar os dados


    $QconsChave = "SELECT * FROM nf_itens where `cProd` = '$item_cProd' and `nf_id` = '$idnf' limit 1";
    $consultarItem = $con ->prepare($QconsChave);
    $consultarItem ->execute();
    $contar_itens = $consultarItem ->rowCount();

    if($contar_itens > 0){ 

        $itens_ja_cadastrados++;

        //echo "valores anteriormente cadastrada";----------------------------------------------------

    }else{
//execute
        $QinsItens = "INSERT INTO `nf_itens`(`nf_id`,`cProd`,`xProd`,`infAdProd`,`NCM`,`CFOP`,`uCom`,`qCom`,`vUnCom`,`vProd`) VALUES ('$idnf','$item_cProd','$item_xProd','$infAdProd','$item_NCM','$item_CFOP','$item_uCom','$item_qCom','$item_vUnCom','$item_vProd')";
        $inserirItens = $con ->prepare($QinsItens);
        $inserirItens ->execute();

        $contar_cad_iten = $inserirItens ->rowCount();

        $itens_cadastrados++;

    }
}
echo "</p>";
//dados adicionais $filexml->NFe->infNFe
//echo $info_comp_nota;
//echo "</fieldset>";
}
echo "total de novas notas cadastradas: ".$notas_cadastradas."<br>";
echo "total de novos itens cadastradas: ".$itens_cadastrados."<br>";


echo "total de itens anteriormente cadastrados:". $itens_ja_cadastrados."<br>";
echo "total de itens anteriormente cadastrados:". $notas_ja_cadastradas."<br>";


$_SESSION['notas_cadastradas'] = $notas_cadastradas ;
$_SESSION['itens_cadastrados'] = $itens_cadastrados ;
$_SESSION['itens_ja_cadastrados'] = $itens_ja_cadastrados ;
$_SESSION['notas_ja_cadastradas'] = $notas_ja_cadastradas ;



$_SESSION['mensagem'] = "total de novas notas cadastradas: ".$notas_cadastradas."<br> total de novos itens cadastradas: ".$itens_cadastrados."<br> total de itens anteriormente cadastrados:". $itens_ja_cadastrados."<br> total de itens anteriormente cadastrados:". $notas_ja_cadastradas."<br>";

    header("Location: index.php");

?>
