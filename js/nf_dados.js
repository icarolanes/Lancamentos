	function separa_dados(){
		//Chave da nota
		var chave 	= (document.getElementById('chaveNota').value);
		var cnpj 	= (document.getElementById('cnpj').value);
		var nNF		= (document.getElementById('nNF').value);

		var cUF 	= chave.substring(0,2);
		var AME 	= chave.substring(2,6);
		var cnpj 	= chave.substring(6,20);
		var mod		= chave.substring(20,22);
		var serie	= chave.substring(22,25);
		var nNF		= chave.substring(25,34);
		var FEmi	= chave.substring(34,35);
		var CN		= chave.substring(35,43);
		var DV		= chave.substring(43,44);

		cnpj_f = cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2}).*/,"$1.$2.$3/$4-$5");

		document.getElementById('cUF').value       	= cUF;
		document.getElementById('AME').value 		= AME;
		document.getElementById('cnpj').value      	= cnpj_f;
		document.getElementById('mod').value       	= mod;
		document.getElementById('serie').value      = serie;
		document.getElementById('nNF').value       	= nNF;
		document.getElementById('FEmi').value       = FEmi;
		document.getElementById('CN').value       	= CN;
		document.getElementById('DV').value       	= DV;
	}