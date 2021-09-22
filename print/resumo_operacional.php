    <html lang="pt-br">
    <link rel="stylesheet" type="text/css" href="css/impressoes.css">
    <style type="text/css">
@media print {
    @page {
        size: landscape;
    }
}
    </style>
    <meta charset="utf-8">
    <?php
  include('../../conexao.php');
  include('../funcoes/tratamentos.php');
  function obs($manifestado,$descarregado,$quebra){
    if ($manifestado > $descarregado) {
      $mensagem['br']   = "Foi descarregado  ".numero($quebra)." a menos do total manifestado";
      $mensagem['eng']  = numero($quebra)." Less was discharged from manifested total";
    }else{
      $mensagem['br']  = "Foi descarregado  ".numero($quebra)." a mais do total manifestado";
      $mensagem['eng'] = numero($quebra)." More was discharged from manifested total";
    }
    return ($mensagem);
  }
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
    where atr.id = ".$id."
    GROUP by atr.id,pope.id";
    $prepare = $con->prepare($select);
    $prepare->execute();
    $contar_periodo = $prepare ->rowCount();
    $c =0;
    $acum = 0;
    $select_documentos = "SELECT *, (select sum(liquido) from lancamentos where documento = doc.id) as descarregado FROM documentos doc where atracacao = ".$id;
    $prep_doc = $con->prepare($select_documentos);
    $prep_doc->execute();
    ?>

    <body>
        <button type="button" onclick="window.print()">IMPRIMIR</button>
        <table class="rop">
            <thead>
                <tr>
                    <th colspan="3">Resumo Operacional - ROP<br><small> Summary Control</small></th>
                    <th colspan="<?php echo $poroes['poroes']; ?>" rowspan="4">Operador Portuário <br> <small>Port
                            Operator</small><br> LOGO</th>
                    <th colspan="1">Navegação</th>
                    <th colspan="3">longo ou cabotagem</th>
                </tr>
                <tr>
                    <th colspan="3">MV <?php echo $dados_at['navio'] ?></th>
                    <th rowspan="1">operação</th>
                    <th colspan="3">Embarque</th>
                </tr>
                <tr>
                    <th>Berço</th>
                    <th>Inicio</th>
                    <th colspan="1"><?php echo datahora($dados_at['ope1'],1); ?></th>
                    <th rowspan="2">Porões</th>
                    <th colspan="3" rowspan="2"><?php echo $dados_at['poroes'];?></th>
                </tr>
                <tr>
                    <th><?php echo $dados_at['berco']; ?></th>
                    <th>Termino</th>
                    <th colspan="1"><?php echo datahora($dados_at['ope2'],1); ?></th>
                </tr>
                <tr class="tit">
                    <th rowspan="2">Seq</th>
                    <th rowspan="2">Data</th>
                    <th rowspan="2">Periodo</th>
                    <th colspan="<?php echo $poroes['poroes']; ?>">Porões</th>
                    <th rowspan="2" colspan="2">Paralizações</th>
                    <th rowspan="2">Total</th>
                    <th rowspan="2">Acumulado</th>
                </tr>
                <tr class="tit">
                    <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
             echo "<th class='poroes'>#".$pori."</th>";
             $acum_por[$pori] = 0;
           }
           ?>
                </tr>
            </thead>
            <tbody>
                <?php
         for ($i=0; $i < $contar_periodo; $i++) { 
          $linha = $prepare->fetch();
          ?>
                <tr>
                    <td><?php echo ++$c;?></td>
                    <td><?php echo date('d/m/y', strtotime($linha['dope']))?></td>
                    <td><?php echo $linha['periodo']?></td>
                    <?php  for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) {  ?>
                    <td><?php echo numero($linha['porao'.$pori]); ?></td>
                    <?php  $acum_por[$pori] = $acum_por[$pori] +  $linha['porao'.$pori];   }   ?>
                    <td class="paralizacao"><?php echo $linha['paralizacoes']  ; ?></td>
                    <td><?php echo $linha['tempo']  ; ?></td>
                    <td><?php echo numero($linha['total'])?></td>
                    <td><?php echo numero($acum = $acum+$linha['total'])?></td>
                </tr>
                <?php
        }
        ?>
            </tbody>
            <thead>
                <tr class="tit">
                    <td colspan="3">Porões</td>
                    <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
            echo "<td>#".$pori."</td>";
          }
          ?>
                    <td colspan="2"></td>
                    <td colspan="2">Total</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tit">
                    <td colspan="3">Total Manifestado</td>
                    <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) {    ?>
                    <td class="nm"><?php echo numero($dados_at['porao'.$pori]); ?> </td> <?php }  ?>
                    <td colspan="2"></td>
                    <td colspan="2" class="nm"><?php echo numero($dados_at['total']);?></td>
                </tr>
                <tr class="tit">
                    <td colspan="3">Total descarregado</td>
                    <?php  for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
           echo "<td class='nm'>".numero($acum_por[$pori])."</td>";
         }
         ?>
                    <td colspan="2"></td>
                    <td colspan="2" class="nm"><?php echo numero($acum)?></td>
                </tr>
                <tr class="tit">
                    <td colspan="3">Saldo</td>
                    <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
         $saldo_por[$pori] = $dados_at['porao'.$pori] - $acum_por[$pori];
         ?>
                    <td class="nm"><?php echo numero($saldo_por[$pori]); ?></td>
                    <?php
       }
       ?>
                    <td colspan="2"></td>
                    <td colspan="2" class="nm"><?php echo numero($saldo_total = $dados_at['total'] - $acum)?></td>
                </tr>
            </tbody>
            <thead>
                <tr>
                    <th colspan="3">Ce mercante</th>
                    <th colspan="<?php echo $poroes['poroes'];?>">Conhecimento de embarque</th>
                    <th colspan="2">Previsto no SC-RF</th>
                    <th colspan="1">Oficial Descarregado</th>
                    <th colspan="1">Quebra Por Lote</th>
                </tr>
            </thead>
            <tbody>
                <?php 
    $soma_manif = 0;
    $soma_desc = 0;
    $soma_quebra = 0;
    while ($docs = $prep_doc->fetch()){
      ?>
                <tr>
                    <td colspan="3"><?php echo $docs['identificacao']?></td>
                    <td colspan="<?php echo $poroes['poroes'];?>"><?php echo $docs['conhecimento']?></td>
                    <td colspan="2">
                        <?php $soma_manif = $soma_manif+$docs['manifestado']; echo numero($docs['manifestado'])?></td>
                    <td colspan="1">
                        <?php $soma_desc = $soma_desc+$docs['descarregado']; echo numero($docs['descarregado'])?></td>
                    <td colspan="1">
                        <?php $quebra = $docs['manifestado']-$docs['descarregado']; $soma_quebra = $soma_quebra+($quebra); echo numero($quebra)?>
                    </td>
                </tr>
                <?php
    }
    ?>
                <tr class="tit">
                    <td colspan="3"></td>
                    <td colspan="<?php echo $poroes['poroes'];?>">Total Kg</td>
                    <td colspan="2"><?php echo numero($soma_manif);?></td>
                    <td colspan="1"><?php echo numero($soma_desc);?></td>
                    <td colspan="1"><?php echo numero($soma_quebra);?></td>
                </tr>
                <tr class="obs">
                    <td class="obs" colspan="5">
                        <h4>Observações:</h4>
                        <p class="obs">
                            <?php 
          $mensagem = obs($soma_manif,$soma_desc,$soma_quebra);
          echo $mensagem['br'];
          echo "<br>";
          echo $mensagem['eng'];
          ?>
                        </p>
                    </td>
                    <td colspan="<?php echo $poroes['poroes']+2;?>">
                        <h4>Assinatura/Carimbo do Gerente ou Fiel Depositário e do Comando do navio</h4>
                    </td>
                </tr>
            </tbody>
        </table>
        <?php
}//end function
if (isset($_GET['n'])) {
  rop($con,$_GET['n']);
}else{
}
?>
    </body>

    </html>