<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
include "../header/header_imprimir.php";
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
$fecha1 = $_GET['textfecha1'];
$fecha2 = $_GET['textfecha2'];
$sucursal = $_GET['textsucursal'];
?>
<style>
    * {
        font-size: 12px !important;
    }

    .vertical-header span {
        writing-mode: vertical-rl;
        transform: rotate(180deg);
        text-align: left;
        max-height: 150px;
    }
</style>

<div class="center-align">
    <h4>Reporte de materiales Sucursal <span>
            <?php if (!empty($_SESSION)) {
                echo datos_clientes::nombre_sucursal($idsucursal);
            } ?>
        </span></h4>
    <p>Fecha reporte : <b><?php echo $fecha1 . " al " . $fecha2; ?></b></p>
</div>
<div class=" white rounded" style="margin: 0em;">
    <br>
    <div class="  rounded white" style="width: 100%!important;">
        <table class="table table-bordered" style="padding: 1em;">
            <thead>
            <tr style="border-bottom: 1px solid black">
                <th class="vertical-header" scope="col"><span># Factura</span></th>
                <th class="center-align" scope="col">Nombre y Apellido</th>
                <th class="vertical-header" scope="col"><span>Efectivo</span></th>
                <th class="vertical-header" scope="col"><span>Dolar</span></th>
                <th class="vertical-header" scope="col"><span>Cordobas</span></th>
                <th class="vertical-header" scope="col"><span>Tarjeta</span></th>
                <th class="vertical-header" scope="col"><span>Traferencia</span></th>
                <th class="vertical-header" scope="col"><span>BAC</span></th>
                <th class="vertical-header" scope="col"><span>LAFISE</span></th>
                <th class="vertical-header" scope="col"><span>Credito</span></th>
                <th class="vertical-header" scope="col"><span>RX</span></th>
                <th class="center-align" scope="col">Subtotal C$</th>
                <th class="center-align" scope="col">Total C$</th>
                <th class="center-align" scope="col">Total $</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $fecha = datos_clientes::fecha_get_pc_MYSQL();
            $result4 = $mysqli->query("SELECT * FROM `total_factura` WHERE total_factura.fecha BETWEEN '$fecha1' AND  '$fecha2'and total_factura.indsucursal='$sucursal' and indtalonario IS NOT NULL");

            $total_factura = 0;
            $total_factura_anulada = 0;
            $subtotal_neto = 0;
            $total_neto = 0;
            $tipo = null;

            while ($resultado = $result4->fetch_assoc()) {
                $indcliente = $resultado['indcliente'];
                $nombre_apelido = datos_clientes::nombre_apellido_cliente($indcliente, $mysqli);
                $total_factura = 1 + $total_factura;

                $tipo = datos_clientes::tipo_factura_RAX($resultado["indtalonario"], $sucursal, $mysqli);

                if ($resultado['bandera'] == "1") {
                    $subtotal_neto = $subtotal_neto + $resultado["subtotal"];
                    $total_neto = $total_neto + $resultado["total"];
                    ?>
                    <tr>
                        <td class="center-align"><?php echo $resultado["indtalonario"]; ?></td>
                        <td class="center-align"><?php echo $nombre_apelido; ?></td>
                        <td class="center-align"><?php if ($resultado["efectivo"] == "1") {
                                echo "<b>X</b>";
                            } else {
                                echo "";
                            } ?></td>
                        <td class="center-align"><?php if ($resultado["dolar"] == "1") {
                                echo "<b>X</b>";
                            } else {
                                echo "";
                            } ?></td>
                        <td class="center-align"><?php if ($resultado["cordoba"] == "1") {
                                echo "<b>X</b>";
                            } else {
                                echo "";
                            } ?></td>
                        <td class="center-align"><?php if ($resultado["targeta"] == "1") {
                                echo "<b>X</b>";
                            } else {
                                echo "";
                            } ?></td>
                        <td class="center-align"><?php if ($resultado["trasferencia"] == "1") {
                                echo "<b>X</b>";
                            } else {
                                echo "";
                            } ?></td>
                        <td class="center-align"><?php if ($resultado["bac"] == "1") {
                                echo "<b>X</b>";
                            } else {
                                echo "";
                            } ?></td>
                        <td class="center-align"><?php if ($resultado["lafise"] == "1") {
                                echo "<b>X</b>";
                            } else {
                                echo "";
                            } ?></td>
                        <td class="center-align"><?php if ($resultado["credito"] == "1") {
                                echo "<b>X</b>";
                            } else {
                                echo "";
                            } ?></td>
                        <td class="center-align"><b><?php if ($tipo == "RX") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?></b></td>
                        <td class="center-align"><?php echo number_format($resultado["subtotal"], 2, '.', ','); ?></td>
                        <td class="center-align"><?php echo number_format($resultado["total"], 2, '.', ','); ?></td>
                        <td class="center-align"><?php echo number_format(($resultado["total"] / $dolar), 2, '.', ','); ?></td>
                    </tr>
                    <?php
                } else {
                    $total_factura_anulada = $total_factura_anulada + 1; ?>
                    <tr>
                        <td class="center-align">
                            <del> <?php echo $resultado["indtalonario"]; ?></del>
                        </td>
                        <td class="center-align">
                            <del><?php echo $nombre_apelido; ?></del>
                        </td>
                        <td class="center-align">
                            <del><?php if ($resultado["efectivo"] == "1") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?></del>
                        </td>
                        <td class="center-align">
                            <del><?php if ($resultado["dolar"] == "1") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?></del>
                        </td>
                        <td class="center-align">
                            <del><?php if ($resultado["cordoba"] == "1") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?></del>
                        </td>
                        <td class="center-align">
                            <del><?php if ($resultado["targeta"] == "1") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?>v
                        </td>
                        <td class="center-align">
                            <del><?php if ($resultado["trasferencia"] == "1") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?></del>
                        </td>
                        <td class="center-align">
                            <del><?php if ($resultado["bac"] == "1") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?></del>
                        </td>
                        <td class="center-align">
                            <del><?php if ($resultado["lafise"] == "1") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?></del>
                        </td>
                        <td class="center-align">
                            <del><?php if ($resultado["credito"] == "1") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?></del>
                        </td>
                        <td class="center-align"><b><?php if ($tipo == "RX") {
                                    echo "<b>X</b>";
                                } else {
                                    echo "";
                                } ?></b></td>
                        <td class="center-align">
                            <del><?php echo number_format($resultado["subtotal"], 2, '.', ','); ?></del>
                        </td>
                        <td class="center-align">
                            <del><?php echo number_format($resultado["total"], 2, '.', ','); ?>v
                        </td>
                        <td class="center-align"><?php echo number_format(($resultado["total"] / $dolar), 2, '.', ','); ?></td>

                    </tr>
                    <?php
                }
            } ?>
            </tbody>
        </table>
        <div class="container">
            <hr>
            <h5>Informe de facturaciòn</h5>
            <h5>Subtotal C$=<?php echo number_format($subtotal_neto, 2, '.', ','); ?> </h5>
            <h5>Total C$=<b> <?php echo number_format($total_neto, 2, '.', ','); ?></b></h5>
            <p>Total de Factura = <?php echo $total_factura; ?></p>
            <p>Total de Factura Anulada = <?php echo $total_factura_anulada; ?></p>
            <hr>
            <h5>Informe de Pago</h5>
            <h5>Informe de Cordobas
                C$: <?php echo number_format(datos_clientes::cierre_cordobas($fecha1, $fecha2, $sucursal, $mysqli), 2, '.', ','); ?></h5>
            <h5>Informe de Dolares
                U$: <?php echo number_format(datos_clientes::cierre_dolar($fecha1, $fecha2, $sucursal, $mysqli), 2, '.', ','); ?></h5>
            <hr>
        </div>
    </div>

    <script>
        function verficar_anulacion(codigo) {
            swal({
                title: "Anular?",
                text: "Seguro de Anular Factura",
                icon: "success",
                buttons: true,

            })
                .then((willDelete) => {
                    if (willDelete) {
                        location.href = "temporal/anular.php?key=" + codigo;
                    } else {
                        location.href = "factura_dia.php";
                    }
                });
        }

        document.getElementById("element").style.display = "none";
    </script>

    <?php include "../header/footer_temporal.php" ?>

