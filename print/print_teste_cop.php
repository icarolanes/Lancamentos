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

td{
	border: 1px solid lightgrey;

}

table {
	border: 2px solid black;
	border-collapse: collapse;
	width: 1000px;
	border-style: solid;
}
th{
	text-align: center;
	border: 1px solid gray;
	background-color: lightgrey;
}
.info{

	background-color: lightblue;

}
</style>
</style>

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




<table >
	<thead>
		<tr>
			<th rowspan="2" colspan="2">Periodo</th>
			<th rowspan="2">ternos</th>
			<th rowspan="2">Faina</th>
			<th rowspan="2">Valor</th>
			<th colspan="5">Porões</th>
			<th rowspan="2">Total</th>
		</tr>

		<tr>
			<th>1</th>
			<th>2</th>
			<th>3</th>
			<th>4</th>
			<th>5</th>
		</tr>
	</thead>

	<tbody>

		<?php 


		while ($datas_ = $prep_d_ope->fetch()) {
			?>

			<tr>
				<th colspan="11"><?php echo $datas_['data_ref'];?></th>
			</tr>
			<?php 
			$query_busca_periodos = "
			SELECT
			ope.id as id,
			pope.data_ref, 
			pope.periodo as periodoid,
			ope.terno as ternoid,
			ope.faina as faina,
			(ope.faina)as paralizacoes
			FROM operacao ope join periodos_operacao pope on pope.id = ope.periodo where pope.data_ref = '".$datas_['data_ref']."'group by pope.data_ref,pope.periodo,ope.terno";

				// prioridade de ordem, data_ref, periodo dia, terno ( group by pope.data_ref,pope.periodo,ope.terno)
			$prep_peri = $con->prepare($query_busca_periodos);
			$prep_peri ->execute();

			while ($lins = $prep_peri->fetch()) {
				
				?>



				<tr>
					<td colspan="2"><?php echo $lins['periodoid']?></td>
					<td><?php echo $lins['ternoid']?></td>
					<td><?php echo $lins['faina']?></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>total terno</td>
				</tr>

				<tr>
					<td>Paralizações:</td>
					<td>Soma de horas</td>
					<td colspan="9">abreviações</td>

				</tr>

				<?php

			}

			?>

			<tr>
				<td colspan="3"></td>
				<td class="info" colspan="6">Meta: calculo se foi a meta</td>
				<td class="info" colspan="2">Total dia</td>
			</tr>
			<?php
		}
		?>



	</tbody>
</table>
<hr>

