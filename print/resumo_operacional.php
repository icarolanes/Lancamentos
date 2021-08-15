    <html lang="pt-br">


    <style type="text/css">
      @media print{@page {size: landscape}}

    </style>
    <meta charset="utf-8">
    <?php
    include('../func/conexao.php');
    include('funcoes.php');
    function rop($con,$id){
//Select dados de atracação
      $qporoes = "select poroes from navios where id =".$id." limit 1";
      $prepara = $con->prepare($qporoes);
      $prepara->execute();
      $poroes = $prepara->fetch();
      $poroes['poroes'];
      $po = 1;
      $pors = "";
      for ($linhas=0; $linhas < $poroes['poroes'] ; $linhas++) { 
        $pors .= " (SELECT sum(lanc2.liquido) from lancamentos lanc2 where lanc2.periodo = pope.id and ope.armazem = ".$po.") as porao".$po.",";
      //$pors .= " if((lanc.armazem = ".$po." ),sum(lanc.liquido),'0') as porao".$po.",";
        $po++;
      }
      $po2 = 1;
      $pors2 = "";
      for ($linhas2=0; $linhas2 < $poroes['poroes'] ; $linhas2++) { 
        $pors2 .= " (select sum(plan.total) from plano_ope_porao plan where plan.porao = ".$po2.") as porao".$po2.",";
        $po2++;    
      }
      $atracacao_dados = "SELECT 
      n.Nnome as navio,
      atr.ope1,
      atr.ope2, 
      b.numero as berco, 
      ( select GROUP_CONCAT(arm.descr SEPARATOR ' ') from plano_ope_porao pl join armazem arm on pl.porao = arm.numero where atracacao = atr.id ) as poroes,
      ".$pors2." 
      (select sum(total) from plano_ope_porao where atracacao = atr.id) as total
      FROM atracacao atr join navios n on atr.navio = n.id join berco b on atr.berco = b.id join lancamentos lanc on lanc.atracacao = atr.id join plano_ope_porao plan on plan.atracacao = atr.id where atr.id = ".$id." group by atr.id";

    //echo"<hr>";

      $prep_at = $con->prepare($atracacao_dados);
      $prep_at->execute();
      $dados_at = $prep_at->fetch();
      $select = "
      SELECT 
      atr.id,
      pope.data_ref as dope,
      pope.periodo as periodo,";
      $select.= $pors ;
      $select .= "sum(lanc.liquido) as total,
      (select GROUP_CONCAT(lpar1.pt_br separator '<br>') from paralizacao_ope para join lista_paralizacoes lpar1 on lpar1.id = para.paralizacao where para.periodo = pope.id ) as paralizacoes,
      (select GROUP_CONCAT(timediff(para.par_termino, para.par_inicio)separator '<br>') from paralizacao_ope para where para.periodo = pope.id ) as tempo
      from atracacao atr 
      join periodos_operacao pope on pope.atracacao = atr.id
      LEFT join operacao ope on ope.periodo = pope.id
      left join lancamentos lanc on ope.id = lanc.operacao 
      GROUP by atr.id,pope.id";

      $select;
    /*

//novo funcional

SELECT pope.data_ref as data,

lper.abv as periodo,

pope.id as popeid,

(SELECT if(par.periodo = pope.id, GROUP_CONCAT( (lpar.pt_br)SEPARATOR ''),'0') from paralizacao_ope par join lista_paralizacoes lpar on par.paralizacao = lpar.id where par.terno = ter.terno and par.periodo = ter.periodo) as paralizacoes,
(SELECT if(par.periodo = pope.id, GROUP_CONCAT( (timediff(par.par_termino,par.par_inicio))SEPARATOR ''),'0') from paralizacao_ope par join lista_paralizacoes lpar on par.paralizacao = lpar.id where par.terno = ter.terno and par.periodo = ter.periodo) as tempo,

if((lanc.armazem = 1 and ter.porao = lanc.armazem),sum(lanc.liquido),'0') as porao1,
if((lanc.armazem = 2 and ter.porao = lanc.armazem),sum(lanc.liquido),'0') as porao2,
if((lanc.armazem = 3 and ter.porao = lanc.armazem),sum(lanc.liquido),'0') as porao3,
if((lanc.armazem = 4 and ter.porao = lanc.armazem),sum(lanc.liquido),'0') as porao4,
if((lanc.armazem = 5 and ter.porao = lanc.armazem),sum(lanc.liquido),'0') as porao5,

sum(lanc.liquido) as total

from atracacao atr 
join periodos_operacao pope on pope.atracacao = atr.id 
left join ternos ter on ter.periodo = pope.id 
left join lancamentos lanc on lanc.periodo = pope.id 
join lista_periodos lper on lper.id = pope.periodo 
GROUP by atr.id,pope.data_ref,pope.periodo,ter.id;


//// antigo
SELECT 
      pope.data_ref as data,
      lper.abv as periodo,
      pope.id as popeid,
      (SELECT if(par.periodo = pope.id, GROUP_CONCAT( (lpar.pt_br)SEPARATOR '<br>'),'0') from paralizacao_ope par join lista_paralizacoes lpar on par.paralizacao = lpar.id  where par.periodo = pope.id) as paralizacoes,
      (SELECT if(par.periodo = pope.id, GROUP_CONCAT( (timediff(par.par_termino,par.par_inicio))SEPARATOR '<br>'),'0') from paralizacao_ope par join lista_paralizacoes lpar on par.paralizacao = lpar.id  where par.periodo = pope.id) as tempo,
      ".$pors."
      sum(lanc.liquido) as total  
      from atracacao atr 
      left join lancamentos lanc on lanc.atracacao = atr.id
      join periodos_operacao pope on lanc.periodo = pope.id
      join lista_periodos lper on pope.periodo = lper.id
      where lanc.tipo = 3 and atr.id = ".$id."
      group by  pope.data_ref,pope.periodo


    */


      $prepare = $con->prepare($select);
      $prepare->execute();
      $contar_periodo = $prepare ->rowCount();
      $c =0;
      $acum = 0;

      include_once('print_teste_rop.php');
}//end function
if (isset($_GET['n'])) {
  rop($con,$_GET['n']);
}else{

}
?>
<form action="#">
	
  <label>ID da atracação</label>
  <input type="number" name="n">
  <button type="submit">ok</button>
</form>
</html>