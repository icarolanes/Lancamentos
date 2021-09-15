<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">MV:</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group me-2">
                <button type="button" class="btn btn-sm btn-outline-secondary">Novo Período</button>
                <button type="button" class="btn btn-sm btn-outline-secondary">Configuração</button>
                <button type="button" onclick="window.location.href='index.php?p=17&n=<?php echo $_GET['n']?>'"
                    class="btn btn-sm btn-outline-secondary">Lançamentos</button>
                <button type="button" class="btn btn-sm btn-outline-secondary">Lançar</button>
            </div>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-sm-3 g-4">
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
                $queryu = ("CALL resumo_geral(1)");
                $resultado = $con ->prepare($queryu);
                $resultado ->execute();
                $sum_manifestado = 0;
                $sum_descarregado = 0;
                $sum_saldo = 0;
                while ($linha=$resultado->fetch()) {
      ?>
                <tr>
                    <td><?php echo $linha['identificacao']; ?></td>
                    <td title="<?php echo $linha['empresa']; ?>"><?php echo $linha['cnpj']; ?></td>
                    <td><?php $sum_manifestado +=$linha['manifestado'];  echo $linha['manifestado']; ?></td>
                    <td><?php $sum_descarregado +=$linha['manifestado'];  echo $linha['manifestado']; ?></td>
                    <td><?php $sum_saldo +=$linha['manifestado'];  echo $linha['manifestado']; ?></td>
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
    <div class="row row-cols-1 row-cols-sm-3 g-4">
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
                            $res_per = "call res_saida_periodo(1)";
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
                </div>
            </div>
        </div>
        </table>
        <script>
        document.getElementById('manifestado').innerHTML = document.getElementById('soma_manifestado').innerHTML;
        document.getElementById('descarregado').innerHTML = document.getElementById('soma_descarregado').innerHTML;
        document.getElementById('saldo').innerHTML = document.getElementById('soma_saldo').innerHTML;
        </script>
</main>