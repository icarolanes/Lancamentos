//listar operações por meio de ajax
$("document").ready(function () {
    $.ajax({
        type: "post",
        url: "banco/listar_operacao.php",
        dataType: "json",
        success: function (data) {
            var dados = new Object();
            console.log(data.length);
            for (let index = 0; index < data.length; index++) {
                dados = data[index];
                console.log(dados);
            }
        }
    });
});