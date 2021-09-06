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
                    <form id="nperi" action="banco/periodo_novo.php" method="post">
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
              <button type="button" onclick="window.open('print/resumo_operacional.php?n=<?php echo $_GET['n']?>','_blank','scrollbars=yes')" class="btn btn-sm btn-outline-secondary">Relatorio</button>
              <button type="button" data-bs-toggle="modal" href="#exampleModalToggle" class="btn btn-sm btn-outline-primary" accesskey="l">Lançar</button>
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