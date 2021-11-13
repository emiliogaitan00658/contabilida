<?php
include_once "../header/header_panel.php";
include_once "../BD-Connection/conection.php";
include_once "../BD-Connection/datos_clientes.php";
if ($_GET) {
    $indcliente = $_GET['indcliente'];
    $res = datos_clientes::eliminar_cuenta_cliente($indcliente, $mysqli);
    header("Location: ../factura.php");
}
include_once "../header/footer_temporal.php";

