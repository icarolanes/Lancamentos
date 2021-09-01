  <html lang="pt-br">
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="css/impressoes.css">
  <?php
  include('../../conexao.php');
  include('funcoes.php');
  function cop($con,$id){

//Select dados de atracação
    $qporoes = "select poroes from navios where id =".$id." limit 1";
    $prepara = $con->prepare($qporoes);
    $prepara->execute();
    $poroes = $prepara->fetch();
    $poroes['poroes'];
    $po = 1;
    $pors = "";
    for ($linhas=0; $linhas < $poroes['poroes'] ; $linhas++) { 
      $pors .= " if((lanc.armazem = ".$po." and ter.porao = lanc.armazem),sum(lanc.liquido),'0') as porao".$po.",";
      $po++;
    }
    $po2 = 1;
    $pors2 = "";
    for ($linhas2=0; $linhas2 < $poroes['poroes'] ; $linhas2++) { 
      $pors2 .= " (select sum(total) from plano_ope_porao where porao = ".$po2.") as porao".$po2.",";
      $po2++;
    }
    $atracacao_dados = "SELECT navio as navio, Natraca as numero, Datracacao as atracacao, Ddesatracacao as desatracacao, ope1 as inicio_ope, ope2 as termino_ope,timediff(ope2,ope1) as Toperacao , timediff(Ddesatracacao, Datracacao) as Tatracacao from atracacao where id = $id;";


    
    $prep_at = $con->prepare($atracacao_dados);
    $prep_at->execute();
    $dados_at = $prep_at->fetch();

    $c = 0;
    $acum = 0;




//consulta datas distintas de operação
    $dias_ope = "SELECT DISTINCT(data_ref) FROM periodos_operacao where atracacao = $id";
    $prep_d_ope = $con->prepare($dias_ope);
    $prep_d_ope->execute();


    include_once('print_teste_cop.php');
  }
//end function
  if (isset($_GET['n'])) {
    cop($con,$_GET['n']);
  }else{
  }
  ?>
  <form action="#">

    <label>ID da atracação</label>
    <input type="number" name="n">
    <button type="submit">ok</button>
  </form>
  </html>