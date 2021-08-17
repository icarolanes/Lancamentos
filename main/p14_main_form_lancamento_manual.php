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




function busca_carreta ($cavalo,$con){
  $select = "SELECT * FROM placas where placa like '".$cavalo."' limit 1";
  $prepare_placa = $con->prepare($select);
  $prepare_placa->execute();
  $contar_plac = $prepare_placa->rowCount(); 
  if ($contar_plac>0) {
    $pla=$prepare_placa->fetch();
    $cavalo_n['id'] = $pla['id'];
    $cavalo_n['placa'] = $pla['placa'];
    


    return($cavalo_n);

  }else{
    cadastra_carreta($cavalo,$con);
  }
} // fim busca cavalo






function cadastra_carreta ($carreta,$con){
  $inser = "INSERT INTO placas (`placa`,`tipo`) VALUES ('$carreta','1')";
  $prepare_ins = $con->prepare($inser);
  $prepare_ins->execute();
  $contar_plac_cad = $prepare_ins->rowCount(); 
  if ($contar_plac_cad>0) {
    $carreta = $carreta;
    busca_carreta($carreta,$con);
  }else{
    return_form();
  }
}//fim cadastra cavalo

















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



      $cavalo_final = busca_carreta($_POST['pl'],$con);

      while($cavalo_final == null){
        $cavalo_final = busca_carreta($_POST['pl'],$con);
      }

      $cavalo_final = busca_carreta($_POST['pl'],$con);

//$cavalo_final = $cavalo;



      ?>
      <input readonly type="text" class="form-control" value="<?php echo $cavalo_final['id']?>"  placeholder="placa" hidden name="placa">

      <input readonly type="text" class="form-control" value="<?php echo $cavalo_final['placa']?>" id="placa" placeholder="placa">


    </div>
    <div class="col-md-2">
      <label for="placa1" class="form-label">placa carreta 1</label>
      <?php
      $b_car_cav = "SELECT pl.placa as placa from lancamentos lanc join placas pl on lanc.carreta1 = pl.id  where lanc.placa = 11";
      $preparar_car=$con->prepare($b_car_cav);
      $preparar_car->execute();
      $contar_car = $preparar_car ->rowCount();

      if($contar_car>0){
        $carreta_car = $preparar_car->fetch(); 

      }else{

        $carreta_car['placa'] = "0";
      }

      ?>

      <input  type="text" class="form-control" name="carreta[]" minlength="7" maxlength="7" id="placa1"  value="<?php echo $carreta_car['placa']?>"  placeholder="Carreta 1" required>

    </div>
    <div class="col-md-2">
      <label for="placa2" class="form-label">placa carreta 2</label>
      <input  type="text" class="form-control" name="carreta[]"  minlength="7" maxlength="7"  id="placa2"  value=""  placeholder="Carreta 2">
    </div>



    <div class="col-md-3">
      <label for="horalanc" class="form-label">Data lançamento</label>
      <input type="datetime-local" name="data" value="<?php echo(date("Y-m-d\TH:i") )?>" class="form-control" id="horalanc">
    </div>
    <div class="col-md-3">
      <label for="periodo" class="form-label">Periodo</label>
        <?php 
        $sel_per = "SELECT pope.id as id, pope.data_ref , lper.abv as periodo from periodos_operacao pope join lista_periodos lper on pope.periodo = lper.id order by data_ref,periodo desc";
        $prepara = $con->prepare($sel_per);
        $prepara ->execute();
        $per = $prepara->fetch();

        $periodo_text =  date('d/m-', strtotime($per['data_ref'])).$per['periodo'];
        ?>
      <input readonly  id="periodo" name="pe" class="form-control" value="<?php echo $periodo_text;?>">
    </div>

    <div class="col-md-4">
      <label for="cpf" class="form-label">CPF Motorista</label>
      <?php 

      $busca_motorista = "SELECT pes.cpf as motorista FROM lancamentos lanc join pessoa pes on lanc.motorista = pes.id where placa =".$cavalo_final['id'];
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

      $busca_motorista = "SELECT em.xCNPJ as transp FROM lancamentos lanc join empresas em on lanc.transp = em.id where placa =".$cavalo_final['id']." order by lanc.id desc";
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
      <label for="operacao" class="form-label">Armazem</label>
      <select id="operacao" name="arma" required class="form-select">
        <option>Selecione...</option>
        <?php 
        $armazem = "SELECT * from operacao ";
        $prepara_arm = $con->prepare($armazem);
        $prepara_arm ->execute();
        ?>
        <?php 
        while ($arma=$prepara_arm->fetch()) {
          echo "<option value='".$arma['id']."'>".$arma['armazem']."</option>";
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