<?php
include_once "../header/header_panel_informe.php";
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
$fecha1 = $_POST["textfecha1"];
$fecha2 = $_POST["textfecha2"];
?>
<div class="container">
    <hr>
    <h2 class="center text-uppercase">Venta de ortho dental (Exentas de ley 822 Art. 127 y 136)</h2>
    <h5 class="center-align">Fecha de facturaciòn <?php echo datos_clientes::traforma_fecha($fecha1) ?>
        al <?php echo datos_clientes::traforma_fecha($fecha2) ?></h5>
    <hr>
</div>
<div class="row">
    <div class="z-depth-1 rounded white center-block" style="width: 95%">
        <table class="table table-bordered">
            <thead>
            <tr style="border-bottom: 1px solid black;">
                <th scope="col">N.# SUCURSAL</th>
                <th scope="col" class="center-align">SUCURSAL</th>
                <th scope="col">N.# INICIO</th>
                <th scope="col">N.# FINAL</th>
                <th scope="col">TOTAL DE FACTURAS</th>
                <th scope="col">VENTAS DE CONTADO</th>
                <th scope="col">VENTA AL CREDITO</th>
                <th scope="col">TOTAL VENDIDO POR MES</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $total_factura = 0;

            $result4 = $mysqli->query("SELECT * FROM `sucursal` order by serie");
            while ($resultado = $result4->fetch_assoc()) {
                $n1 = 0;
                $n2 = 0;
                $sum = 0;
                $d=0;
                ?>
                <tr>
                    <td class="center-align"><?php echo $resultado["serie"]; ?></td>
                    <td><?php echo $resultado["nombre_sucursal"]; ?></td>
                    <td><?php echo datos_clientes::primera_factura_no($resultado["indsucursal"], $fecha1, $fecha2, $mysqli); ?></td>
                    <td><?php echo datos_clientes::ultima_factura_no($resultado["indsucursal"], $fecha1, $fecha2, $mysqli); ?></td>
                    <td class="center-align"><?php echo $d=datos_clientes::conteo_factura($resultado["indsucursal"], $fecha1, $fecha2, $mysqli); $total_factura=$total_factura+$d; ?></td>
                    <td class="center-align"><?php echo $n1 = datos_clientes:: suma_total_venta_contado_totales($resultado["indsucursal"], $fecha1, $fecha2, $mysqli); ?></td>
                    <td class="center-align"><?php echo $n2 = datos_clientes::suma_total_venta_credito_totales($resultado["indsucursal"], $fecha1, $fecha2, $mysqli); ?></td>
                    <td class="center-align"><?php echo datos_clientes::total_suma_contador($resultado["indsucursal"], $fecha1, $fecha2, $mysqli) ?></td>
                </tr>
                <?php
            } ?>
            <tr style="height: 5px;margin-top: 0!important;">
                <td class="center-align"><b>TOTAL:</b></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="center-align"><?php echo $total_factura; ?></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </tbody>
        </table>
    </div>
