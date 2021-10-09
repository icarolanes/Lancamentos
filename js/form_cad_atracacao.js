$("#nova_atracacao").submit(function (e) {
    e.preventDefault();
    $form = $(this);
    var formdata = new FormData($form[0]);

    //criar conexao
    //request.open("post", "banco/atracacao_editar.php");
    //request.send(formdata);
    //console.log(request);
    document.getElementById("nova_atracacao").reset();
    document.getElementById("fecha_modal").click();
    //toast de mensagem: cadastro com sucesso
    var myAlert = document.getElementById('liveToast');//select id of toast
    var texto_toast = "Atracação cadastrada com sucesso!";
    document.getElementById('mensagem').innerHTML = texto_toast;
    var bsAlert = new bootstrap.Toast(myAlert);//inizialize it
    bsAlert.show();//show it
});

$("#nova_operacao").submit(function (e) {
    e.preventDefault();
    $form = $(this);
    var formdata = new FormData($form[0]);

    //criar conexao
    //request.open("post", "banco/operacao_cadastrar.php");
    //request.send(formdata);
    //console.log(request);
    document.getElementById("nova_operacao").reset();
    document.getElementById("fecha_modal2").click();
    //toast de mensagem: cadastro com sucesso
    var myAlert = document.getElementById('liveToast');//select id of toast
    var texto_toast = "Operação cadastrada com sucesso!";
    document.getElementById('mensagem').innerHTML = texto_toast;
    var bsAlert = new bootstrap.Toast(myAlert);//inizialize it
    bsAlert.show();//show it
});

$("document").ready(function (e) {

});