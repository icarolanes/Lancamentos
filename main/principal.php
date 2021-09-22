<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Lançamentos desc</h1>
    </div>
    <canvas class="my-4 w-100" id="myChart" width="1000" height="300">Evolução de operação por periodo</canvas>
    <script type="text/javascript" src="js/p0_chart.js"></script>
    <h3>Ultimos 5 lançamentos</h3>
    <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Documento</th>
                    <th scope="col">Empresa</th>
                    <th scope="col">Placa</th>
                    <th scope="col">Ori/Dest</th>
                    <th scope="col">Data ref</th>
                    <th scope="col">periodo</th>
                    <th scope="col">liquido</th>
                </tr>
            </thead>
            <tbody>
                <?php 
        $queryu = "call ultimos_lancamentos()";
        $resultado = $con ->prepare($queryu);
        $resultado ->execute();
        $cnt = 1;
        while ($linha=$resultado->fetch()) {
          ?>
                <tr>
                    <td>Abrir</td>
                    <td><?php echo $linha['tipo']; ?></td>
                    <td><?php echo $linha['documento']; ?></td>
                    <td><?php echo $linha['responsavel']; ?></td>
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
    </div>
</main>