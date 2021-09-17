/*https://www.chartjs.org/*/
$('document').ready(function(){
  $.ajax({
    type:"POST",
    url: "banco/p0_cons_chart.php",
    dataType: "json",
    success:function(data){
      var data_ref = [];
      var periodo = [];
      var total = [];
      var total2 = [];
      for (var i = 0; i < data.length ; i++){
        data_ref.push(data[i].data_ref); 
        periodo.push(data[i].periodo); 
        total.push((data[i].total));
        total2.push((data[i].total)*2);
      }
      grafico(periodo,total,total2);
    }
  });
});
function grafico(val_1,val_2,val_3) {
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
        label:'Descarregado',
        data: val_2,
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: '#007bff',
        borderWidth: 4,
        pointBackgroundColor: '#007bff'
      },{
        label:'ww',
        data: val_3,
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: 'red',
        borderWidth: 4,
        pointBackgroundColor: 'green'
      }],
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
        display: true
      }
    }
  })
}
setInterval(function(){ 

}, 3000);