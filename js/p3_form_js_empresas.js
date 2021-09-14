function cnpj_buscar(doc) {
  api = new Object();
  cnpj = new Object();
  cnpj.limpo = retira_formatacao(doc); //tira a formatação
  if (cnpj.limpo.length == 14) {
    retorno = valida_cnpj(cnpj.limpo); // valida o cnpj
    if (retorno.situacao == true) {
      /* se situação positiva,Busca os dados do cnpj*/
      banco = busca_cnpj_banco(cnpj.limpo);
    }
    /* retornos ao formulario*/
    document.getElementById("cnpj_cad").value = retorno.formatacao;
  } else {
  }
}
function busca_cnpj_banco(cnpj) {
  var $razao = $("input[name='razao']");
  var $fantasia = $("input[name='fantasia']");
  var $uf = $("input[name='uf']");
  var $cidade = $("input[name='cidade']");
  var $cep = $("input[name='cep']");
  var $bairro = $("input[name='bairro']");
  var $logradouro = $("input[name='logradouro']");
  var ret_banco;
  $.getJSON(
    "banco/p3_cons_cnpj_banco.php",
    {
      cnpj: cnpj,
    },
    function (json) {
      ret_banco = json.situacao;
      console.log(ret_banco);
      if (ret_banco == true) {
        $razao = $razao.val(json.razao);
        $fantasia = $fantasia.val(json.fantasia);
        $uf = $uf.val(json.estado);
        $cidade = $cidade.val(json.cidade);
        $cep = $cep.val(json.cep);
        $bairro = $bairro.val(json.bairro);
        $logradouro = $logradouro.val(json.rua);
        document.getElementById("submit").disabled = true;
      } else {
        document.getElementById("submit").disabled = false;
        api = busca_cnpj_api(cnpj); //busca na api
      }
    }
  );
}
/*envio de dados para Edição de cadastro*/
$("#form_cad_emp").submit(function (e) {
  e.preventDefault();
  $form = $(this);
  var formdata = new FormData($form[0]);
  //cria conexao
  var request = new XMLHttpRequest();
  //conexao arquivo
  request.open("post", "banco/p3_form_empresas_editar.php");
  request.send(formdata);
  document.getElementById("form_cad_emp").reset();
  document.getElementById("fecha_modal").click();
  document.location.reload(true);
});
