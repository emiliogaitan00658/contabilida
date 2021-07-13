<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ORTHODENTAL S.A CONTABILIDAD</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/cssindex.css">
    <link rel="stylesheet" href="assets/icomoon/style.css">

    <link rel="stylesheet" href="assets/bootstrap/jquery-ui.css">
    <script src="assets/js/jquery-1.12.4.js"></script>
    <script src="assets/js/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">

    <link rel="stylesheet" href="assets/animate/css/libs/animate.css">


    <script src="assets/sweetalert/sweetalert.min.js"></script>
    <script src="assets/jquery-expander/jquery.expander.min.js"></script>
</head>

<body style="background-color: rgb(247,247,249)" id="page-top">
<?php
session_start();
include_once 'BD-Connection/conection.php';
include_once 'BD-Connection/datos_clientes.php';
if (!empty($_SESSION)) {
    try {
        $idsucursal = $_SESSION['sucursal'];
        if (!empty($_SESSION['sucursal'])) {
            $indsucursal = $_SESSION['sucursal'];
            $talonario = datos_clientes::cambio_do($indsucursal, $mysqli);
        }
    } catch (Exception $e) {

    }
}
$dolar = datos_clientes::cambio_dolar($mysqli);


?>

<div class="white rounded container-fluid" id="esconder_menu">
    <div style="padding: 1em " class="container">
        <ul class="nav nav-tabs">
            <li class="nav-item text-uppercase">
                <a class="nav-link text-uppercase" href="#">Sucursal <b class="text-uppercase">
                        <?php if (!empty($_SESSION)) {
                            echo datos_clientes::nombre_sucursal($idsucursal);
                        } ?></b></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="factura_dia">Facturación</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="factura">Crear Factura</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="productos">Productos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="pagos_mora.php">Credito</a>
            </li>
            <li class="nav-item">
                <a class="nav-link bg-red" href="#"><i
                            class="icon-coin-dollar"> </i> <?php echo $dolar ?> Cordobas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link bg-red" href="talonario_cambio"> <?php if (!empty($_SESSION)) {
                        echo "No." . $talonario;
                    } ?></a>
            </li>
            <?php
            try {
                if (!empty($_SESSION['sucursal'])) {
                    ?>
                    <li class="nav-item">
                        <a class="nav-link" href="productos"><i class="icon-cog" size="18dp"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn-success white-text" href="temporal/cerrar_seccion.php"><i
                                    class="icon-cross"></i></a>
                    </li>
                    </li>
                    <?php
                }
            } catch (Exception $e) {
            }
            ?>
        </ul>
    </div>
</div>
<br>
