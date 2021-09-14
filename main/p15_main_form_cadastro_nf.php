<?php
    if (isset($_GET['chave'])) {
      // code...
      $key = $_GET['chave'];
    }else{
      $key = '';
    }
    ?>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Cadastro De NF</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>
    <div class=" col-sm-12 col-md-12">
        <form class="row g-2" method="post" action="banco/lanc_enviar.php">
            <div class="col-md-12 col-lg-12 mb-3">
                <label for="chaveNota" class="form-label">Chave da NF</label>
                <input oninput="cadastro_manual(value)" type="text" class="form-control" id="chaveNota"
                    value="<?php echo $key ;?>" maxlength="44" autofocus>
                <div class="small mt-2" id="msg">Digite ou leia a nota</div>
            </div>
            <div class="col-md-1 col-lg-1 mb-3">
                <label for="cUF" class="form-label">UF</label>
                <input type="text" class="form-control" id="cUF" readonly>
            </div>
            <div class="col-md-2 col-lg-1 mb-3">
                <label for="AME" class="form-label">AAMM</label>
                <input type="text" class="form-control" id="AME" readonly>
            </div>
            <div class="col-md-3 col-lg-2 mb-3">
                <label for="cnpj" class="form-label">CNPJ</label>
                <input type="text" class="form-control" id="cnpj" readonly>
            </div>
            <div class="col-md-2 col-lg-1 mb-3">
                <label for="mod" class="form-label">Modelo</label>
                <input type="text" class="form-control" id="mod" readonly>
            </div>
            <div class="col-md-2 col-lg-1 mb-3">
                <label for="serie" class="form-label">Serie</label>
                <input type="text" class="form-control" id="serie" readonly>
            </div>
            <div class="col-md-3 col-lg-2 mb-3">
                <label for="nNF" class="form-label">Numero Nota</label>
                <input type="text" class="form-control" id="nNF" readonly>
            </div>
            <div class="col-md-1 col-lg-1 mb-3">
                <label for="FEmi" class="form-label">F_emissao</label>
                <input type="text" class="form-control" id="FEmi" readonly>
            </div>
            <div class="col-md-3 col-lg-2 mb-3">
                <label for="CN" class="form-label">C Num</label>
                <input type="text" class="form-control" id="CN" readonly>
            </div>
            <div class="col-md-1 col-lg-1 mb-3">
                <label for="DV" class="form-label">DV</label>
                <input type="text" class="form-control" id="DV" readonly>
            </div>
            <div class="col-md-3 col-lg-3 mb-3">
                <label for="emissor" class="form-label">Emissor</label>
                <input type="text" class="form-control" id="razao" readonly>
            </div>

            <button type="submit" form="cd" id="enviar" disabled="" class="btn btn-primary">Enviar</button>
        </form>
    </div>
    <script type="text/javascript" src="js/p15_main_form_cadastro_nf.js"></script>
</main>