<style>
    .linea {
        display: inline-block;
        font-family: Helvetica, Arial, Verdana, sans-serif;
    }
    #contenidoTabla {
        font-size: 5px;
        font-family: Helvetica, Arial, Verdana, sans-serif;
    }
    td {
        font-size: 13px;
        font-family: Helvetica, Arial, Verdana, sans-serif;
    }
    th {
        font-size: 13px;
        font-family: Helvetica, Arial, Verdana, sans-serif;
    }
</style>
<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
$indsucursal = $_SESSION["sucursal"];
$talonario = datos_clientes::cambio_do($indsucursal, $mysqli);

$booos = datos_clientes::verficiar_talonario($key, $mysqli);
if ($booos["indtalonario"] == null) {
    datos_clientes::Factura_genera_codigo($key, $talonario, $indsucursal, $mysqli);
}
$cliente = datos_clientes::datos_clientes_generales($booos["indcliente"], $mysqli);
/// verificamos de que se registro el control de la factura
datos_clientes::update_Control_factura($talonario, $key, $mysqli);
?>
<div style="margin-top: 4.5em!important;margin-left: 1em">
    <p style="margin-left: 6em;width: 65%!important;" class="linea"><?php echo $cliente['nombre'] . " " . $cliente['apellido']; ?></p>
    <span style="position: static!important; width: 20%!important;" class="linea"><?php echo datos_clientes::fecha_get_pc(); ?></span>
</div>
<br>
<table style="height: 150px; width: 600px;" id="contenidoTabla">
    <tbody>
    <?php
    $subtotal = datos_clientes::sumatotal_subtotal($key, $mysqli);
    //$total = datos_clientes::sumatotal_factursa_subfactura($key, $mysqli);
    $total = datos_clientes::sumatotal_factura_total($key, $mysqli);

    $bandera = 0;
    $result4 = $mysqli->query("SELECT * FROM `factura` where factura.indtemp='$key'");
    while ($resultado = $result4->fetch_assoc()) {
        $bandera = $bandera + 1;
        ?>
        <tr style="height: 5px;">
            <td style="width: 10px; height: 20px;margin-left: 0;padding-left: 0;"
                class="left-align"><?php echo $resultado['codigo_producto']; ?></td>
            <td style="width: 40px; height: 20px;margin-left: 6px"
                class="right-align"><?php echo $resultado['unidad']; ?></td>
            <td style="width: 400px; height: 20px;margin-left: 6px"><?php echo $resultado['nombre_producto']; ?></td>
            <td style="width: 68px; height: 20px;padding-left: 2em"
                class="right-align"><?php echo number_format(($resultado['precio_unidad']), 2, '.', ','); ?></td>
            <td style="width: 68px; height: 20px;padding-left: 1em"
                class="right-align"><?php echo number_format(($resultado['precio_total']), 2, '.', ','); ?></td>
        </tr>
        <?php
    }
    $res = 10 - $bandera;
    if ($bandera == "0") {
    } else {
        for ($i = 1; $i <= $res; $i++) {
            ?>
            <tr style="height: 5px;">
                <td style="width: 100px; height: 20px;">&nbsp;</td>
                <td style="width: 40px; height:20px;">&nbsp;</td>
                <td style="width: 400px; height:20px;">&nbsp;</td>
                <td style="width: 68px; height:20px;">&nbsp;</td>
                <td style="width: 68px; height:20px;">&nbsp;</td>
            </tr>
        <?php }
    } ?>
    <tr style="height: 5px;margin-top: 0!important;">
        <td style="width: 100px; height:20px;">&nbsp;</td>
        <td style="width: 40px; height:20px;">&nbsp;</td>
        <td style="width: 400px; height:20px;">&nbsp;</td>
        <td style="width: 68px; height:20px;">&nbsp;</td>
        <td style="width: 68px; height:20px;font-size: 15px!important;"><?php echo number_format(($subtotal), 2, '.', ','); ?></td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height:20px;">&nbsp;</td>
        <td style="width: 40px; height:20px;">&nbsp;</td>
        <td style="width: 400px; height:20px;">&nbsp;</td>
        <td style="width: 68px; height:20px;">&nbsp;</td>
        <td style="width: 68px; height:20px;font-size: 15px!important;"><?php echo number_format(($total), 2, '.', ','); ?></td>
    </tr>
    </tbody>
</table>

