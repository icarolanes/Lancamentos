	function separa_dados(){
		//Chave da nota
		var chave 	= (document.getElementById('chaveNota').value);
		var cnpj 	= (document.getElementById('cnpj').value);
		var nNF		= (document.getElementById('nNF').value);
		//separação de dados
		var cUF 	= chave.substring(0,2);
		var AME 	= chave.substring(2,6);
		var cnpj 	= chave.substring(6,20);
		var mod		= chave.substring(20,22);
		var serie	= chave.substring(22,25);
		var nNF		= chave.substring(25,34);
		var FEmi	= chave.substring(34,35);
		var CN		= chave.substring(35,43);
		var DV		= chave.substring(43,44);
		//retorno para campos
		document.getElementById('cUF').value       	= cUF;
		document.getElementById('AME').value 		= AME;
		cnpj = valida_cnpj(cnpj);
		document.getElementById('cnpj').value      	= cnpj.formatacao;
		document.getElementById('mod').value       	= mod;
		document.getElementById('serie').value      = serie;
		document.getElementById('nNF').value       	= nNF;
		document.getElementById('FEmi').value       = FEmi;
		document.getElementById('CN').value       	= CN;
		document.getElementById('DV').value       	= DV;
		//chama função DV da NF
		verifica_chave();
	} //fim separa_dados
	function verifica_chave(){
		var chave_ver 	= (document.getElementById('chaveNota').value);
		var DV			= chave_ver.substring(43,44);
		if(chave_ver.length == 44){
			var chave43 = chave_ver;
			multiplicadores = ['2','3','4','5','6','7','8','9'];
			i = 42;
			soma_ponderada = 0;
			while (i >= 0) {
				for (m=0; m< multiplicadores.length && i>=0; m++) {
					soma_ponderada += chave43[i] * multiplicadores[m];
					i--;
				}
			}
			resto = soma_ponderada % 11;
			if (resto == '0' || resto == '1') {
				dv = 0;
			}else{
				dv = 11 - resto;
			}
			if (dv == DV) {
				document.getElementById('msg').innerHTML = "Chave de acesso Válida";
				document.getElementById('enviar').disabled = false;
			}else{
				document.getElementById('msg').innerHTML = "Chave de acesso invalida.";
				document.getElementById('enviar').disabled = true;
			}
		}else{
			document.getElementById('msg').innerHTML = 'Restam ';
			document.getElementById('msg').innerHTML += 44 - chave_ver.length ;
			document.getElementById('msg').innerHTML += ' digitos para chave de acesso' ;
			document.getElementById('enviar').disabled = true;
		}//fim DV da NF
	}
	//inicialmente somente coloca em formato de cpf e cnpj.
	function retira_formatacao(valor){
		var valor = valor.value.replace(/\D+/g, '');
	}
	function valida_cnpj(cnpj){
		
		cnpj_ret = new Object();
		cnpj_ret.formatacao = cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2}).*/,"$1.$2.$3/$4-$5");
		
		/*realizar calculo de validação*/
		if (cnpj.length == 14) {
			var cnpj14 = cnpj;
			/*dv1*/
			multiplicadores = ['2','3','4','5','6','7','8','9'];
			i = 11;
			soma_ponderada = 0;
			while (i >= 0) {
				for (m=0; m< multiplicadores.length && i>=0; m++) {
					soma_ponderada += cnpj14[i] * multiplicadores[m];
					i--;
				}
			}
			resto = soma_ponderada % 11;
			if (resto == '0' || resto == '1') {
				dv = 0;
			}else{
				dv = 11 - resto;
			}
			/*dv2*/
			cnpj_nv = cnpj.substring(0,12);
			cnpj_nv += dv;
			var cnpj14 = cnpj_nv;
			/*dv1*/
			multiplicadores = ['2','3','4','5','6','7','8','9'];
			i = 12;
			soma_ponderada = 0;
			while (i >= 0) {
				for (m=0; m< multiplicadores.length && i>=0; m++) {
					soma_ponderada += cnpj14[i] * multiplicadores[m];
					i--;
				}
			}
			resto = soma_ponderada % 11;
			if (resto == '0' || resto == '1') {
				dv = 0;
			}else{
				dv = 11 - resto;
			}
			cnpj_nv = cnpj_nv.substring(0,13);
			cnpj_nv += dv;
			if (cnpj_nv == cnpj) {
				cnpj_ret.situacao = 1;
			}
			else{
				cnpj_ret.situacao = 0;
			}
		}else{
		}
		return(cnpj_ret);
	}
	function valida_cpf(cpf){
		document.getElementById("cpf").className = 'form-control';
		document.getElementById('salvar').disabled = true;
		cpf_limpo = cpf.replace(/\D+/g, '');
		cpf_f = cpf_limpo.replace(/^(\d{3})(\d{3})(\d{3})(\d{2}).*/,"$1.$2.$3-$4")
		if(cpf_limpo.length==11){
			var cpf_red = cpf_limpo.substring(0,9);
			/*dv1*/
			i = 8;
			for(dig=0;dig<2;dig++){
				multiplicadores = ['2','3','4','5','6','7','8','9','10','11'];
				soma_ponderada = 0;
				while (i >= 0) {
					for (m=0; m< multiplicadores.length && i>=0; m++) {
						soma_ponderada += cpf_red[i] * multiplicadores[m];
						i--;
					}
				}
				resto = soma_ponderada % 11;
				if (resto == '0' || resto == '1') {
					dv = 0;
				}else{
					dv = 11 - resto;
				}
				cpf_red += dv;
				i=9; /* reinicia a variavel para contar um novo valor */
			}
			if (cpf_red == cpf_limpo) {
				document.getElementById('cpf').value = cpf_f;
				document.getElementById('salvar').disabled = false;
				document.getElementById("cpf").className = 'form-control is-valid';
			}else{
				document.getElementById('salvar').disabled = true;
				document.getElementById("cpf").className = 'form-control is-invalid';
			}
		}
	}
	//usando oninput
	function campo_maiusculo() {
		var x = document.getElementById("id_campo");
		x.value = x.value.toUpperCase();
	}
	//usando onchange no campo use o onchange no campo para mudar informação.
	function simples_innerHtml() {
		var x = document.getElementById("mySelect").value;
		document.getElementById("demo").innerHTML = "You selected: " + x;
	}
	function consulta_cep(){
		consulta_cep_api();
	}
	function busca_cnpj(){
		var cnpj = document.getElementById('cnpj_cad').value.replace(/\D+/g, '');
		cnpj_ret = valida_cnpj(cnpj);
		document.getElementById('cnpj_cad').value = cnpj_ret.formatacao;
		if(cnpj.length == 14){
			if (cnpj_ret.situacao == 1) {
				busca_cnpj_api(cnpj);
				document.getElementById('submit').disabled = false;
			}else{
				document.getElementById('or_val').innerHTML = 'CNPJ INVALIDO';
				document.getElementById('submit').disabled = true;
				document.getElementById('form_cad_emp').reset();
				document.getElementById('cnpj_cad').value = cnpj_ret.formatacao;
			}
		}
	}
	/*JS de JSON para meu banco*/
	function busca_motorista(){
		cpf = document.getElementById('cpf').value;
		url = "http://localhost/files/lancamentos/funcao.php?cpf="+cpf;
		$.ajax({
			url:url,
			type:"get",
			dataType:"json",
			success:function(dados_mot){
				console.log(dados_mot);
			}
		})
	};

	/*JS de APIs*/
	function busca_cnpj_api(cnpj){
		
		var url 	= "https://brasilapi.com.br/api/cnpj/v1/"+cnpj;
		$.ajax({
			url:url,
			type:"get",
			dataType: "json",
			success:function(dados_cnpj){
				document.getElementById('razao').value = dados_cnpj.razao_social;
				document.getElementById('fantasia').value = dados_cnpj.nome_fantasia;
				document.getElementById('cep').value = dados_cnpj.cep;
				document.getElementById('uf').value = dados_cnpj.uf;
				document.getElementById('cidade').value = dados_cnpj.municipio;
				document.getElementById('or_val').innerHTML = 'Brasil API';
				if (dados_cnpj.nome_fantasia=='') {
					document.getElementById('fantasia').readOnly = false;
					document.getElementById('fantasia').required = true;
				}else{
					document.getElementById('fantasia').readOnly = true;
				}
			}
		})
	}
	function consulta_cep_api(){
		if (busca_cep.length == 8){
			var url 	= "https://brasilapi.com.br/api/cep/v2/"+busca_cep;
			$.ajax({
				url:url,
				type:"get",
				dataType: "json",
				success:function(dados_cep){
					console.log(dados_cep)
				}
			})
		}
	}