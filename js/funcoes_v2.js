/* Esse arquivo  terá uma versão mais limpa das funções,
Onde que as funções terão retorno de true ou false como
retorno. Ou os valores irão retornar  em uma unica variavel como objeto.*/
/*função geral para limpar não numeros de qualquer valor*/
function retira_formatacao(valor) {
  var valor = valor.replace(/\D+/g, "");
  return valor;
}
function campo_maiusculo() {
  x.value = x.value.toUpperCase();
}
/* Função para separar os valores dentro de uma chave de NF-e */
function separa_dados(chave) {
  chave = chave;
  dados = new Object();
  dados.cUF = chave.substring(0, 2);
  dados.AME = chave.substring(2, 6);
  dados.cnpj = chave.substring(6, 20);
  dados.mod = chave.substring(20, 22);
  dados.serie = chave.substring(22, 25);
  dados.nNF = chave.substring(25, 34);
  dados.FEmi = chave.substring(34, 35);
  dados.CN = chave.substring(35, 43);
  dados.DV = chave.substring(43, 44);
  switch (chave.length) {
    case 44:
      dados.verifica_chave = verifica_chave(chave);
      break;
    default:
      dados.verifica_chave = false;
      break;
  }
  return dados;
}
function verifica_chave(chave) {
  /*separa cnpj para validação e DV para comparação final*/
  var cnpj = chave.substring(6, 20);
  cnpj = valida_cnpj(cnpj);
  var DV = chave.substring(43, 44);
  /*Inicia verificação de DV*/
  var chave43 = chave;
  multiplicadores = ["2", "3", "4", "5", "6", "7", "8", "9"];
  i = 42;
  soma_ponderada = 0;
  while (i >= 0) {
    for (m = 0; m < multiplicadores.length && i >= 0; m++) {
      soma_ponderada += chave43[i] * multiplicadores[m];
      i--;
    }
  }
  resto = soma_ponderada % 11;
  if (resto == "0" || resto == "1") {
    dv = 0;
  } else {
    dv = 11 - resto;
  }
  dv_chave = dv == DV;
  retorno = new Object();
  retorno.situacao = dv_chave == cnpj.situacao;
  retorno.cnpj = cnpj;

  return retorno;
}
/*valida cnpj*/
function valida_cnpj(cnpj) {
  cnpj_ret = new Object();
  cnpj_ret.puro = retira_formatacao(cnpj);
  cnpj_ret.formatacao = cnpj_ret.puro.replace(
    /^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2}).*/,
    "$1.$2.$3/$4-$5"
  );
  cnpj_red = cnpj.substring(0, 12);
  cnpj_ret.novo = cnpj_red;
  var cnpj14 = cnpj;
  /*dv1*/
  i = 11;
  for (v2 = 0; v2 < 2; v2++) {
    multiplicadores = ["2", "3", "4", "5", "6", "7", "8", "9"];
    soma_ponderada = 0;
    while (i >= 0) {
      for (m = 0; m < multiplicadores.length && i >= 0; m++) {
        soma_ponderada += cnpj14[i] * multiplicadores[m];
        i--;
      }
    }
    resto = soma_ponderada % 11;
    if (resto == "0" || resto == "1") {
      dv = 0;
    } else {
      dv = 11 - resto;
    }
    cnpj_ret.novo += dv;
    i = 12;
  }
  cnpj_ret.situacao = cnpj_ret.puro == cnpj_ret.novo;
  return cnpj_ret;
}
function valida_cpf(doc) {
  cpf = new Object();
  cpf.limpo = cpf.replace(/\D+/g, "");
  cpf.formatado = cpf.limpo.replace(
    /^(\d{3})(\d{3})(\d{3})(\d{2}).*/,
    "$1.$2.$3-$4"
  );
  if (cpf.limpo.length == 11) {
    var cpf_red = cpf.limpo.substring(0, 9);
    i = 8;
    for (dig = 0; dig < 2; dig++) {
      multiplicadores = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11"];
      soma_ponderada = 0;
      while (i >= 0) {
        for (m = 0; m < multiplicadores.length && i >= 0; m++) {
          soma_ponderada += cpf_red[i] * multiplicadores[m];
          i--;
        }
      }
      resto = soma_ponderada % 11;
      if (resto == "0" || resto == "1") {
        dv = 0;
      } else {
        dv = 11 - resto;
      }
      cpf_red += dv;
      i++;
    }
    cpf_ret(cpf_red == cpf.limpo);
    return cpf_ret;
  }
}
/* APIs Brasil api, para utilizala, coloque na base do formulário e tire o exemplo*/
function busca_cnpj_api_exemplo(cnpj) {
  ajax = new Object();
  var url = "https://brasilapi.com.br/api/cnpj/v1/" + cnpj;
  $.ajax({
    url: url,
    type: "get",
    dataType: "json",
    success: function (dados_cnpj) {},
  });
}
function consulta_cep_api() {
  if (busca_cep.length == 8) {
    var url = "https://brasilapi.com.br/api/cep/v2/" + busca_cep;
    $.ajax({
      url: url,
      type: "get",
      dataType: "json",
      success: function (dados_cep) {
        console.log(dados_cep);
      },
    });
  }
}
