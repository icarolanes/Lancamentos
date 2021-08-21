    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Notas cadastradas</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" onclick="window.location.href='index.php?p=15'" class="btn btn-sm btn-outline-secondary">Cadastrar</button>
            <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">Importar</button>
          </div>
        </div>
      </div>
      <?php 
      if (isset($_SESSION['mensagem'])) {
        echo $_SESSION['mensagem'];
        unset($_SESSION['mensagem']);
      }
      include_once ('includes/p1_Lista_NFs.php');
      ?>
    </main>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Importar NF</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">

            <form id="xmlform" action="func/p1_import_nf_xml.php" enctype="multipart/form-data" method="post">

              <div class="mb-3">
                <label for="formFileSm" class="form-label">Selecione o XML da NF</label>
                <input class="form-control form-control-sm" type="file"  name="fileToUpload[]" id="formFileSm" multiple="multiple" required>

              </div>

            </form>

            <small>Selecione um ou mais arquivos XML para importar NF</small>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="xmlform" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>