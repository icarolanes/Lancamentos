    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Empresas cadastradas</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#cadastro_empresa">Novo</button>
          </div>
        </div>
      </div>



      <h2></h2>
      <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Razão social</th>
              <th scope="col">Nome fantasia</th>
              <th scope="col">Cnpj</th>
            </tr>
          </thead>
          <tbody>
            <?php 

            $queryu = "SELECT * from empresas";
// por enquanto SELECT nf.nNF,nf.qtdvol as qtd , em.xNome as emissor , nf.transport as transportadora from nf_ident nf JOIN nf_itens it JOIN empresas em on nf.emissor = em.id GROUP by  nNf;;

            $resultado = $con ->prepare($queryu);
            $resultado ->execute();

            $cnt = 1;
            while ($linha=$resultado->fetch()) {

              ?>

              <tr>
                <td>Abrir</td>
                <td><?php echo $linha['xNome']; ?></td>
                <td><?php echo $linha['xNome']; ?></td>
                <td><?php echo $linha['xCNPJ']; ?></td>
                
              </tr>

              <?php
            }
            ?>
            
          </tbody>
        </table>
      </div>
      

      <!-- Modal -->
      <div class="modal fade" id="cadastro_empresa" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Cadastro de empresa </h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="post" id="form_cad_emp" action="a.php">
                <div class="mb-3">
                  <label for="cnpj_cad" class="form-label">CNPJ</label>
                  <input oninput="busca_cnpj();" type="text" class="form-control" id="cnpj_cad" maxlength="18" autocomplete="off">
                  <div class="small mt-2" id="or_val"></div>
                </div>
                <div class="mb-3">
                  <label for="razao" class="form-label">Razão Social</label>
                  <input type="text" class="form-control" id="razao" readonly>
                </div>
                <div class="mb-3">
                  <label for="fantasia" class="form-label">Nome Fantazia</label>
                  <input type="text" class="form-control" id="fantasia" readonly required>
                </div>
                <div class="mb-3">
                  <label for="uf" class="form-label">UF</label>
                  <input type="text" class="form-control" id="uf" readonly>
                </div>
                <div class="mb-3">
                  <label for="cidade" class="form-label">Cidade</label>
                  <input type="text" class="form-control" id="cidade" readonly>
                </div>
                <div class="mb-3">
                  <label for="cep" class="form-label">Cep</label>
                  <input type="text" class="form-control" id="cep" readonly>
                </div>

              </form>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
              <button type="submit" form="form_cad_emp" id="submit" class="btn btn-primary">Gravar</button>
            </div>
          </div>
        </div>
      </div>
    </main>