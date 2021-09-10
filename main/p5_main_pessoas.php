   
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Pessoas cadastradas</h1>
    <div class="btn-toolbar mb-2 mb-md-0">
      <div class="btn-group me-2">
        <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#nova_pessoa">novo</button>
      </div>
    </div>
  </div>

  <?php 
  if (isset($_SESSION['mensagem'])) {
    echo $_SESSION['mensagem'];
    unset($_SESSION['mensagem']);
  }
  ?>
  <h2></h2>
  <div class="table-responsive">
    <table class="table table-hover table-striped table-sm">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Nome</th>
          <th scope="col">sobrenome</th>
          <th scope="col">cpf</th>
        </tr>
      </thead>
      <tbody>
        <?php 
        $queryu = "SELECT * from pessoa ";
        $resultado = $con ->prepare($queryu);
        $resultado ->execute();
        $cnt = 1;
        while ($linha=$resultado->fetch()) {
          ?>
          <tr>
            <td>Abrir</td>
            <td><?php echo $linha['nome']; ?></td>
            <td><?php echo $linha['sobrenome']; ?></td>
            <td><?php echo $linha['cpf']; ?></td>
            
          </tr>
          <?php
        }
        ?>
      </tbody>
    </table>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="nova_pessoa" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
          <button id="fecha_modal" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">

          <form id="form_nova_pessoa" oninput="valida_cpf(cpf.value);" action="#" method="post">
            <div class="mb-3">
              <label for="nome" class="form-label">Nome</label>
              <input type="text" class="form-control" name="nome" id="nome" required>
            </div>
            <div class="mb-3">
              <label for="sobrenome" class="form-label">Sobrenome</label>
              <input type="text" class="form-control" name="sobrenome" id="sobrenome" required>
            </div>
            <div class="mb-3">
              <label for="cpf"  class="form-label">CPF</label>
              <input type="text"  class="form-control" id="cpf" name="cpf" maxlength="14">
            </div>
          </form>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" id="salvar" form="form_nova_pessoa" class="btn btn-primary" disabled>Salvar</button>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
    $('#form_nova_pessoa').submit(function(e){
          e.preventDefault();//pare o processamento do submit para rodar algumas coisas e depois finalize o processo
          $form = $(this);   //reconhece formulario
          var formdata = new FormData($form[0]); // dados de formulario
          //criar conexao
          var request = new XMLHttpRequest();

          //conexao de arquivo
          request.open('post','banco/p5_form_pessoa.php');
          request.send(formdata);
          document.getElementById('form_nova_pessoa').reset();
          document.getElementById('fecha_modal').click();
          console.log(request.readyState);
          
        })
      </script>
    </main>