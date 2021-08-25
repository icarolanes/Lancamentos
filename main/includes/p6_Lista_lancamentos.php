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
            doc.identificacao     as documento,
            emp.ap                as responsavel,
            lanc.id               as ori,
            lanc.id               as nf,
            lanc.id               as motorista,
            lanc.id               as placa,
            lanc.id               as data,
            lanc.id               as dope,
            lanc.id               as periodo,
            lanc.liquido          as liquido 
            from lancamentos lanc 
            join documentos doc on doc.id = lanc.documento

            join empresas emp on emp.id = doc.empresa

            WHERE lanc.atracacao = ".$_GET['n']."
            order by lanc.id";

//query total para contagem de itens
            $query_pag = "SELECT * from lancamentos lanc WHERE lanc.atracacao = ".$_GET['n'];
//executa a query de contagem
            $resultado_pag = $con ->prepare($query_pag);
            $resultado_pag ->execute();
            $contar_lanc = $resultado_pag ->rowCount();
            if (!isset($_GET['page'])) {
              $page = 1 ; 
              $navant = 1;
            }else{
              $page = $_GET['page'];
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
$qpp = 20; //quantidade por paginas
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
    <td><?php echo $linha['data']; ?></td>
    <td title="<?php echo $linha['dope']; ?>"><?php echo $linha['periodo']; ?></td>
    <td><?php echo $linha['liquido']; ?></td>
  </tr>
  <?php
}
?>
</tbody>
</table>

<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="index.php?<?php echo "p=".$_GET['p']."&n=".$_GET['n']."&page=". $navant ?>">Anterior
    </a></li>
    <?php  
//paginação
    $pages = $contar_lanc / $qpp;
    $nav = 1;
    for ($i=0; $i < $pages ; $i++) { 
      ?>
      <li class="page-item"><a class="page-link" href="index.php?<?php echo "p=".$_GET['p']."&n=".$_GET['n']."&page=". $nav ?>"><?php echo $nav++ ?></a></li>
      <?php  
    }
    ?>
    <li class="page-item"><a class="page-link" href="index.php?<?php echo "p=".$_GET['p']."&n=".$_GET['n']."&page=". $navprox ?>">Proxima</a></li>
  </ul>
</nav>
</div>