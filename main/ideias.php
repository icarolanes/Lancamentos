
reload de pagina principal quando pop up fechar
//principal.htm
<body onunload="window.opener.location.reload();">

//popup.htm
<script>opener.location.reload(); window.close();</script>

/// busca de banco para script de chart resumo

  <script src="assets/dist/js/bootstrap.bundle.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>


  <script type="text/javascript">
    /* globals Chart:false, feather:false */




    (function () {
      'use strict'

      feather.replace({ 'aria-hidden': 'true' })


  <?php
/// correto
  $query_chart = "SELECT sum(lanc.liquido) as liquido, pope.data_ref as periodo , lper.abv as abv  from lancamentos lanc join periodos_operacao pope on lanc.periodo = pope.id join lista_periodos lper on pope.periodo = lper.id group by pope.data_ref,pope.periodo limit 5 ";
  $prepare_chart = $con->prepare($query_chart);
  
  $prepare_chart->execute();
  $contar_res = $prepare_chart ->rowCount();

  $t = 0;
  $v = 0;
  while($valores_rel = $prepare_chart->fetch()){

    $titulo[$t] = date('d/m', strtotime($valores_rel['periodo']))." ".$valores_rel['abv'];
    

    $t++;
    $valor[$v]  = $valores_rel['liquido']/1000;
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
})()
</script>