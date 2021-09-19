<?php 
      /*função de buscar e verificar se ja está cadastrado a placa*/
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
      } 
      // fim busca cavalo
      //função de cadastro de placa
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
      }
      //fim cadastra cavalo
?>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Lançamento de dados</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group me-2">
                <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
            </div>
        </div>
    </div>
    <script type='text/javascript'>
    //função de buscar nome de motorista com o cpf
    $(document).ready(function() {
        $("input[name='cpf']").blur(function() {
            var $motorista = $("input[name='motorista']");
            $.getJSON('funcao.php', {
                cpf: $(this).val()
            }, function(json) {
                $motorista.val(json.motorista);
            });
        });
    });
    </script>
    <div class="container-sm col-sm-12 col-md-10">
        <form class="row g-2" method="post" action="banco/lanc_enviar.php">
            <div class="col-md-4">
                <label for="" class="form-label">Navio</label>
                <input type="text" class="form-control" placeholder="nome do navio" disabled value="">
                <input readonly type="number" class="form-control" name="atra" hidden placeholder="id atracacao"
                    value="">
            </div>
            <div class="col-md-4">
                <label for="" class="form-label">Documento</label>
                <input readonly type="text" class="form-control" value="" placeholder="Documento">
                <input readonly type="text" class="form-control" hidden name="doc" value="" placeholder="Documento">
            </div>
            <div class="col-md-4">
                <label for="tp_ope" class="form-label">Tipo de Operação</label>
                <select id="tp_ope" class="form-select" name="tp">
                </select>
            </div>
            <div class="col-md-2">
                <label for="placa" class="form-label">Placa Cavalo</label>
                <input readonly type="text" class="form-control" value="" placeholder="placa" hidden name="placa">
                <input readonly type="text" class="form-control" value="" id="placa" placeholder="placa">
            </div>
            <div class="col-md-2">
                <label for="placa1" class="form-label">placa carreta 1</label>
                <input type="text" class="form-control" name="carreta[]" minlength="7" maxlength="7" id="placa1"
                    value="" placeholder="Carreta 1" required>
            </div>
            <div class="col-md-2">
                <label for="placa2" class="form-label">placa carreta 2</label>
                <input type="text" class="form-control" name="carreta[]" minlength="7" maxlength="7" id="placa2"
                    value="" placeholder="Carreta 2">
            </div>
            <div class="col-md-3">
                <label for="horalanc" class="form-label">Data lançamento</label>
                <input type="datetime-local" name="data" value="<?php echo(date("Y-m-d\TH:i") )?>" class="form-control"
                    id="horalanc">
            </div>
            <div class="col-md-3">
                <label for="periodo" class="form-label">Periodo</label>
                <input readonly id="periodo" name="pe" class="form-control" value="">
            </div>
            <div class="col-md-4">
                <label for="cpf" class="form-label">CPF Motorista</label>
                <input type="text" name="cpf" class="form-control" id="cpf" value="" placeholder="cpf" required
                    autofocus>
            </div>
            <div class="col-md-4">
                <label for="motoris" class="form-label">Motorista</label>
                <input type="text" name="motorista" class="form-control" id="motoris" required placeholder="nome">
            </div>
            <div class="col-md-4">
                <label for="transp" class="form-label">CNPJ Transportadora</label>
                <input class="form-control" list="transplist" id="transp" name="transportadora" value="" required
                    aria-label="transp">
                <datalist id="transplist">
                </datalist>
            </div>
            <div class="col-md-4">
                <label for="operacao" class="form-label">Armazem</label>
                <select id="operacao" name="arma" required class="form-select">
                    <option>Selecione...</option>
                </select>
            </div>
            <div class="col-md-4">
                <label for="bruto" class="form-label">Peso Bruto</label>
                <input type="number" class="form-control" name="bruto" required id="bruto">
            </div>
            <div class="col-md-4">
                <label for="liq" class="form-label">Peso Liquido</label>
                <input type="number" class="form-control" name="liquido" required id="liq">
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