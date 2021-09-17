<?php 
$navio = $rota[1];
?>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Lista de Lançamentos</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Documento</th>
                    <th scope="col">Empresa</th>
                    <th scope="col">NF</th>
                    <th scope="col">Placa</th>
                    <th scope="col">Ori/Dest</th>
                    <th scope="col">Data lançamento</th>
                    <th scope="col">periodo</th>
                    <th scope="col">liquido</th>
                </tr>
            </thead>
            <tbody>
                <?php 
// query dos itens a serem mostrados
              $query_lanc = "SELECT 
              lanc.id               as tipo,
              (SELECT doc.identificacao)     as documento,
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
              WHERE lanc.atracacao = ".$navio."
              order by lanc.id";
//query total para contagem de itens
              $query_pag = "SELECT * from lancamentos lanc WHERE lanc.atracacao = ".$navio;
//executa a query de contagem
              $resultado_pag = $con ->prepare($query_pag);
              $resultado_pag ->execute();
              $contar_lanc = $resultado_pag ->rowCount();
              if (!isset($rota[2])) {
                $page = 1 ; 
                $navant = 1;
              }else{
                $page = $rota[2];
                switch ($page) {
                  case '1':
                  $navant = 1;
                  $navprox = $page + 1 ;
                  break;
                  default:
                  $navant = $page-1 ;
                  $navprox = $page + 1 ;
                  break;
                }
              }
//quantidade por paginas            
              $qpp = 20; 
              $inicio = $page-1;
              $inicio = $inicio * $qpp;
              $query_limit = $query_lanc. " LIMIT  $inicio, ".$qpp;
//ececuta a query da quantidade atual
              $resultado = $con ->prepare($query_limit);
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
                    <td><?php echo $linha['nf']; ?></td>
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
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="lancamentos-<?php echo "{$navio}-{$navant}"?>">Anterior
                    </a></li>
                <?php  
//paginação
              $pages = $contar_lanc / $qpp;
              $nav = 1;
              for ($i=0; $i < $pages ; $i++) { 
                ?>
                <li class="page-item"><a class="page-link"
                        href="lancamentos-<?php echo "{$navio}-{$nav}"?>"><?php echo $nav++ ?></a>
                </li>
                <?php  
              }
              ?>
                <li class="page-item"><a class="page-link"
                        href="lancamentos-<?php echo "{$navio}-{$navprox}"?>">Proxima</a>
                </li>
            </ul>
        </nav>
    </div>
   
</main>