    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Documentos Cadastrados</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
        </div>
      </div>

      

      <h2></h2>
      <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Tipo</th>
              <th scope="col">Nº documento</th>
              <th scope="col">Total manifestado</th>
              <th scope="col">Responsavel</th>
              <th scope="col">Atracação</th>
              <th scope="col">navio</th>
            </tr>
          </thead>
          <tbody>
            <?php 

            $queryu = "SELECT  td.identificacao as tipo, d.identificacao, em.xCNPJ as cnpj, em.xNome as empresa, a.Natraca as atracacao, n.Nnome as navio, d.manifestado  from documentos d join empresas em on d.empresa = em.id join atracacao a on d.atracacao = a.id join navios n on a.navio = d.atracacao join tipo_doc td on d.tipo = td.id ";
// por enquanto SELECT nf.nNF,nf.qtdvol as qtd , em.xNome as emissor , nf.transport as transportadora from nf_ident nf JOIN nf_itens it JOIN empresas em on nf.emissor = em.id GROUP by  nNf;;

            $resultado = $con ->prepare($queryu);
            $resultado ->execute();

            $cnt = 1;
            while ($linha=$resultado->fetch()) {
              
              ?>

              <tr>
                <td>Abrir</td>
                <td><?php echo $linha['tipo']; ?></td>
                <td><?php echo $linha['identificacao']; ?></td>
                <td><?php echo $linha['manifestado']; ?></td>
                <td title="<?php echo $linha['empresa']; ?>"><?php echo $linha['cnpj']; ?></td>
                <td><?php echo $linha['atracacao']; ?></td>
                <td><?php echo $linha['navio']; ?></td>
                
              </tr>

              <?php
            }
            ?>
            
          </tbody>
        </table>
      </div>
    </main>