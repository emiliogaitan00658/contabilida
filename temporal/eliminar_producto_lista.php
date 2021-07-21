<?php
include_once "../header/header_temporal.php";
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
$indproducto=$_GET["producto"];
datos_clientes::eliminar_producto_lista($indproducto,$mysqli);

if(!empty($_GET["producto"])) {
    echo '<script>
 swal({
   title: "Exito ?",
   text: "Producto Eliminado",
   icon: "success",
   buttons: false,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="producto_cambio_precio.php";
   }else {
     location.href="producto_cambio_precio.php";   }
 });
 </script>';
}







include_once "../header/footer_temporal.php";
