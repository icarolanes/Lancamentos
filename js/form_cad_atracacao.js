$("#nova_atracacao").submit(function (e) {
    e.preventDefault();
    $form = $(this);
    var formdata = new FormData($form[0]);
    console.log($form);
    //criar conexao
    /*
        request.open("post", "banco/atracacao_editar.php");
        request.send(formdata);
    */
    document.getElementById("nova_atracacao").reset();
    document.getElementById("fecha_modal").click();
    //document.location.reload(true);
    $("#mensagem").append('<div class="alert alert-warning alert-dismissible fade show" role="alert">    <strong>Holy guacamole!</strong> You should check in on some of those fields below.    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>  </div>');
})

$("document").ready(function (e) {
});