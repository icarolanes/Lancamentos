    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Usuarios cadastrados</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Novo</button>
          </div>
        </div>
      </div>
  
      <h2></h2>
      <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nome</th>
              <th scope="col">usuario</th>
              <th scope="col">cpf</th>
              <th scope="col">Nivel</th>
            </tr>
          </thead>
          <tbody>
            <?php 
            $queryu = "SELECT * from usuarios u join pessoa p on u.nome = p.id join tipo_usuario tu on u.tipo = tu.id ";
            $resultado = $con ->prepare($queryu);
            $resultado ->execute();
            $cnt = 1;
            while ($linha=$resultado->fetch()) {
              
              ?>
              <tr>
                <td>Abrir</td>
                <td><?php echo $linha['nome']; ?></td>
                <td><?php echo $linha['usuario']; ?></td>
                <td><?php echo $linha['cpf']; ?></td>
                <td><?php echo $linha['tipo']; ?></td>
              </tr>
              <?php
            }
            ?>
          </tbody>
        </table>
      </div>
    </main>