<?php
include_once "../header/header_temporal.php";
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
$key=$_GET["key"];
datos_clientes::eliminar_todo_las_factura($key,$mysqli);
echo '<script>
 swal({
   title: "Exito?",
   text: "Factura Eliminada",
   icon: "success",
   buttons: false,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="../factura_dia.php";
   }else {
    location.href="../factura_dia.php";   }
 });
 </script>';


include_once "../header/footer_temporal.php";

