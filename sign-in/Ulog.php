<?php
//utilizar objeto para realizar login... em tentativa

session_start();
$usuariot = $_POST['usuario'];
$senhat = base64_encode($_POST['senha']);
include('../../conexao.php');

class usuario
{
    private $id;
    private $pessoa;
    private $tipo;
    private $usuario;

    public function __construct($id, $pessoa, $tipo, $usuario)
    {
        $this->id = $id;
        $this->pessoa = $pessoa;
        $this->tipo = $tipo;
        $this->usuario = $usuario;
    }
}

$senha = base64_encode($_POST['senha']);

$queryuser = "call logar($usuario, $senha)";
$prepare = $con->prepare($queryuser);
$prepare->execute();

$usuario = new usuario('1', 'icaro', 'admin', 'icaro');