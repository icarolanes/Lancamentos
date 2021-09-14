function cadastro_manual(chave) {
  dados = separa_dados(chave);
  document.getElementById("cUF").value = dados.cUF;
  document.getElementById("AME").value = dados.AME;
  switch (chave.length) {
    case 44:
      document.getElementById("cnpj").value =
        dados.verifica_chave.cnpj.formatacao;
      break;

    default:
      document.getElementById("cnpj").value = dados.cnpj;
      break;
  }
  document.getElementById("mod").value = dados.mod;
  document.getElementById("serie").value = dados.serie;
  document.getElementById("nNF").value = dados.nNF;
  document.getElementById("FEmi").value = dados.FEmi;
  document.getElementById("CN").value = dados.CN;
  document.getElementById("DV").value = dados.DV;
  //teste: 32210827291400000150550060000162801029334161

  if (chave.length == 44) {
    switch (dados.verifica_chave.situacao) {
      case true:
        document.getElementById("enviar").disabled = false;
        busca_cnpj_banco(dados.cnpj);
        break;

      default:
        document.getElementById("enviar").disabled = true;
        break;
    }
  } else {
    document.getElementById("enviar").disabled = true;
  }
}

function busca_cnpj_banco(cnpj) {
    
  var $razao = $("input[name='razao']");
  var ret_banco;
  $.getJSON(
    "banco/p3_cons_cnpj_banco.php",
    {
      cnpj: cnpj,
    },
    function (json) {
        console.log(json);
      ret_banco = json.situacao;
      if (ret_banco == true) {
        $razao = $razao.val(json.razao);
      } else {
          $razao = "Empresa não cadastrada";
      }
    }
  );
}
