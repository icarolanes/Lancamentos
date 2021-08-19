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

//essa consulta é generica, aparece todas as notas fiscais, mesmo se nota ja foi utilizada. após a implementação, de uso de nota, utilize uma consulta para verificar se foi utilizada ou não.

// query das notas a serem mostrados
            $queryu = "SELECT 
            nf.id             as idNF,
            nf.nNF,
            nf.qtdvol         as qtd ,
            nf.Numeracao_item as itemNaNf, 
            em.xNome          as emissor , 
            nf.transport      as transportadora, 
            nf.Pliquido       as LiqNf 
            from nf_ident nf JOIN nf_itens it JOIN empresas em on nf.emissor = em.id GROUP by nf.id order by nf.id desc";
//query total para contagem de itens
            $query_pag = "SELECT * from nf_ident ";

//executa query de contagem
            $resultado_pag = $con ->prepare($query_pag);
            $resultado_pag ->execute();
            $contar_lanc = $resultado_pag->rowCount();
            if (!isset($_GET['page'])) {
              $page = 1;
              $navant = 1;
            }else{
              $page = $_GET['page'];
              switch ($page) {
                case '1':
                $navant = 1;
                $navprox = $page + 1;
                break;

                default:
                $navant = $page-1;
                $navprox = $page + 1;
                break;
              }
            }

$qpp = 20; //quantidade por paginas
$inicio = $page-1;
$inicio = $inicio * $qpp;
$query_limit = $queryu. " LIMIT  $inicio, ".$qpp;
//ececuta a query da quantidade atual
$resultado = $con ->prepare($query_limit);
$resultado ->execute();
$cnt = 1;
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

<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="index.php?<?php echo "p=".$_GET['p']."&page=". $navant ?>">Anterior
    </a></li>
    <?php  
//paginação
    $pages = $contar_lanc / $qpp;
    $nav = 1;
    for ($i=0; $i < $pages ; $i++) { 
      ?>
      <li class="page-item"><a class="page-link" href="index.php?<?php echo "p=".$_GET['p']."&page=". $nav ?>"><?php echo $nav++ ?></a></li>
      <?php  
    }
    ?>
    <li class="page-item"><a class="page-link" href="index.php?<?php echo "p=".$_GET['p']."&page=". $navprox ?>">Proxima</a></li>
  </ul>
</nav>
</div>

