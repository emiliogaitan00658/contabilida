<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
$Key = $_SESSION["Key"];
echo datos_clientes::sumatotal_subtotal($Key, $mysqli);