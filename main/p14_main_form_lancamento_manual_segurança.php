    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Lançamento de dados</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
        </div>
      </div>
      <script type='text/javascript'>
        $(document).ready(function(){
          $("input[name='cpf']").blur(function(){
            var $motorista = $("input[name='motorista']");
            $.getJSON('funcao.php',{ 
              cpf: $( this ).val() 
            },function( json ){
              $motorista.val( json.motorista );
            });
          });
        });
      </script>
      <?php 
$tp = $_POST['tp'];// id do tipo de operação
$dc = $_POST['dc'];// id documento
$pl = $_POST['pl'];// placa do veiculo
$pe = $_POST['pe'];// periodo 
$navio = $_POST['navio'];// navio 
/*
Selecionar placa se existir, coloque novamente, se não, cadastre. consulte tambem o motorista após o envio desse formulario para outro formulario, para confirmar empresa cliente.
form 1
Tipo - select
Select de documentos
Placa - Realize
Select de periodos
___________
form 2
chave
_________
*/
?>
<div class="container-sm col-sm-12 col-md-10">
  <form class="row g-2" method="post" action="func/lanc_enviar.php">
    <div class="col-md-4">
      <label for="" class="form-label">Navio</label>
      <input  type="text" class="form-control" placeholder="nome do navio" disabled value="<?php echo $navio?>" >
      <input readonly type="number" class="form-control" name="atra" hidden placeholder="id atracacao" value="<?php echo $_GET['n']?>"  >
    </div>    
    <div  class="col-md-4">
      <label  for="" class="form-label">Operação</label>
      <?php 
      $query_busca_ope = "SELECT * FROM tipo_lancamento where id = ".$_POST['tp'];
      $prepara_ope = $con->prepare($query_busca_ope);
      $prepara_ope->execute();
      $operacao = $prepara_ope->fetch();
      ?>
      <input readonly type="text" class="form-control" value="<?php echo $operacao['nTipo']?>" placeholder="Operação">
      <input readonly type="text" class="form-control" name="oper" hidden value="<?php echo $operacao['id']?>" placeholder="Operação">
    </div>
    <div class="col-md-4">
      <label for="" class="form-label">Documento</label>
      <?php 
      $query_busca_doc = "SELECT * FROM documentos where id = ".$_POST['dc'];
      $prepara_DOC = $con->prepare($query_busca_doc);
      $prepara_DOC->execute();
      $documento = $prepara_DOC->fetch();
      ?>
      <input readonly type="text" class="form-control" value="<?php echo $documento['identificacao']?>"  placeholder="Documento">
      <input readonly type="text" class="form-control" hidden name="doc" value="<?php echo $documento['id']?>"  placeholder="Documento">
    </div>
    <div class="col-md-2">
      <label for="placa" class="form-label">Placa Cavalo</label>
      <?php 
      $query_busca_placa = "SELECT * FROM placas where placa = '".$_POST['pl']."'";
      $prepara_placa = $con->prepare($query_busca_placa);
      $prepara_placa->execute();
      $contar_placa = $prepara_placa ->rowCount();
      $placa = $prepara_placa->fetch();
      if ($contar_placa>0) {
        ?>
        <input readonly type="text" class="form-control" value="<?php echo $placa['placa']?>" id="placa" placeholder="placa">
        <input readonly type="text" class="form-control" name="placa" hidden value="<?php echo $placa['id']?>"  placeholder="placa">
        <?php
      }else{
        ?>
        <!-- Button trigger modal -->
        <input readonly type="text" class="form-control" data-bs-toggle="modal" data-bs-target="#exampleModal"  placeholder="Clique aqui para cadastrar">
        <?php
        $placa['id'] = 0;
      }
      ?>
      
    </div>
    <div class="col-md-2">
      <label for="placa1" class="form-label">placa carreta 1</label>
        <input  type="text" class="form-control" name="placa2" minlength="7" maxlength="7" id="placa1"  value=""  placeholder="Carreta 1" required>
        
    </div>
    <div class="col-md-2">
      <label for="placa2" class="form-label">placa carreta 2</label>
        <input  type="text" class="form-control" name="placa3"  minlength="7" maxlength="7"  id="placa2"  value=""  placeholder="Carreta 2">
        
    </div>



    <div class="col-md-3">
      <label for="horalanc" class="form-label">Data lançamento</label>
      <input type="datetime-local" name="data" value="<?php echo(date("Y-m-d\TH:i") )?>" class="form-control" id="horalanc">
    </div>
    <div class="col-md-3">
      <label for="periodo" class="form-label">Periodo</label>
      <select id="periodo" name="pe" class="form-select">
        <?php 
        $sel_per = "SELECT pope.id as id, pope.data_ref , lper.abv as periodo from periodos_operacao pope join lista_periodos lper on pope.periodo = lper.id order by data_ref,periodo desc";
        $prepara = $con->prepare($sel_per);
        $prepara ->execute();
        ?>
        <?php 
        while ($per=$prepara->fetch()) {
          if ($_POST['pe'] == $per['id']) {
            $sel = "selected";
          }else{
            $sel = "";
          }
          echo "<option value='".$per['id']."' ".$sel.">".date('d/m-', strtotime($per['data_ref'])).$per['periodo']."</option>";
        }
        ?>
      </select>
    </div>
    
    <div class="col-md-4">
      <label for="cpf" class="form-label">CPF Motorista</label>
      <?php 
      
      $busca_motorista = "SELECT pes.cpf as motorista FROM lancamentos lanc join pessoa pes on lanc.motorista = pes.id where placa =".$placa['id'];
      $prepara_mot = $con->prepare($busca_motorista);
      $prepara_mot->execute();
      $contar_mot = $prepara_mot ->rowCount();
      if ($contar_mot>0) {
        $motori = $prepara_mot->fetch();
        $cpf_mot = $motori['motorista'];
      }else{
        $cpf_mot = 00000;
      }
      ?>
      <input type="text" name="cpf" class="form-control" id="cpf" value="<?php echo $cpf_mot;?>" placeholder="cpf" required autofocus>
      
    </div>
    <div class="col-md-4">
      <label for="motoris" class="form-label">Motorista</label>
      <input type="text" name="motorista" class="form-control" id="motoris" required placeholder="nome">
      
    </div>
    


    <div class="col-md-4">
      <label for="transp" class="form-label">CNPJ Transportadora</label>

<?php 
      
      $busca_motorista = "SELECT em.xCNPJ as transp FROM lancamentos lanc join empresas em on lanc.transp = em.id where placa =".$placa['id']." order by lanc.id desc";
      $prepara_mot = $con->prepare($busca_motorista);
      $prepara_mot->execute();
      $contar_mot = $prepara_mot ->rowCount();
      if ($contar_mot>0) {
        $transp = $prepara_mot->fetch();
        $cnpj_transp = $transp['transp'];
      }else{
        $cnpj_transp = 00000;
      }
      ?>

      <input class="form-control" list="transplist" id="transp" name="transportadora" value="<?php echo $cnpj_transp;?>" required aria-label="transp" >

      <datalist id="transplist">
        <?php 
        $query_empresa = "SELECT emp.xCNPJ, emp.xNome as transp , emp.id FROM empresas emp join lancamentos lanc on lanc.transp = emp.id group by emp.id";
        $prep = $con->prepare($query_empresa);
        $prep->execute();

        $contar_emp = $prep ->rowCount();
        if ($contar_emp > 5){

          while ($emp = $prep->fetch()) {
            echo  "<option value='".$emp['xCNPJ']."'>".$emp['transp']."</option>";
          }

        }else{

          $query_empresa_todas = "SELECT emp.xCNPJ, emp.xNome as transp , emp.id FROM empresas emp";
          $prep2 = $con->prepare($query_empresa_todas);
          $prep2->execute();

          while ($emp_N = $prep2->fetch()) {
            echo  "<option value='".$emp_N['xCNPJ']."'>".$emp_N['transp']."</option>";       
          }
        }
        ?>        
      </datalist>
    </div>
    <div class="col-md-4">
      <label for="armazem" class="form-label">Armazem</label>
      <select id="armazem" name="arma" required class="form-select">
        <option>Selecione...</option>
        <?php 
        $armazem = "SELECT * from armazem";
        $prepara_arm = $con->prepare($armazem);
        $prepara_arm ->execute();
        ?>
        <?php 
        while ($arma=$prepara_arm->fetch()) {
          echo "<option value='".$arma['id']."'>".$arma['descr']."</option>";
        }
        ?>
      </select>
    </div>
    <div class="col-md-4">
      <label for="bruto" class="form-label">Peso Bruto</label>
      <input type="number" class="form-control" name="bruto" required id="bruto">
    </div>
    
    <div class="col-md-4">
      <label for="liq" class="form-label">Peso Liquido</label>
      <input type="number" class="form-control" name="liquido"  required id="liq">
    </div>
    <div class="mb-3">
        <label for="observacao" class="form-label">Observações gerais</label>
        <textarea class="form-control" id="observacao" rows="3" name="obs"></textarea>
      </div>
    <div class="col-12">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="gridCheck">
        <label class="form-check-label" for="gridCheck">
          Enviar e voltar a formulario
        </label>
      </div>
    </div>
    <div class="col-12">
      <button type="submit" class="btn btn-primary">Enviar dados</button>
    </div>
  </form>
</div>
</main>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cadastro de placa</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="cad_placa" action="func/placa_cad.php" method="post">
          <input readonly hidden type="text" name="pagina" value="<?php echo $_SERVER['HTTP_REFERER'];?>">
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">Placa</span>
            <input type="text" class="form-control" placeholder="Placa Veículo" aria-label="placa" name="placa" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon2">Tipo</span>
            <select class="form-control" placeholder="tipo_placa" aria-label="tipo_placa" name="tipo" aria-describedby="basic-addon2">
              <?php 
              $query_tipo_placa = "SELECT * from tipo_placa";
              $prepare_tipo_placa = $con->prepare($query_tipo_placa);
              $prepare_tipo_placa->execute();
              while ($placa = $prepare_tipo_placa->fetch()) {
                echo "<option value='".$placa['id']."'>".$placa['tipo']."</option>";
              }
              ?>
            </select>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
        <button type="submit" form="cad_placa" class="btn btn-primary">Cadastrar Placa</button>
      </div>
    </div>
  </div>
</div>