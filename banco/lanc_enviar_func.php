<?php
include('conexao.php');

function cpf($id,$con) {
$query = "SELECT * FROM pessoa where id =".$id;
$prepare=$con->prepare($query);
$prepare->execute();

$pessoa = $prepare->fetch();


$dados['nome'] = $pessoa['nome'];
$dados['sobrenome'] = $pessoa['sobrenome'];
$dados['id'] =  $pessoa['id'];

return ($dados);

}


function nome ($cpf,$con){

$query = "SELECT * FROM pessoa where cpf =".$cpf;
$prepare=$con->prepare($query);
$prepare->execute();

$pessoa = $prepare->fetch();

$nome = $pessoa['nome'];
$id   = $pessoa['id'];

return cpf($id,$con);

}



  $dados =  nome(15766723792,$con);

echo $dados['nome'];
echo $dados['sobrenome'];



?>