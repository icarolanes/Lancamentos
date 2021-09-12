$('document').ready(function(){
  $.ajax({
    type:"POST",
    url: "banco/p0_cons_chart.php",
    dataType: "json",
    success:function(data){
      var placa = [];
      var total = [];
      for (var i = 0; i < data.length ; i++){
        placa.push(data[i].placa); 
        total.push(data[i].total);
      }
      grafico(placa,total);
    }
  });
});
function grafico(val_1,val_2) {
  'use strict'
  feather.replace({ 'aria-hidden': 'true' })
  // Graphs
  var ctx = document.getElementById('myChart')
  // eslint-disable-next-line no-unused-vars
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: val_1,
      datasets: [{
        data: val_2,
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
            beginAtZero: true
          }
        }]
      },
      legend: {
        display: false
      }
    }
  })
}