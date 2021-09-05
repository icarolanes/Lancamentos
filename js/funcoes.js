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
		document.getElementById('cnpj').value      	= valida_cnpj(cnpj);
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
	function valida_cnpj(cnpj){
		cnpj_f = cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2}).*/,"$1.$2.$3/$4-$5");
		return(cnpj_f);
	}
	function valida_cpf(cpf){
		cpf_f = cpf.replace(/^(\d{3})(\d{3})(\d{3})(\d{2}).*/,"$1.$2.$3-$4")
		return(cnpj_f);
	}
	/*
	function campo_maiusculo() {
		var x = document.getElementById("id_campo");
		x.value = x.value.toUpperCase();
	}
	*/