function cnpj_buscar(doc){
  api = new Object();
  cnpj = new Object();
          cnpj.limpo      = retira_formatacao(doc); //tira a formatação
          if (cnpj.limpo.length == 14){
            retorno = valida_cnpj(cnpj.limpo); // valida o cnpj
            if (retorno.situacao == true){
              /* se situação positiva, consulta se ja existe*/
              banco = busca_cnpj_banco(cnpj.limpo);
              if (banco = true) {
              }else{
              api = busca_cnpj_api(cnpj.limpo); //busca na api
            }
          }else{
          }
          /* retornos ao formulario*/
          document.getElementById('cnpj_cad').value = retorno.formatacao;
        }else{
        }
      }
      function busca_cnpj_banco(cnpj){
       var $cnpj = $("input[name='cnpj_cad']");
       console.log(cnpj);
       $.getJSON('banco/p3_cons_cnpj_banco.php',{
        cnpj: cnpj
      },function(json){
        retornobc = $empresa.val(json);
      });
      console.log(retornobc) 
     }
     function busca_cnpj_api(cnpj){
      var retorno_cnpj = new Object();
      ajax = new Object();
      var url   = "https://brasilapi.com.br/api/cnpj/v1/"+cnpj;
      $.ajax({
        url:url,
        type:"get",
        dataType: "json",
        success:function(dados_cnpj){
          document.getElementById('fantasia').readOnly = true;
          document.getElementById('razao').value      = dados_cnpj.razao_social;
          document.getElementById('fantasia').value   = dados_cnpj.nome_fantasia;
          document.getElementById('uf').value         = dados_cnpj.uf;
          document.getElementById('cidade').value     = dados_cnpj.municipio;
          document.getElementById('cep').value        = dados_cnpj.cep;
          document.getElementById('bairro').value     = dados_cnpj.bairro;
          document.getElementById('desclog').value    = dados_cnpj.descricao_tipo_logradouro
          document.getElementById('logradouro').value = dados_cnpj.logradouro;
          if (dados_cnpj.nome_fantasia=='') {
            document.getElementById('fantasia').readOnly = false;
          }else{
            document.getElementById('fantasia').readOnly = true;
          }
        }
      })
    }
    $("#form_cad_emp").submit(function(e){
      e.preventDefault();
      $form = $(this);
      var formdata = new FormData($form[0]);
          //cria conexao
          var request = new XMLHttpRequest();
          //conexao arquivo
          request.open('post','banco/p3_form_empresas_cad.php');
          request.send(formdata);
          console.log(request)
        })