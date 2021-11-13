<?php
include_once "../header/header_panel.php";
include_once "../BD-Connection/conection.php";
include_once "../BD-Connection/datos_clientes.php";
if ($_GET) {
    $temp = $_GET['temp'];
    $indcliente = $_GET['indcliente'];
    $res = datos_clientes::eliminar_credito($temp, $mysqli);
    header("Location: ../credito.php?indcliente=".$indcliente);
}
include_once "../header/footer_temporal.php";
