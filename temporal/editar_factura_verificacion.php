<?php
include_once "../header/header_temporal.php";
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
$Key = $_GET["temp"];
$_SESSION["indcliente"] = $_GET["indcliente"];
$_SESSION["Key"] = $Key;
datos_clientes::eliminar_indtalonario($Key,$mysqli);
echo '<script> location.href="../crear_factura" </script>';

