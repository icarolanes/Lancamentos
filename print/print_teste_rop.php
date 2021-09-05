  <table style="text-align: center; width: 100%;" border="1px" >
    <thead>
      <tr>
        <th colspan="4">Resumo Operacional - ROP<br><small> Summary Control</small></th>
        <th colspan="<?php echo $poroes['poroes']+1; ?>" rowspan="5">Operador Portuário <br> <small>Port Operator</small><br> LOGO</th>
        <th colspan="1">Navegação</th>
        <th colspan="2">longo ou cabotagem</th>
      </tr>
      <tr>
        <th colspan="4">MV <?php echo $dados_at['navio'] ?></th>
        <th rowspan="1">operação</th>
        <th >Embarque</th>
      </tr>
      <tr>
        <th>Berço</th>
        <th>Inicio</th>
        <th colspan="2"><?php echo datahora($dados_at['ope1'],1); ?></th>
        <th rowspan="2">Porões</th>
        <th rowspan="2"><?php echo $dados_at['poroes'];?></th>
      </tr>
      <tr>
        <th><?php echo $dados_at['berco']; ?></th>
        <th>Termino</th>
        <th colspan="2"><?php echo datahora($dados_at['ope2'],1); ?></th>
      </tr>
    </thead>
    <thead>
     <tr>
      <th rowspan="2">Seq</th>
      <th rowspan="2">Data</th>
      <th rowspan="2">Periodo</th>
      <th colspan="<?php echo $poroes['poroes']; ?>">Porões</th>
      <th rowspan="2" colspan="2">Paralizações</th>
      <th rowspan="2">Total</th>
      <th rowspan="2">Acumulado</th>
    </tr>
    <tr>
      <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
       echo "<th width='5%'>#".$pori."</th>";
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
      <td><?php echo $linha['paralizacoes']  ; ?></td>
      <td><?php echo $linha['tempo']  ; ?></td>
      <td><?php echo numero($linha['total'])?></td>
      <td><?php echo numero($acum = $acum+$linha['total'])?></td>
    </tr>
    <?php
  }
  ?>
</tbody>
<thead>
  <tr>
    <td colspan="3">Porões</td>
    <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
      echo "<td>#".$pori."</td>";
    }
    ?>
    <td colspan="2"></td>
    <td colspan="2" >Total</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td colspan="3">Total Manifestado</td>
    <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) {    ?>
     <td><?php echo numero($dados_at['porao'.$pori]); ?> </td> <?php }  ?>
     <td colspan="2"></td>
     <td colspan="2"><?php echo numero($dados_at['total']);?></td>
   </tr>
   <tr>
    <td colspan="3">Total descarregado</td>
    <?php  for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
     echo "<td>".numero($acum_por[$pori])."</td>";
   }
   ?>
   <td colspan="2"></td>
   <td colspan="2"><?php echo numero($acum)?></td>
 </tr>
 <tr>
  <td colspan="3">Saldo</td>
  <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
   $saldo_por[$pori] = $dados_at['porao'.$pori] - $acum_por[$pori];
   echo "<td>".numero($saldo_por[$pori])."</td>";
 }
 ?>
 <td colspan="2"></td>
 <td colspan="2"><?php echo numero($saldo_total = $dados_at['total'] - $acum)?></td>
</tr>
</tbody>
</table>