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
    <h2 class="center text-uppercase">Venta de ortho dental (Exedentes de ley 822 Art. 127 y 136)</h2>
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


            $result4 = $mysqli->query("SELECT * FROM `sucursal` order by serie");
            while ($resultado = $result4->fetch_assoc()) {
                ?>
                <tr>
                    <td><?php echo $resultado["serie"]; ?></td>
                    <td><?php echo $resultado["nombre_sucursal"]; ?></td>
                    <td><?php echo datos_clientes::primera_factura_no($resultado["indsucursal"],$fecha1,$fecha2,$mysqli); ?></td>
                    <td><?php echo datos_clientes::ultima_factura_no($resultado["indsucursal"],$fecha1,$fecha2,$mysqli); ?></td>
                    <td class="center-align"><?php echo datos_clientes::conteo_factura($resultado["indsucursal"],$fecha1,$fecha2,$mysqli); ?></td>
                    <td class="center-align"><?php echo datos_clientes::suma_total_venta_contador($resultado["indsucursal"],$fecha1,$fecha2,$mysqli); ?></td>
                </tr>
                <?php
            } ?>
            </tbody>
        </table>
    </div>
