<?php

if (isset($_POST['chave'])) {
 include('main/p14_main_form_lancamento_barcode.php');
}else{
 include('main/p14_main_form_lancamento_manual.php');
}



?>