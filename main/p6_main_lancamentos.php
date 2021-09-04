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
//menu de atracação aberta.
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
        include_once('includes/p6_atracacao_selecao.php');
      }else{
        include_once('includes/p6_lista_lancamentos.php');
      }
      ?>

    </main>

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