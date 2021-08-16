    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Notas cadastradas</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" onclick="window.location.href='index.php?p=15'" class="btn btn-sm btn-outline-secondary">Cadastrar</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Importar</button>
          </div>
        </div>
      </div>

      <canvas hidden class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

      <h2>Section title</h2>
      <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">NF</th>
              <th scope="col">Emissor</th>
              <th scope="col">Volumes</th>
              <th scope="col">Numeração geral</th>
              <th scope="col">Liquido NF</th>
            </tr>
          </thead>
          <tbody>
            <?php 

            $queryu = "SELECT nf.id as idNF, nf.nNF,nf.qtdvol as qtd ,nf.Numeracao_item as itemNaNf, em.xNome as emissor , nf.transport as transportadora, nf.Pliquido as LiqNf from nf_ident nf JOIN nf_itens it JOIN empresas em on nf.emissor = em.id GROUP by nf.nNF

            ";
// por enquanto SELECT nf.nNF,nf.qtdvol as qtd , em.xNome as emissor , nf.transport as transportadora from nf_ident nf JOIN nf_itens it JOIN empresas em on nf.emissor = em.id GROUP by  nNf;;

            $resultado = $con ->prepare($queryu);
            $resultado ->execute();


            while ($linha=$resultado->fetch()) {
              ?>

              <tr>

                <td> <a href="index.php?p=2&nf=<?php echo($linha['idNF'])?>">Abrir</a>  </td>
                <td><?php echo $linha['nNF']; ?></td>
                <td><?php echo $linha['emissor']; ?></td>
                <td><?php if ($linha['qtd']==0) {
                  echo   "Ver itens";
                }else{
                  echo $linha['qtd'];

                } ?></td>
                <td><?php 
                if ($linha['itemNaNf'] == (null or 0)) {
                  echo "Sem identificação em nota";
                }else{ echo $linha['itemNaNf']; } ?></td>
                <td><?php echo $linha['LiqNf']; ?></td>
              
              </tr>

              <?php
            }
            ?>
            
          </tbody>
        </table>
      </div>
    </main>