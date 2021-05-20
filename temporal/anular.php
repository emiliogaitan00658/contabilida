<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
echo $key = $_GET["key"];
datos_clientes::anular_factura($key, $mysqli);
echo "<script>location.href='../factura_dia.php';</script>"
?>

