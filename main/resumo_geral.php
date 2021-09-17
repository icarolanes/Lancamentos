<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <?php 
$navio = $rota[1];
?>
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">MV:</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group me-2">
                <button type="button" class="btn btn-sm btn-outline-secondary">Novo Período</button>
                <button type="button" class="btn btn-sm btn-outline-secondary">Configuração</button>
                <button type="button" onclick="window.location.href='lancamentos-<?php echo $navio?>'"
                    class="btn btn-sm btn-outline-secondary">Lançamentos</button>
                <button type="button" class="btn btn-sm btn-outline-success" data-bs-toggle="modal"
                    href="#lancar_carga">Lançar</button>
            </div>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-sm-3 row-cols-md-3  row-cols-lg-4 g-4 justify-content-between">
        <div class="col">
            <div class="card h-100">
                <h5 class="card-header">Manifestado</h5>
                <div class="card-body">
                    <h5 class="card-title" id="manifestado">MAN</h5>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <h5 class="card-header">Descarregado</h5>
                <div class="card-body">
                    <h5 class="card-title" id="descarregado">MAN</h5>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <h5 class="card-header">Saldo</h5>
                <div class="card-body">
                    <h5 class="card-title" id="saldo">MAN</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
            <thead>
                <th>Documento</th>
                <th>Beneficiario</th>
                <th>Manifestado</th>
                <th>Descarregado</th>
                <th>Saldo</th>
            </thead>
            <tbody>
                <?php 
                $queryu = ("CALL resumo_geral({$navio})");
                $resultado = $con ->prepare($queryu);
                $resultado ->execute();
                $sum_manifestado = 0;
                $sum_descarregado = 0;
                $sum_saldo = 0;
                while ($linha=$resultado->fetch()) {
      ?>
                <tr>
                    <td hidden class="documento_id"><?php echo $linha['id']; ?></td>
                    <td class="documento"><?php echo $linha['identificacao']; ?></td>
                    <td title="<?php echo $linha['empresa']; ?>"><?php echo $linha['cnpj']; ?></td>
                    <td class="manifestado">
                        <?php $sum_manifestado +=$linha['manifestado'];  echo numero($linha['manifestado']); ?></td>
                    <td class="descarregado">
                        <?php $sum_descarregado +=$linha['manifestado'];  echo numero($linha['manifestado']); ?></td>
                    <td class="saldo"><?php $sum_saldo +=$linha['manifestado'];  echo numero($linha['manifestado']); ?>
                    </td>
                </tr>
                <?php
    }
    $resultado->closeCursor();
    ?>
                <tr>
                    <td colspan="2"><b>TOTAL</b></td>
                    <td id="soma_manifestado"><b><?php echo $sum_manifestado; ?></b></td>
                    <td id="soma_descarregado"><b><?php echo $sum_descarregado; ?></b></td>
                    <td id="soma_saldo"><b><?php echo $sum_saldo; ?></b></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 row-cols-lg-4 g-4">
        <div class="col">
            <div class="card h-100">
                <h5 class="card-header">Resumo de saída</h5>
                <div class="card-body">
                    <table class="table table-sm">
                        <thead>
                            <tr>
                                <th>Dia</th>
                                <th>Periodo</th>
                                <th>Veiculos</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $res_per = "call res_saida_periodo({$navio})";
                            $pre_per = $con->prepare($res_per);
                            $pre_per->execute();
                            $soma_total = 0;
                            $soma_veiculos = 0;
                            while ($periodo = $pre_per->fetch()) {
                                ?>
                            <tr>
                                <td><?php echo $periodo['data_ref'];?></td>
                                <td><?php echo $periodo['periodo'];?></td>
                                <td><?php $soma_total +=$periodo['total']; echo $periodo['total'];?></td>
                                <td><?php $soma_veiculos +=$periodo['veiculos']; echo $periodo['veiculos'];?></td>
                            </tr>
                            <?php
                            }
                            $pre_per->closeCursor()
                            ?>
                            <tr>
                                <th colspan='2'>Totais</th>
                                <th><?php echo $soma_total;?></th>
                                <th><?php echo $soma_veiculos;?></th>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="lancar_carga" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalToggleLabel">Enviar Movimentação</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="cad_norm" action="envio_lancamento" method="post">
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="inputGroupSelect01">Documento:</label>
                            <select id="documentos" class="form-select" id="inputGroupSelect01">
                                <option selected>Selecione...</option>
                            </select>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal"
                        data-bs-dismiss="modal">Enviar com Nota fiscal</button>
                    <button class="btn btn-success" type="submit" form="cad_norm">Lançar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalToggleLabel2">Modal 2</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Hide this modal and show the first with the button below.
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-bs-target="#lancar_carga" data-bs-toggle="modal"
                        data-bs-dismiss="modal">Back to first</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    document.getElementById('manifestado').innerHTML = document.getElementById('soma_manifestado').innerHTML;
    document.getElementById('descarregado').innerHTML = document.getElementById('soma_descarregado').innerHTML;
    document.getElementById('saldo').innerHTML = document.getElementById('soma_saldo').innerHTML;
    selectEl = document.getElementById('documentos');
    documento = document.getElementsByClassName("documento");
    documento_id = document.getElementsByClassName("documento_id");
    var lista = [];

    for (co = 0; co < documento.length; co++) {
        lista.push(documento[co].innerText)
        selectEl.options.add(new Option(documento[co].innerText, documento_id[co].innerText));
    }
    </script>

</main>