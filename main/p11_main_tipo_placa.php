    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Tipo de placas</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#novo_tipo_placa">Novo</button>
          </div>
        </div>
      </div>
      
      <h2></h2>
      <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Tipo</th>
            </tr>
          </thead>
          <tbody>
            <?php 
            $queryu = "SELECT  * from tipo_placa";
            $resultado = $con ->prepare($queryu);
            $resultado ->execute();
            $cnt = 1;
            while ($linha=$resultado->fetch()) {
              ?>
              <tr>
                <td>Editar - Excluir</td>
                <td><?php echo $linha['tipo']; ?></td>
              </tr>
              <?php
            }
            ?>
            
          </tbody>
        </table>
      </div>


<!-- Modal -->
<div class="modal fade" id="novo_tipo_placa" tabindex="-1" aria-labelledby="label_tipo_placa" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="label_tipo_placa">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        

         <form method="post" action="func/p11_cad_tipo_placa.php" id="cad_tipo_placa">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Tipo:</label>
            <input type="text" class="form-control" id="tipo_placa">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Descrição:</label>
            <input type="text" class="form-control" id="descricao_placa">
          </div>
        </form>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" form="cad_tipo_placa">Salvar</button>
      </div>
    </div>
  </div>
</div>




    </main>