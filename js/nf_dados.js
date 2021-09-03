	function separa_dados(){
		//Chave da nota
		var chave 	= (document.getElementById('chaveNota').value);
		var cnpj 	= (document.getElementById('cnpj').value);
		var nNF		= (document.getElementById('nNF').value);

		var cUF 	= chave.substring(0,2);
		var tpEmis 	= chave.substring(2,3);
		var cnpj 	= chave.substring(3,17);

		document.getElementById('cUF').value       = cUF;
		document.getElementById('tpEmis').value    = tpEmis;
		document.getElementById('cnpj').value      = cnpj;
		document.getElementById('nNF').value       = chave;

	}