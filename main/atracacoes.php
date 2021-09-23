    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Controle de Atracações</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group me-2">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal"
                        data-bs-target="#cad_atracacao">Nova Atracação</button>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-hover table-striped table-sm">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Navio</th>
                        <th scope="col">Nº Atracação</th>
                        <th scope="col">Atracação</th>
                        <th scope="col">Inicio OPE</th>
                        <th scope="col">Termino OPE</th>
                        <th scope="col">Desatracação</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
            $queryu = "SELECT n.Nnome as navio, Natraca, Datracacao, ope1, ope2, Ddesatracacao  from atracacao a join navios n on n.id = a.navio ";
            $resultado = $con ->prepare($queryu);
            $resultado ->execute();
            $cnt = 1;
            while ($linha=$resultado->fetch()) {
              ?>
                    <tr>
                        <td>Abrir</td>
                        <td><?php echo $linha['navio']; ?></td>
                        <td><?php echo $linha['Natraca']; ?></td>
                        <td><?php echo $linha['Datracacao']; ?></td>
                        <td><?php echo $linha['ope1']; ?></td>
                        <td><?php echo $linha['ope2']; ?></td>
                        <td><?php echo $linha['Ddesatracacao']; ?></td>
                    </tr>
                    <?php
            }
            ?>
                </tbody>
            </table>
        </div>
    </main>
    <?php 
    include_once('Modais.html');
    ?>