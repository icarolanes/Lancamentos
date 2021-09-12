function cnpj_buscar(doc){
  api = new Object();
  cnpj = new Object();
          cnpj.limpo      = retira_formatacao(doc); //tira a formatação
          if (cnpj.limpo.length == 14){
            retorno = valida_cnpj(cnpj.limpo); // valida o cnpj
            if (retorno.situacao == true){
              /* se situação positiva, consulta se ja existe*/
              banco = busca_cnpj_banco(cnpj.limpo);
              //api = busca_cnpj_api(cnpj.limpo); //busca na api
            }else{
            }
            /* retornos ao formulario*/
            document.getElementById('cnpj_cad').value = retorno.formatacao;
          }else{
          }
        }
        function busca_cnpj_banco(cnpj){
         var $razao = $("input[name='razao']");
         var $fantasia = $("input[name='fantasia']");
         var $uf                = $("input[name='uf']");
         var $cidade            = $("input[name='cidade']");
         var $cep               = $("input[name='cep']");
         var $bairro            = $("input[name='bairro']");
         var $logradouro        = $("input[name='logradouro']");
         var ret_banco;
         $.getJSON('banco/p3_cons_cnpj_banco.php',{
          cnpj: cnpj
        },function(json){
          ret_banco = json.situacao;
          console.log(ret_banco);
          if (ret_banco == true) {
            $razao = $razao.val(json.razao);
            $fantasia = $fantasia.val(json.fantasia);
            $uf          = $uf.val(json.estado);
            $cidade      = $cidade.val(json.cidade);
            $cep         = $cep.val(json.cep);
            $bairro      = $bairro.val(json.bairro);
            $logradouro  = $logradouro.val(json.rua);
            document.getElementById('submit').disabled = true;
          }else{
            document.getElementById('submit').disabled = false;
          api = busca_cnpj_api(cnpj); //busca na api
        }
      });
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
            rua = dados_cnpj.descricao_tipo_logradouro;
            rua += " ";
            rua += dados_cnpj.logradouro;
            document.getElementById('logradouro').value = rua;
            if (dados_cnpj.nome_fantasia=='') {
              document.getElementById('fantasia').readOnly = false;
            }else{
              document.getElementById('fantasia').readOnly = true;
            }
          }
        })
      }
      /*envio de dados para cadastro*/
      $("#form_cad_emp").submit(function(e){
        e.preventDefault();
        $form = $(this);
        var formdata = new FormData($form[0]);
          //cria conexao
          var request = new XMLHttpRequest();
          //conexao arquivo
          request.open('post','banco/p3_form_empresas_cad.php');
          request.send(formdata);
          document.getElementById('form_cad_emp').reset();
          document.getElementById('fecha_modal').click();
          document.location.reload(true);
        })