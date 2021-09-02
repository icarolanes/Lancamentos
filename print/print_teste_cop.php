

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
		$cima = 0;
		$meta = 5000000;
		while ($datas_ = $prep_d_ope->fetch()) {
			//while acima é para listar os titulos de dias de operação
			?>
			<tr>
				<th colspan="11"><?php echo datahora($datas_['data_ref'],2);?></th>
			</tr>
			<?php

			//dentro dos periodos, é realizado uma nova consulta para mostrar os periodos dentro do dia. 
			$query_busca_periodos = "
			SELECT
			pope.id as id,
			pope.data_ref, 
			(select periodo from lista_periodos where id = pope.periodo) as periodo,
			ope.terno as ternoid,
			ope.faina as faina,
			(ope.faina)as paralizacoes,
			(select sum(lanc.liquido) from lancamentos lanc where operacao = ope.id ) as total
			FROM operacao ope join periodos_operacao pope on pope.id = ope.periodo where pope.data_ref = '".$datas_['data_ref']."' group by pope.data_ref,pope.periodo,ope.terno";
				// prioridade de ordem, data_ref, periodo dia, terno ( group by pope.data_ref,pope.periodo,ope.terno)
			$prep_peri = $con->prepare($query_busca_periodos);
			$prep_peri ->execute();
			// separação por dia
			$total_dia = "0";
			while ($lins = $prep_peri->fetch()) {
				
				?>
				<tr>
					<td colspan="2"><?php echo $lins['periodo']?></td>
					<td><?php echo $lins['ternoid']?></td>
					<td><?php echo $lins['faina']?></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><?php $total_dia = $total_dia+$lins['total']; echo numero($lins['total'])?></td>
				</tr>
				<?php

			}
			?>
			<tr>
				<td colspan="3"></td>
				<td class="info" colspan="6"><?php echo meta($meta,$total_dia)?></td>
				<td class="info" colspan="2"><?php echo numero($total_dia);?></td>
			</tr>
			<tr>
				<td>Resumos do dia:</td>
				<td>Periodos:<?php echo $cntperiodo = 2;?></td>
				<td>Media: <?php echo $media = numero($total_dia/$cntperiodo)?></td>
			</tr>
			<?php
		}
		?>
	</tbody>
</table>
<hr>