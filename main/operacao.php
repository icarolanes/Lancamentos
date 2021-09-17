<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Operações</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group me-2">
                <button type="button" class="btn btn-sm btn-outline-secondary">Nova Operação</button>
            </div>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <?php 
    $queryATR = "SELECT 
    at.id as id, 
    at.Datracacao as atraca,
    at.ope1 as inicio, 
    at.ope2 as termino, 
    at.Ddesatracacao as desatraca,
    sum(lanc.liquido) as ttoe,
    count(lanc.id) as veic,
    nav.nNome as navio 
    FROM atracacao at 
    join navios nav on at.navio = nav.id 
    left join lancamentos lanc on lanc.atracacao = at.id 
    
    WHERE at.situacao = 1 group by at.id";
    $prepara = $con->prepare($queryATR);
    $prepara->execute();
    while ($atracacao=$prepara->fetch()) {
    ?>
        <div class="col">
            <div class="card h-100">
                <div class="card-header">
                    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                        <div class="btn-group me-2 btn-group-sm" role="group" aria-label="First group">
                            <button type="button" class="btn btn-outline-secondary">COP</button>
                            <button type="button" class="btn btn-outline-secondary">SOF</button>
                            <button type="button" class="btn btn-outline-secondary">ROP</button>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Third group">
                            <button type="button"
                                onclick="window.location.href='resumo_geral-<?php echo $atracacao['id']?>'"
                                class="btn btn-outline-success">Abrir</button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class="card-title">MV: <?php echo $atracacao['navio'];?></h5>
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th scope="col">Situação</th>
                                <th scope="col">Hora</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Atracação</th>
                                <td> <?php  echo date('d/m/y H:i', strtotime($atracacao['atraca'])); ?></td>
                            </tr>
                            <tr>
                                <th scope="row">Inicio de Operação</th>
                                <td> <?php  echo date('d/m/y H:i', strtotime($atracacao['inicio'])); ?></td>
                            </tr>
                            <tr>
                                <th scope="row">Termino de operação</th>
                                <td> <?php  echo date('d/m/y H:i', strtotime($atracacao['termino'])); ?></td>
                            </tr>
                            <tr>
                                <th scope="row">Desatracação</th>
                                <td> <?php  echo date('d/m/y H:i', strtotime($atracacao['desatraca'])); ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    <small
                        class="text-muted"><?php echo "TTo: ". ($atracacao['ttoe']/1000)." | Tv: ".$atracacao['veic']." "?>
                    </small>
                </div>
            </div>
        </div>
        <?php
    }
    ?>
    </div>
</main>