<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
echo $Key = $_SESSION["Key"];
echo $total = $_POST["total"];
echo $codigo_producto = $_GET["indcodigo"];
echo $precio = $_GET["precio"];


datos_clientes::cambio_factura_update($Key,$codigo_producto,$total,$precio, $mysqli);

