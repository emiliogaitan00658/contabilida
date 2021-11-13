<?php
include_once "../header/header_temporal.php";
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
echo $indproducto=$_GET["indproducto"];
echo $key=$_GET["indtemp"];
datos_clientes::eliminar_producto_factura($indproducto, $key, $mysqli);

if(!empty($_GET["indproducto"])) {
   echo '<script> location.href="../crear_factura.php" </script>';
}

include_once "../header/footer_temporal.php";