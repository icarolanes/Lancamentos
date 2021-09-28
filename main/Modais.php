<!-- Modal de cadastro de atracação -->
<div class="modal fade" id="cad_atracacao" tabindex="-1" aria-labelledby="cad_atracacaoLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cad_atracacaoLabel">Cadastro de atracação</h5>
        <button id="fecha_modal" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form method="post" action="#" id="nova_atracacao">
          <div class="mb-3">
            <label for="operacao" class="form-label">Operação</label>
            <input type="text" class="form-control" name="operacao" id="operacao" disabled>
          </div>
          <div class="mb-3">
            <label for="Natracacao" class="form-label">Atracação</label>
            <input type="text" class="form-control" name="Natracacao" id="Natracacao" placeholder="00/21">
          </div>
          <div class="mb-3">
            <label for="imo" class="form-label">Imo</label>
            <input type="number" class="form-control" name="imo" id="imo" minlength="9" maxlength="9"
              placeholder="9525338">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" form="nova_atracacao" class="btn btn-primary">Cadastrar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal de cadastro de operação -->
<div class="modal fade" id="cad_operacao" tabindex="-1" aria-labelledby="cad_operacaoLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cad_operacaoLabel">Cadastro de operação</h5>
        <button id="fecha_modal2" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form method="post" action="#" id="nova_operacao">
          <div class="mb-3">
            <label for="operacao" class="form-label">Tipo</label>
            <select class="form-select">
  <?php
  $qlista = "call tipo_lancamento()";
  $prepa = $con->prepare($qlista);
  $prepa->execute();
  while ($listar = $prepa->fetch()) {
      echo "<option value='{$listar['id']}'>{$listar['nTipo']}</option>";
  }
  ?>
          </select>
          </div>
          <label for="inicio" class="form-label"></label>
          <input type="date" id="hoje" class="form-control" value="<?php echo date("Y-m-d"); ?>">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" form="nova_operacao" class="btn btn-primary">Cadastrar</button>
      </div>
    </div>
  </div>
</div>


<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
  <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <svg class="bd-placeholder-img rounded me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg"
        aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
        <rect width="100%" height="100%" fill="#007aff" />
      </svg>
      <strong class="me-auto">Bootstrap</strong>
      <small>11 mins ago</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
    <div id="mensagem"></div>
    </div>
  </div>
</div>
<script src="js/form_cad_atracacao.js"></script>