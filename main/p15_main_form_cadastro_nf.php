    <script type="text/javascript" src="js/nf_dados.js"></script>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Cadastro De NF</h1>
        <div class="btn-toolbar mb-2 mb-md-0">

        </div>
      </div>
      <div class=" col-sm-12 col-md-12">

        <form oninput="separa_dados();" class="row g-2" method="post" action="func/lanc_enviar.php">


          <div class="col-md-12 mb-3">
            <label for="chaveNota" class="form-label">Chave da NF</label>
            <input type="text" class="form-control" id="chaveNota" value="31210524042913000139550000000164641100164649" maxlength="44" autofocus >
          </div>

          <div class="col-md-1 mb-3">
            <label for="cUF" class="form-label">UF</label>
            <input type="text" class="form-control" id="cUF" readonly>
          </div>

          <div class="col-md-1 mb-3">
            <label for="AME" class="form-label">MES E ANO</label>
            <input type="text" class="form-control" id="AME" readonly>
          </div>

          <div class="col-md-2 mb-3">
            <label for="cnpj" class="form-label">CNPJ</label>
            <input type="text" class="form-control" id="cnpj" readonly>
          </div>
          
          <div class="col-md-2 mb-3">
            <label for="mod" class="form-label">Modelo</label>
            <input type="text" class="form-control" id="mod" readonly>
          </div>

          <div class="col-md-2 mb-3">
            <label for="serie" class="form-label">Serie</label>
            <input type="text" class="form-control" id="serie" readonly>
          </div>

          <div class="col-md-2 mb-3">
            <label for="nNF" class="form-label">Numero Nota</label>
            <input type="text" class="form-control" id="nNF" readonly>
          </div>

          <div class="col-md-2 mb-3">
            <label for="FEmi" class="form-label">F emissao</label>
            <input type="text" class="form-control" id="FEmi" readonly>
          </div>
          
          <div class="col-md-2 mb-3">
            <label for="CN" class="form-label">C Num</label>
            <input type="text" class="form-control" id="CN" readonly>
          </div>
          

          <div class="col-md-2 mb-3">
            <label for="DV" class="form-label">DV</label>
            <input type="text" class="form-control" id="DV" readonly>
          </div>
          

        </form>
      </div>
    </main>