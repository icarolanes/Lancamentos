<style>
ul {
	display: block;
	list-style-type: none;
	margin-top: 1em;
	margin-bottom: 1 em;
	margin-left: 0;
	margin-right: 0;
	padding-left: 40px;
}
</style>

<fieldset>
	<div class="titulo">  
		Atracação--------------
		<ul>

			<li>Navio:                  <?php echo $dados_at['navio'] ?></li>
			<li>Atracação:              <?php echo $dados_at['numero'] ?></li>
			<li>D atracação	            <?php echo $dados_at['atracacao'] ?></li>
			<li>I operação              <?php echo $dados_at['inicio_ope'] ?></li>
			<li>T operação              <?php echo $dados_at['termino_ope'] ?></li>
			<li>D desatracação          <?php echo $dados_at['desatracacao'] ?></li>
			<li>Tempo de atracacao,     <?php echo $dados_at['Tatracacao'] ?></li>
			<li>Tempo de operação,      <?php echo $dados_at['Toperacao'] ?></li>

			<li>Tempo de paralização,   <?php echo $dados_at['navio'] ?></li>
			<li>Tempo real de operação, <?php echo $dados_at['navio'] ?></li>

			<li>Quantidade de periodos, <?php echo $dados_at['navio'] ?></li>
			<li>Quantidade de ternos,   <?php echo $dados_at['navio'] ?></li>

			<li>Total manifestado,      <?php echo $dados_at['navio'] ?></li>
			
			<li>Total Descarregado,     <?php echo $dados_at['navio'] ?></li>
			<li>Media por dia,          <?php echo $dados_at['navio'] ?></li>
			<li>Media de periodos,      <?php echo $dados_at['navio'] ?></li>
			<li>Media por hora,         <?php echo $dados_at['navio'] ?></li>
			<li>Dias corridos,          <?php echo $dados_at['navio'] ?></li>
		</ul>

	</div>




	<table style="text-align: center;" border="1px" >
		<thead>
			<tr>
				<th  colspan="2">Periodo</th>
				<th >ternos</th>
				<th >Faina</th>
				<th >Valor</th>
				<th colspan="5">Porões</th>
				<th >Total</th>
			</tr>

			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th>1</th>
				<th>2</th>
				<th>3</th>
				<th>4</th>
				<th>5</th>
				<th></th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td><b>Requisição:</b></td>
				<td>07x13</td>
				<td>1</td>
				<td>4.3</td>
				<td></td>
				<td>750.000</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>750.000</td>
			</tr>
			<tr>
				<td><b>Requisição:</b></td>
				<td>07x13</td>
				<td>2</td>
				<td>4.3</td>
				<td></td>
				<td></td>
				<td>650.000</td>
				<td></td>
				<td></td>
				<td></td>
				<td>650.000</td>
			</tr>
			<tr>
				<td><b>Paralizações:</b></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><b>Acumulos:</b></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>1.400.000</td>
			</tr>


			<tr>
				<td> </td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>


			<tr>
				<td><b>Totais do Dia:</b></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>1.400.000</td>
			</tr>
			<tr>
				<td><b>Meta:</b></td>
				<td colspan="2">Alcançada</td>
				<td colspan="2"><b>Media:</b></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>1.400.000</td>
			</tr>
			
		</tbody>
	</table>
	<?php 













//include('print_teste_rop.php')

	?>



	<hr>


</fieldset>
