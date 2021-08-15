    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <?php 
      if (!isset($_GET['n'])) {
        $titulo = "Atracações";
        $ativar = "hidden";
        ?>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2"><?php echo $titulo;?></h1>
        </div>

        <?php 

      }else{
        $tituloatr = "SELECT atr.id as atraca, nav.Nnome, lper.abv as periodo ,pope.data_ref as data FROM atracacao atr join navios nav on atr.navio = nav.id join periodos_operacao pope on pope.atracacao = atr.id join lista_periodos lper on pope.periodo = lper.id   WHERE atr.id = ".$_GET['n']. " order by pope.data_ref desc , pope.periodo desc limit 1";
        $prepara = $con->prepare($tituloatr);
        $prepara->execute();
        $navio = $prepara->fetch();
        $titulo = "MV ".$navio['Nnome'];
        $ativar = "";
      ?>
        


      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

        <h1 class="h2"><?php echo $titulo;?></h1>
        
        <div  <?php echo $ativar ?> class="btn-toolbar mb-2 mb-md-0">
          <div  class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-dark"><?php echo $navio['periodo']." | ".$navio['data'];?> </button>
            <button type="button" class="btn btn-sm btn-outline-dark" data-bs-toggle="modal" data-bs-target="#novo_periodo">Novo</button>
          </div>
          <div class="modal fade" id="novo_periodo" tabindex="-1" aria-labelledby="novo_peri" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="novo_peri">Modal title</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form id="nperi" action="func/periodo_novo.php" method="post">
                    <input type="number" name="atr" value="<?php echo $navio['atraca'];?>" readonly hidden>
                    <input type="text" name="responsavel" value="<?php echo $_SESSION['usuarioId'];?>" readonly hidden>
                    <div class="input-group">
                      <span class="input-group-text">Periodo e data</span>
                      <select name="peri" class="form-select" required >
                        <option>.</option>
                        <?php 
                        $novo_periodo = "select * from lista_periodos";
                        $valores= $con->prepare($novo_periodo);
                        $valores->execute();
                        while ($periodos= $valores->fetch()) {
                          echo "<option value='".$periodos['id']."' >".$periodos['periodo']."</option>";
                        }
                        ?>
                        
                      </select>
                      <input type="date"  name ="data_ref" value="<?php echo(date("Y-m-d") )?>" class="form-control">
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" form="nperi" class="btn btn-primary">Save changes</button>
                </div>
              </div>
            </div>
          </div>
          <div  class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Configuração</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Relatorios</button>
            <button type="button" data-bs-toggle="modal" href="#exampleModalToggle" class="btn btn-sm btn-outline-primary">Lançar</button>
          </div>
        </div>
      </div>

              <?php 
      }
 
      if (isset($_SESSION['mensagem'])) {
        echo $_SESSION['mensagem'];
        unset($_SESSION['mensagem']);
      }
      if (!isset($_GET['n'])) {
        $queryATR = "SELECT 
        at.id as id, 
        at.Datracacao as atraca,
        at.ope1 as inicio, 
        at.ope2 as termino, 
        at.Ddesatracacao as desatraca,
        sum(lanc.liquido) as ttoe,
        count(lanc.id) as veic,
        
        nav.nNome as navio 
        FROM atracacao at 
        join navios nav on at.navio = nav.id 
        left join lancamentos lanc on lanc.atracacao = at.id 

        WHERE at.situacao = 1 group by at.id";
        $prepara = $con->prepare($queryATR);
        $prepara->execute();
        while ($atracacao=$prepara->fetch()) {
          ?>
          

          <div class="row row-cols-1 row-cols-md-4 g-4">
            <div class="col">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">MV <?php echo $atracacao['navio'];?></h5>
                  <p class="card-text">
                    A: <?php  echo date('d/m/y H:i', strtotime($atracacao['atraca'])); ?> <br>
                    I: <?php  echo date('d/m/y H:i', strtotime($atracacao['inicio'])); ?><br>
                    T: <?php  echo date('d/m/y H:i', strtotime($atracacao['termino'])); ?><br>
                    D: <?php  echo date('d/m/y H:i', strtotime($atracacao['desatraca'])); ?> <br>
                  </p>
                  <button onclick="window.location.href='index.php?p=6&n=<?php echo $atracacao['id']?>'" class="btn btn-primary"> abrir</button>
                </div>
                <div class="card-footer">
                  <small class="text-muted"><?php echo "TTo: ". ($atracacao['ttoe']/1000)." | Tv: ".$atracacao['veic']." "?> </small>
                </div>
              </div>
            </div>
          </div>


          <?php
} // fim while
}else{
  ?>
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
        tplan.nTipo as tipo, 
        doc.identificacao as documento,
        (select arm1.descr from operacao opera join armazem arm1 on arm1.id =  opera.armazem where opera.id = lanc.operacao) as ori,
        em.ap as responsavel,
        nota.nNF as nf,
        pes.nome as motorista,
        pl.placa as placa,
        data,
        per.data_ref as dope,
        per_list.periodo as periodo,
        tara, 
        bruto, 
        liquido 
        from lancamentos lanc 
        join tipo_lancamento tplan on  lanc.tipo = tplan.id 
        join documentos doc on lanc.documento = doc.id  
        join empresas em on doc.empresa = em.id 
        left join nf_ident nota on lanc.nf = nota.id 
        join placas pl on lanc.placa = pl.id 
        join pessoa pes on lanc.motorista = pes.id 
        join periodos_operacao per on lanc.periodo = per.id 
        join lista_periodos per_list on per.periodo = per_list.id 
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
<!-- modal de lançamento -->
<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">Lançamento manual</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <?php 
        $action = "index.php?p=14&n=".$_GET['n'];
        ?>
        <form id="man" method="post" action="<?php echo $action;?>">
          <input readonly hidden type="text" name="navio" value="<?php echo $navio['Nnome'];?>">
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">Tipo</span>
            <select required id="inputtp" name="tp" class="form-select">
              <option ></option>
              <?php 
              $sel_ope = "SELECT * from tipo_lancamento";
              $prepara = $con->prepare($sel_ope);
              $prepara ->execute();
              ?>
              <?php 
              while ($lanc=$prepara->fetch()) {
                echo "<option value='".$lanc['id']."'>".$lanc['nTipo']."</option>";
              }
              ?>
            </select>
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">Documento</span>
            <select required id="inputdc" name="dc" class="form-select">
              <option ></option>
              <?php 
              $sel_doc = "SELECT doc.id as id, em.xNome as empresa, doc.identificacao as identificacao from documentos doc join empresas em on doc.empresa = em.id WHERE atracacao = ".$_GET['n'];
              $prepara = $con->prepare($sel_doc);
              $prepara ->execute();
              ?>
              <?php 
              while ($doc=$prepara->fetch()) {
                echo "<option value='".$doc['id']."' title='".$doc['empresa']."' >".$doc['identificacao']."</option>";
              }
              ?>
            </select>
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">Placa</span>
            <input required class="form-control" list="datalistOptions" id="exampleDataList" name="pl"  placeholder="Placa - Realize consulta de ultimas placas nesse navio" minlength="7" maxlength="7" aria-label="Placa" autocomplete="off">
            <datalist id="datalistOptions">
              <?php 
              $sel_pla = "SELECT pla.id as id, pla.placa as placa  from lancamentos lanc join placas pla on lanc.placa = pla.id  group by pla.placa";
              $prepara_pl = $con->prepare($sel_pla);
              $prepara_pl ->execute();
              ?>
              <?php 
              while ($pla=$prepara_pl->fetch()) {
                echo "<option value='".$pla['placa']."'>".$pla['placa']."</option>";
              }
              ?>
            </datalist>
          </div>
          
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">Periodo</span>
            <select required id="inputpe" name="pe" class="form-select">
              <option ></option>
              <?php 
              $sel_per = "SELECT pope.id as id, pope.data_ref , lper.abv as periodo from periodos_operacao pope join lista_periodos lper on pope.periodo = lper.id order by data_ref desc ,periodo desc";
              $prepara = $con->prepare($sel_per);
              $prepara ->execute();
              ?>
              <?php 
              while ($per=$prepara->fetch()) {
                echo "<option value='".$per['id']."' >".$per['data_ref']." | ".$per['periodo']."</option>";
              }
              ?>
            </select>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-warning"  data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">Lançar com nota em mãos</button>
        <button type="submit" form="man"  name="asd" value="asd" class="btn btn-primary">Enviar</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">Recebimento via NF</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="cd" action="<?php echo $action;?>" method="post">
          <input readonly hidden type="text" name="navio" value="<?php echo $navio['Nnome'];?>">
          
          <label for="inputchave" class="form-label">Codigo de barra</label>
          <input type="number" id="inputchave" name="chave" class="form-control"  required aria-describedby="ChaveHelpBlock"  autocomplete="off">
          <div id="ChaveHelpBlock" class="form-text">
            Realize a leitura do codigo de barras ou digite os numeros do codigo de barra
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">Voltar</button>
        <button type="submit" form="cd" class="btn btn-primary">Enviar</button>
      </div>
    </div>
  </div>
</div>
<?php
}
?>
</div>
</main>
