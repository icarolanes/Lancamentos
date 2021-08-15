<script type="text/javascript">
  <?php
  if ($page<> 0){
  }else{
    $query_chart = "SELECT sum(lanc.liquido) as liquido, pope.data_ref as periodo , lper.abv as abv  from lancamentos lanc join periodos_operacao pope on lanc.periodo = pope.id join lista_periodos lper on pope.periodo = lper.id group by pope.data_ref,pope.periodo order by pope.data_ref asc ";
    $prepare_chart = $con->prepare($query_chart);
    
    $prepare_chart->execute();
    $contar_res = $prepare_chart ->rowCount();
    $t = 0;
    $v = 0;
    while($valores_rel = $prepare_chart->fetch()){
      $titulo[$t] = date('d/m', strtotime($valores_rel['periodo']))." ".$valores_rel['abv'];
      
      $t++;
      $valor[$v]  = $valores_rel['liquido'];
      $v++;
    }
    ?>
  // Graphs
  var ctx = document.getElementById('myChart')
  // eslint-disable-next-line no-unused-vars
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
      <?php 
      for ($i=0; $i < $contar_res ; $i++) { 
        echo "'".$titulo[$i]."',";
      }
      ?>
      ],
      datasets: [{
        data: [
        <?php 
        for ($i=0; $i < $contar_res ; $i++) { 
          echo "'".$valor[$i]."',";
        }
        ?>
        ],
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: '#007bff',
        borderWidth: 4,
        pointBackgroundColor: '#007bff'
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: false
          }
        }]
      },
      legend: {
        display: false
      }
    }
  })
  <?php 
}
?>
</script>