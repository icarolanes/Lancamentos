  <?php

  $page = $_SERVER['PHP_SELF'];
  $sec = "3";
  ?>

  <meta http-equiv="refresh" content="<?php echo $sec?>;URL='<?php echo $page?>'">






  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
      <h1 class="h2">Lançamentos desc</h1>
      <div class="btn-toolbar mb-2 mb-md-0">
        <div class="btn-group me-2">
          <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
          <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
        </div>
        <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
          <span data-feather="calendar"></span>
          This week
        </button>
      </div>
    </div>

    <canvas   class="my-4 w-100" id="por_periodo" width="1000" height="300">Evolução de operação por periodo</canvas>


    <h3>Ultimos 5 lançamentos</h3>
    <div class="table-responsive">
      <table class="table table-hover table-striped table-sm">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Tipo</th>
            <th scope="col">Documento</th>
            <th scope="col">Empresa</th>
            <th scope="col">Placa</th>
            <th scope="col">Ori/Dest</th>
            <th scope="col">Data ref</th>
            <th scope="col">periodo</th>
            <th scope="col">liquido</th>
          </tr>
        </thead>
        <tbody>
          <?php 

          $queryu = "SELECT 
            lanc.id               as tipo,
            doc.identificacao     as documento,
            emp.ap                as responsavel,
            lanc.id               as ori,
            lanc.nf               as nf,
            lanc.id               as motorista,
            (select p.placa from placas p where p.id = lanc.placa)            as placa,
            lanc.data             as data,
            pope.data_ref         as dope,
            (select abv from lista_periodos where id = pope.periodo)          as periodo,
            lanc.liquido          as liquido 
            from lancamentos lanc 
            join documentos doc on doc.id = lanc.documento
            join empresas emp on emp.id = doc.empresa
            join periodos_operacao pope on pope.id = lanc.operacao



          ";

          $resultado = $con ->prepare($queryu);
          $resultado ->execute();

          $cnt = 1;
          while ($linha=$resultado->fetch()) {


              // id`, `tipo`, `documento`, `responsavel`, `nf`, `transp`, `motorista`, `placa`, `data`, `periodo`, `tara`, `bruto`, `liquido`, `porao`
            ?>

            <tr>
              <td>Abrir</td>
              <td><?php echo $linha['tipo']; ?></td>
              <td><?php echo $linha['documento']; ?></td>
              <td><?php echo $linha['responsavel']; ?></td>
              <td title="<?php echo $linha['motorista']; ?>"><?php echo $linha['placa']; ?></td>
              <td><?php echo $linha['ori']; ?></td>
              <td><?php echo date('d/m H:i', strtotime($linha['data'])); ?></td>
              <td><?php echo  periodo($linha['dope'],$linha['periodo']) ?></td>
              <td><?php echo $linha['liquido']; ?></td>

            </tr>

            <?php
          }
          ?>

        </tbody>
      </table>
    </div>
  </main>