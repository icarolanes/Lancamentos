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
                  $sel_pla = "SELECT pla.id as id, pla.placa as placa  from lancamentos lanc join placas pla on lanc.placa = pla.id where lanc.atracacao = ".$_GET['n']."  group by pla.id";
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
            <form id="cd" oninput="verifica_chave();"  action="<?php echo $action;?>" method="post">
              <input readonly hidden type="text" name="navio" value="<?php echo $navio['Nnome'];?>">
              <label for="chaveNota" class="form-label">Codigo de barra</label>
              <input type="text" class="form-control" id="chaveNota" name="chave" maxlength="44"   required aria-describedby="ChaveHelpBlock" autofocus>
              <div class="small mt-2" id="msg">Digite ou leia a nota</div>
              <div id="ChaveHelpBlock" class="form-text">
                Realize a leitura do codigo de barras ou digite os numeros do codigo de barra
              </div>
              <div class="small mt-2" id="msg">Digite ou leia a nota</div>
            </form>
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">Voltar</button>
            <button type="submit" form="cd" id="enviar" disabled=""  class="btn btn-primary">Enviar</button>
          </div>
        </div>
      </div>
    </div>