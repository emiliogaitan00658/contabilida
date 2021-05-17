<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
$Key = $_SESSION["Key"];
$codigo = $_POST["codigo"];
$descuento = $_GET["descuento_total"];
$descuento_total=$_GET["descuento_suma"];
datos_clientes::descuento_update($Key, $codigo,$descuento,$descuento_total, $mysqli);