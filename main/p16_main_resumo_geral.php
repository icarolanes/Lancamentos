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
    <div class="row row-cols-1 row-cols-sm-5 g-4">

        <div class="col">
            <div class="card h-100">
                <h5 class="card-header">Manifestado</h5>
                <div class="card-body">
                    <h5 class="card-title">5.000.000</h5>
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

    $queryu = "SELECT  td.identificacao as tipo, d.identificacao, em.xCNPJ as cnpj, em.xNome as empresa, a.Natraca as atracacao, n.Nnome as navio, d.manifestado  from documentos d join empresas em on d.empresa = em.id join atracacao a on d.atracacao = a.id join navios n on a.navio = d.atracacao join tipo_doc td on d.tipo = td.id where a.id = ".$_GET['n'];

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
    ?>
                <tr>
                    <td colspan="2"><b>TOTAL</b></td>
                    <td><b><?php echo $sum_manifestado; ?></b></td>
                    <td><b><?php echo $sum_descarregado; ?></b></td>
                    <td><b><?php echo $sum_saldo; ?></b></td>
                </tr>

            </tbody>
        </table>
    </div>
</main>