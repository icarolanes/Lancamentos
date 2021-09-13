<?php // lista de atracações ativas, listagem por card

$queryATR = "SELECT 
at.id as id, 
at.Datracacao as atraca,
at.ope1 as inicio, 
at.ope2 as termino, 
at.Ddesatracacao as desatraca,
sum(lanc.liquido) as ttoe,
count(lanc.id) as veic,

nav.nNome as navio 
FROM atracacao at 
join navios nav on at.navio = nav.id 
left join lancamentos lanc on lanc.atracacao = at.id 

WHERE at.situacao = 1 group by at.id";
$prepara = $con->prepare($queryATR);
$prepara->execute();
while ($atracacao=$prepara->fetch()) {
  ?>


<div class="row row-cols-1 row-cols-md-4 g-4">
    <div class="col">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">MV <?php echo $atracacao['navio'];?></h5>
                <p class="card-text">
                    A: <?php  echo date('d/m/y H:i', strtotime($atracacao['atraca'])); ?> <br>
                    I: <?php  echo date('d/m/y H:i', strtotime($atracacao['inicio'])); ?><br>
                    T: <?php  echo date('d/m/y H:i', strtotime($atracacao['termino'])); ?><br>
                    D: <?php  echo date('d/m/y H:i', strtotime($atracacao['desatraca'])); ?> <br>
                </p>
                <button onclick="window.location.href='index.php?p=6&n=<?php echo $atracacao['id']?>'"
                    class="btn btn-primary"> abrir</button>
            </div>
            <div class="card-footer">
                <small
                    class="text-muted"><?php echo "TTo: ". ($atracacao['ttoe']/1000)." | Tv: ".$atracacao['veic']." "?>
                </small>
            </div>
        </div>
    </div>
</div>


<?php
}
?>