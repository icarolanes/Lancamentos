    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Navios cadastrados</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group me-2">
                    <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                </div>
            </div>
        </div>
        <h2></h2>
        <div class="table-responsive">
            <table class="table table-hover table-striped table-sm">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Navio</th>
                        <th scope="col">imo</th>
                        <th scope="col">tamanho</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
            $queryu = "SELECT * from navios ";
            $resultado = $con ->prepare($queryu);
            $resultado ->execute();
            $cnt = 1;
            while ($linha=$resultado->fetch()) {
              ?>
                    <tr>
                        <td>Abrir</td>
                        <td><?php echo $linha['Nnome']; ?></td>
                        <td><?php echo $linha['imo']; ?></td>
                        <td><?php echo "Não cadastrado" ?></td>
                    </tr>
                    <?php
            }
            ?>
                </tbody>
            </table>
        </div>
    </main>