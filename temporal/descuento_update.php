<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
$Key = $_SESSION["Key"];
$codigo = $_POST["codigo"];
$descuento_total = $_GET["descuento_total"];

datos_clientes::descuento_total_update($Key, $codigo,$descuento_total, $mysqli);

