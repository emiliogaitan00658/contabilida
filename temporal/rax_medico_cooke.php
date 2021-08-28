<?php
include_once "../header/header_temporal.php";
session_start();
$rax = $_GET["inddoctor"];
$_SESSION["RAX"]=$rax;

echo '<script>
 swal({
   title: "Exito ?",
   text: "Sea agregado al doctor registro de radiografìa",
   icon: "success",
   buttons: true,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="../factura.php"
   }else {
     location.href="../factura.php"
   }
 });
 </script>';

include_once "../header/footer_temporal.php";
