<?php
include_once "../header/header_temporal.php";
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
$codigo = $_GET["indtemp"];
$_SESSION["Key"] = "";
datos_clientes::eliminar_todo_factura($codigo, $mysqli);

echo '<script> location.href="../factura.php" </script>';

include_once "../header/footer_temporal.php";