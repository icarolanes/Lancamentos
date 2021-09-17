<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Notas cadastradas</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group me-2">
                <button type="button" onclick="window.location.href='cadastrarnfe'"
                    class="btn btn-sm btn-outline-secondary">Cadastrar</button>
                <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal"
                    data-bs-target="#exampleModal">Importar</button>
            </div>
        </div>
    </div>
    <?php 
      if (isset($_SESSION['mensagem'])) {
        echo $_SESSION['mensagem'];
        unset($_SESSION['mensagem']);
      }
      
      ?>
    <div class="table-responsive">
        <table class="table table-hover table-striped table-sm">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">NF</th>
                    <th scope="col">Emissor</th>
                    <th scope="col">Volumes</th>
                    <th scope="col">Numeração geral</th>
                    <th scope="col">Liquido NF</th>
                </tr>
            </thead>
            <tbody>
                <?php 

//essa consulta é generica, aparece todas as notas fiscais, mesmo se nota ja foi utilizada. após a implementação, de uso de nota, utilize uma consulta para verificar se foi utilizada ou não.

// query das notas a serem mostrados
            $queryu = "SELECT 
            nf.id             as idNF,
            nf.nNF,
            nf.qtdvol         as qtd ,
            nf.Numeracao_item as itemNaNf, 
            em.xNome          as emissor , 
            nf.transport      as transportadora, 
            nf.Pliquido       as LiqNf 
            from nf_ident nf JOIN nf_itens it JOIN empresas em on nf.emissor = em.id GROUP by nf.id order by nf.id desc";
//query total para contagem de itens
            $query_pag = "SELECT * from nf_ident ";

//executa query de contagem
            $resultado_pag = $con ->prepare($query_pag);
            $resultado_pag ->execute();
            $contar_lanc = $resultado_pag->rowCount();
            if (!isset($rota[2])) {
              $page = 1;
              $navant = 1;
            }else{
              $page = $rota[2];
              switch ($page) {
                case '1':
                $navant = 1;
                $navprox = $page + 1;
                break;

                default:
                $navant = $page-1;
                $navprox = $page + 1;
                break;
              }
            }

$qpp = 20; //quantidade por paginas
$inicio = $page-1;
$inicio = $inicio * $qpp;
$query_limit = $queryu. " LIMIT  $inicio, ".$qpp;
//ececuta a query da quantidade atual
$resultado = $con ->prepare($query_limit);
$resultado ->execute();
$cnt = 1;
while ($linha=$resultado->fetch()) {


  ?>

                <tr>

                    <td> <a href="nfe_i-<?php echo($linha['idNF'])?>">Abrir</a> </td>
                    <td><?php echo $linha['nNF']; ?></td>
                    <td><?php echo $linha['emissor']; ?></td>
                    <td><?php if ($linha['qtd']==0) {
      echo   "Ver itens";
    }else{
      echo $linha['qtd'];

    } ?></td>
                    <td><?php 
    if ($linha['itemNaNf'] == (null or 0)) {
      echo "Sem identificação em nota";
    }else{ echo $linha['itemNaNf']; } ?></td>
                    <td><?php echo $linha['LiqNf']; ?></td>

                </tr>

                <?php
}
?>

            </tbody>
        </table>

        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item"><a class="page-link"
                        href="nfe-pag-<?php echo $navant; ?>">Anterior
                    </a></li>
                <?php  
//paginação
    $pages = $contar_lanc / $qpp;
    $nav = 1;
    for ($i=0; $i < $pages ; $i++) { 
      ?>
                <li class="page-item"><a class="page-link"
                        href="nfe-pag-<?php echo $nav; ?>"><?php echo $nav++ ?></a></li>
                <?php  
    }
    ?>
                <li class="page-item"><a class="page-link"
                        href="nfe-pag-<?php echo $navprox; ?>">Proxima</a></li>
            </ul>
        </nav>
    </div>
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
                        <input class="form-control form-control-sm" type="file" name="fileToUpload[]" id="formFileSm"
                            multiple="multiple">
                    </div>
                    <div hidden class="progress progress-striped active">
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
$('#xmlform').submit(function(e) {
    e.preventDefault();
    //Receber os dados ..... verificar outra maneira... esse mostra a porcentagem de upload para o navegador, e não a porcentagem enviada para o banco de dados.
    $form = $(this);
    var formdata = new FormData($form[0]);
    $form.find('.progress').removeAttr('hidden');

    //Criar a conexao com o servidor
    var request = new XMLHttpRequest();

    //Progresso do Upload para o navegador
    request.upload.addEventListener('progress', function(e) {
        var percent = Math.round(e.loaded / e.total * 100);
        $form.find('.progress-bar').width(percent + '%').html(percent + '%');
    });

    //Upload completo limpar a barra de progresso
    request.addEventListener('load', function(e) {
        $form.find('.progress-bar').addClass('bg-success').html('Envio completo');
        //Atualizar a página após o upload completo
        setTimeout("window.open(self.location, '_self');", 3000);
    });

    //Arquivo responsável em fazer o upload da imagem
    request.open('post', 'banco/p1_import_nf_xml.php');
    request.send(formdata);
});
</script>