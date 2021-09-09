    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Item de notas</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Adicionar</button>
          </div>
        </div>
      </div>
      <?php 
$querynNF = "SELECT nf.nNF from nf_ident nf where nf.id = ".$_GET['nf'];
            $result = $con ->prepare($querynNF);
            $result ->execute();
            $nota=$result->fetch()
      ?>
      <h2>Nº: <?php echo $nota['nNF'];?></h2>
      <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">item</th>
              <th scope="col">Identificação</th>
              <th scope="col">Descrição</th>
              <th scope="col">Descrição 2</th>
            </tr>
          </thead>
          <tbody>
            <?php 
            $queryu = "SELECT * from nf_itens where nf_id = ".$_GET['nf'].";
            ";
// por enquanto SELECT nf.nNF,nf.qtdvol as qtd , em.xNome as emissor , nf.transport as transportadora from nf_ident nf JOIN nf_itens it JOIN empresas em on nf.emissor = em.id GROUP by  nNf;;
            $resultado = $con ->prepare($queryu);
            $resultado ->execute();
            $cnt = 1;
            while ($linha=$resultado->fetch()) {
              
              ?>
              <tr>
                <td>Editar | Apagar</td>
                <td><?php echo $cnt++ ;?></td>
                <td><?php echo $linha['cProd']; ?></td>
                <td><?php echo $linha['xProd']; ?></td>
                <td><?php echo $linha['infAdProd']; ?></td>
                
              </tr>
              <?php
            }
            ?>
            
          </tbody>
        </table>
      </div>
    </main>