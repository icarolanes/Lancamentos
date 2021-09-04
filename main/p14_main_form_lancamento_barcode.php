<?php

$navio = $_POST['navio'];// navio 
$chave = $_POST['chave'];


$querychave = "SELECT 
nf.chave as chave, 
nf.serie as serie, 
nf.tpNF as tipo, 
nf.dhEmi as emissao, 
emi.xCNPJ as emissor_cnpj, 
emi.xNome as emissor_nome,
emi.id as emissorid,
nf.qtdvol as qtde, 
nf.Numeracao_item as identificacao, 
nf.Pbruto as bruto, 
nf.Pliquido as liquido, 
nf.vProd as valorproduto, 
nf.vNF as valornota, 
tra.xCNPJ as transporte_cnpj, 
tra.xNome as transporte_nome, 
nf.info_comp_nota as infomais, 
nf.nNF as numero_nota 
FROM nf_ident nf 
join empresas emi on nf.emissor = emi.id
join empresas tra on nf.transport = tra.id
where chave like '".$chave."' limit 1" ;
$preparenf = $con->prepare($querychave);
$preparenf->execute();

$conta_busa = $preparenf ->rowCount();
if ($conta_busa == 0) {
  header('Location: http://localhost/files/Lancamentos/index.php?p=15&chave='.$chave);
  die();
}else{}

$nota = $preparenf->fetch()
?>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Lançamento de dados Com nota em mão</h1>
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
  <div class="container-sm col-md-8">
    <form class="row g-2" method="post" action="func/lanc_enviar.php">

      <div class="col-md-8">
        <label for="" class="form-label">chave</label>
        <input type="text" class="form-control" name="chave" value="<?php echo $chave?>" readonly>
      </div>

      <div class="col-md-4">
        <label for="" class="form-label">Navio</label>
        <input  type="text" class="form-control" placeholder="nome do navio" disabled value="<?php echo $navio?>"  >
        <input readonly type="number" class="form-control" name="atra" hidden placeholder="id atracacao" value="<?php echo $_GET['n']?>"  >
      </div>    
      <div class="col-md-2">
        <label for="" class="form-label">Nº nota</label>
        <input type="text" class="form-control" name="numero_nota" value="<?php echo $nota['numero_nota']?>" readonly>
      </div>
      <div class="col-md-1">
        <label for="" class="form-label">Serie</label>
        <input type="text" class="form-control" name="serie" value="<?php echo $nota['serie']?>" readonly>
      </div>

      <div class="col-md-1">
        <label for="" class="form-label">Tipo</label>
        <input type="text" class="form-control" name="tipo" value="<?php echo $nota['tipo']?>" readonly>
      </div>

      <div class="col-md-4">
        <label for="" class="form-label">Emissor</label>
        <input type="text" class="form-control" name="emissor_nome" value="<?php echo $nota['emissor_nome']?>" readonly>
      </div>
      

      <div class="col-md-4">
        <label for="transp" class="form-label">CNPJ Transportadora</label>
        <input class="form-control" id="transp" name="transportadora" value="<?php echo $nota['transporte_nome']?>" aria-label="transp" readonly>

      </div>
      <div class="col-md-3">
        <label for="num" class="form-label">Numeração </label>
        <input type="text" class="form-control" name="numeracao" value="<?php echo $nota['identificacao']?>" id="num" readonly>
      </div>
      <div class="col-md-3">
        <label for="vol" class="form-label">Volumes</label>
        <input type="number" class="form-control" name="volumes" value="<?php echo $nota['qtde']?>" id="vol" readonly>
      </div>

      <div class="col-md-3">
        <label for="brut" class="form-label">Peso Bruto</label>
        <input type="number" class="form-control" name="bruto" value="<?php echo $nota['bruto']?>" id="brut" readonly>
      </div>

      <div class="col-md-3">
        <label for="liq" class="form-label">Peso Liquido</label>
        <input type="number" value="<?php echo $nota['liquido']?>" class="form-control" name="liquido" id="liq" readonly>
      </div>

      <div class="col-md-4">
        <label for="horalanc" class="form-label">Data e Hora do lançamento</label>
        <input type="datetime-local" name="data" value="<?php echo(date("Y-m-d\TH:i") )?>" class="form-control" id="horalanc">
      </div>



      <div class="col-md-4">
        <label for="periodo" class="form-label">Periodo de operação</label>
        <input type="text"  value="" class="form-control" id="periodo">
      </div>


      <div class="col-md-4">
        <label for="armazem" class="form-label">Armazem</label>
        <select id="armazem" name="arma" class="form-select">
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
        <label for="docu" class="form-label">Documento por cliente</label>
        <select id="docu" name="documento" class="form-select">
          <option>Selecione...</option>
          <?php 
          $armazem = "SELECT * from documentos where empresa = ".$nota['emissorid'];
          $prepara_arm = $con->prepare($armazem);
          $prepara_arm ->execute();
          ?>
          <?php 
          while ($arma=$prepara_arm->fetch()) {
            echo "<option value='".$arma['id']."'>".$arma['identificacao']."</option>";
          }
          ?>
        </select>
      </div>

      <div class="col-md-4">
        <label for="cpf" class="form-label">CPF Motorista</label>
        <input type="text" name="cpf" class="form-control" id="cpf" value="" placeholder="cpf" autofocus>
      </div>

      <div class="col-md-4">
        <label for="motoris" class="form-label">Motorista</label>
        <input type="text" name="motorista" class="form-control" id="motoris" placeholder="nome">
      </div>

      <div class="col-md-4">
        <label for="cavalo" class="form-label">Cavalo</label>
        <input type="text" name="cavalo" class="form-control" id="cavalo" placeholder="nome">
      </div>

      <div class="col-md-4">
        <label for="carreta1" class="form-label">Carreta 1</label>
        <input type="text" name="carreta1" class="form-control" id="carreta1" placeholder="nome">
      </div>

      <div class="col-md-4">
        <label for="carreta2" class="form-label">Carreta 2</label>
        <input type="text" name="carreta2" class="form-control" id="carreta2" placeholder="nome">
      </div>

      <div class="mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">Informações complementares da nota</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" readonly><?php echo $nota['infomais']?></textarea>
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