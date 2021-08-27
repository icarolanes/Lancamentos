    <html lang="pt-br">


    <style type="text/css">
      @media print{@page {size: landscape}}

    </style>
    <meta charset="utf-8">
    <?php
    include('../../conexao.php');
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
        $pors .= " (SELECT sum(lanc2.liquido) from lancamentos lanc2 join operacao ope2 on ope2.id = lanc2.operacao where ope2.periodo = pope.id and ope2.armazem = ".$po.") as porao".$po.",";
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