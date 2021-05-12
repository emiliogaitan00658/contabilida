<?php
include_once "../header/header_temporal.php";
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
$Key=datos_clientes::Verificar_generador_codigo($mysqli);

if(!empty($_GET["indcliente"])) {
$_SESSION["indcliente"]=$_GET["indcliente"];
$_SESSION["Key"]=$Key;
    echo '<script> location.href="../crear_factura" </script>';
}else{
    echo '<script>
 swal({
   title: "Error ?",
   text: "Error verificacion de usuario",
   icon: "error",
   buttons: false,

 })
 .then((willDelete) => {
   if (willDelete) {
     //location.href="../factura";
   }else {
    /// location.href="../factura";   }
 });
 </script>';
}





include_once "../header/footer_temporal.php";