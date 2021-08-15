    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Controle operacional</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
        </div>
      </div>
      <?php 



      function numero($numero){
        $numero = number_format($numero,0,',','.');
        return($numero);
      }
      
      function cop($con,$id){
       
        $qporoes = "select poroes from navios where id =".$id." limit 1";
        $prepara = $con->prepare($qporoes);
        $prepara->execute();
        $poroes = $prepara->fetch();
        $poroes['poroes'];
        $po = 1;
        $pors = "";
        for ($linhas=0; $linhas < $poroes['poroes'] ; $linhas++) { 
          $pors .= " if(lanc.armazem = ".$po.",sum(lanc.liquido),'0') as porao".$po.",";
          $po++;
        }
  //concat(timediff(para.par_termino,para.par_inicio)) as paralizacao,
        $select = ("SELECT 
          pope.data_ref as data,
          lper.abv as periodo,
          pope.id as popeid,
          (SELECT if(par.periodo = pope.id, GROUP_CONCAT( (lpar.pt_br)SEPARATOR '<br>'),'0') from paralizacao_ope par join lista_paralizacoes lpar on par.paralizacao = lpar.id  where par.periodo = pope.id) as paralizacoes,
          (SELECT if(par.periodo = pope.id, GROUP_CONCAT( (timediff(par.par_termino,par.par_inicio))SEPARATOR '<br>'),'0') from paralizacao_ope par join lista_paralizacoes lpar on par.paralizacao = lpar.id  where par.periodo = pope.id) as tempo,
          ".$pors."
          sum(lanc.liquido) as total  
          from atracacao at 
          left join lancamentos lanc on lanc.atracacao = at.id
          join periodos_operacao pope on lanc.periodo = pope.id
          join lista_periodos lper on pope.periodo = lper.id
          where lanc.tipo = 3 and at.id = ".$id."
          group by  pope.data_ref,pope.periodo");
        $prepare = $con->prepare($select);
        $prepare->execute();
        $contar_periodo = $prepare ->rowCount();
        $c =0;
        $acum = 0;
        ?>

        <div class="">
          <table class="table table-bordered align-middle table-striped table-hover" style="text-align: center;" >
            <thead>
              <tr>
                <th rowspan="2">sequencia</th>
                <th rowspan="2">data</th>
                <th rowspan="2">periodo</th>
                <th colspan="<?php echo $poroes['poroes']; ?>">Porões</th>
                <th rowspan="2" colspan="2">Paralizações</th>
                <th rowspan="2">total</th>
                <th rowspan="2">acumulado</th>
              </tr>
              <tr>
                <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
                  echo "<th>#".$pori."</th>";
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
                  <td><?php echo date('d/m/y', strtotime($linha['data']))?></td>
                  <td><?php echo $linha['periodo']?></td>
                  <?php
                  for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
                    echo "<td>".numero($linha['porao'.$pori])."</td>";
                    $acum_por[$pori] = $acum_por[$pori] +  $linha['porao'.$pori];
                  }
                  ?>
                  <td><?php $linha['paralizacoes']; ?></td>
                  <td><?php $linha['tempo']; ?></td>
                  <td><?php echo numero($linha['total'])?></td>
                  <td><?php echo numero($acum = $acum+$linha['total'])?></td>
                </tr>
                <?php
              }
              ?>
            </tbody>

            <thead>
              <tr>
                <th colspan="3">Porões</th>
                <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
                  echo "<th>#".$pori."</th>";
                }
                ?>
                <td colspan="3"></td>
                <th >Total</th>
              </tr>
              <tr>
                <th colspan="3">Total Manifestado</th>
                <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
                  $manifestado_por[$pori] = 1000000;
                  echo "<td>".numero($manifestado_por[$pori])."</td>";
                }
                ?>
                <td colspan="3"></td>
                <td ><?php echo numero($manifestado = 5500000);?></td>
              </tr>
              <tr>
                <th colspan="3">Total descarregado</th>
                <?php  for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
                  echo "<td>".numero($acum_por[$pori])."</td>";
                }
                ?>
                <td colspan="3"></td>
                <td ><?php echo numero($acum)?></td>
              </tr>
              <tr>
                <th colspan="3">Saldo</th>
                <?php for ($pori=1; $pori <= $poroes['poroes'] ; $pori++) { 
                  $saldo_por[$pori] = $manifestado_por[$pori] - $acum_por[$pori];
                  echo "<td>".numero($saldo_por[$pori])."</td>";
                }
                ?>
                <td colspan="3"></td>
                <td ><?php echo numero($saldo_total = $manifestado - $acum)?></td>
              </tr>
            </thead>
          </table>
        </div>
        <?php
      }
      cop($con,1);
      ?>
    </main>