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
            <form id="xmlform" action="#" enctype="multipart/form-data" method="post">
              <div class="mb-3">
                <label for="formFileSm" class="form-label">Selecione o XML da NF</label>
                <input class="form-control form-control-sm" type="file"  name="fileToUpload[]" id="formFileSm" multiple="multiple" >
              </div>
              <div class="progress progress-striped active">
                <div class="progress-bar" style="width: 0%">
                </div>
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
    <script>
      $('#xmlform').submit(function(e){
        e.preventDefault();
        //Receber os dados
        $form = $(this);        
        var formdata = new FormData($form[0]);
        //$form.find('.progress').removeAttr('hidden');
        
        //Criar a conexao com o servidor
        var request = new XMLHttpRequest();
        
        //Progresso do Upload
        request.upload.addEventListener('progress', function (e) {
          var percent = Math.round(e.loaded / e.total * 100);
          $form.find('.progress-bar').width(percent + '%').html(percent + '%');
        });
        
        //Upload completo limpar a barra de progresso
        request.addEventListener('load', function(e){
          $form.find('.progress-bar').addClass('progress-bar-success').html('upload completo...');
          //Atualizar a página após o upload completo
          setTimeout("window.open(self.location, '_self');", 5000);
        });
        
        //Arquivo responsável em fazer o upload da imagem
        request.open('post', 'banco/p1_import_nf_xml.php');
        request.send(formdata);
      });
    </script>