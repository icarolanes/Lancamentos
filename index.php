<!doctype html>
  <?php 
  
  include('func/seguranca.php');
  include('func/conexao.php');
  include('assets/paginas.php');
  include_once('tratamentos.php');

  ?>
  
  <html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Controle de Movimentação</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/funcoes.js"></script>

    
    <!-- Bootstrap core CSS -->
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }
    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>
  <!-- Custom styles for this template -->
  <link href="dashboard.css" rel="stylesheet">
</head>
<body>
  <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Controle de Movimentação</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search" >
    <div class="navbar-nav">
      <div class="nav-item text-nowrap">
        <a class="nav-link px-3" href="func/sair.php"><?php echo $_SESSION['usuarioLogin'];?></a>
      </div>
    </div>
  </header>
  <div class="container-fluid">
    <div class="row">
      <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
        <div class="position-sticky pt-3">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link " aria-current="page" href="index.php">
                <span data-feather="home"></span>
                Dashboard
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.php?p=6">
                <span data-feather="bar-chart-2"></span>
                Lançamentos
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.php?p=13">
                <span data-feather="settings"></span>
                Cadastros
              </a>
            </li>
          </ul>
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span>Area do Adm</span>
            <a class="link-secondary" href="#" aria-label="Add a new report">
              <span data-feather="plus-circle"></span>
            </a>
          </h6>
          <ul class="nav flex-column mb-2">
            <li class="nav-item">
              <a class="nav-link" href="index.php?p=4">
                <span data-feather="users"></span>
                Usuários
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.php?p=8">
                <span data-feather="anchor"></span>
                Atracação
              </a>
            </li>
          </ul>
        </div>
      </nav>
      <?php
      if (isset($_GET['p'])) {

       $page_n = $_GET['p'];
     }else{

       $page_n = '0';
     }
     include($p[$page_n]);

     ?>
   </div>
 </div>
</body>
<script src="assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>



<script type="text/javascript">
  /* globals Chart:false, feather:false */
  (function () {
    'use strict'
    feather.replace({ 'aria-hidden': 'true' })
  })()
</script>



<script type="text/javascript">
  
  <?php
  $hoje =  date("Y-m-d", strtotime("now"));
  $dias =  date("Y-m-d",   strtotime("-5 day"));

 
  if ($page_n != 0) {
    // code...
  }else{

    $query_chart = "SELECT 
    sum(lanc.liquido) as liquido,
    pope.data_ref as periodo ,
    lper.abv as abv 
    from lancamentos lanc 
    join periodos_operacao pope on lanc.periodo = pope.id 
    join lista_periodos lper on pope.periodo = lper.id 
    WHERE pope.data_ref BETWEEN '$dias' AND '$hoje'  group by pope.data_ref,pope.periodo  order by pope.data_ref asc  ";
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
    

    
    var ctx = document.getElementById('por_periodo')
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
            beginAtZero: true
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



</html>