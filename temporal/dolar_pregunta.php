<?php
include_once "../header/header_temporal.php";
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
$key=$_GET["key"];
echo '<script>
 swal({
   title: "Dolar?",
   text: "Desea imprimir la factura en dolar?",
   icon: "success",
   buttons: true,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="../PDF/cotizar_factura_link.php?dolar=1&key='. $key.'";
   }else {
    location.href="../PDF/cotizar_factura_link.php?dolar=0&key='. $key.'";   }
 });
 </script>';
include_once "../header/footer_temporal.php";

