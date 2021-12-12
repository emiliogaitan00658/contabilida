<style>

    @font-face {
        font-family: DraftB-RegularIta;
        font-weight: normal;
        src: url("fonts/DraftB-RegularIta.otf") format("opentype");
    }
    @font-face {
        font-family: DraftB-Regular;
        font-weight: normal;
        src: url("fonts/DraftB-Regular.otf") format("opentype");
    }
    .linea {
        display: inline-block;
        font-family: 'lucida grande', helvetica, verdana, arial, sans-serif!important;
    }
    #contenidoTabla {
        font-size: 5px;
        font-family: 'lucida grande', helvetica, verdana, arial, sans-serif!important;
    }
    td {
        font-size: 13px;
        font-family: 'lucida grande', helvetica, verdana, arial, sans-serif!important;
    }
    th {
        font-size: 13px;
        font-family: 'lucida grande', helvetica, verdana, arial, sans-serif!important;
    }
</style>
<body>
<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
$talonario = datos_clientes::cambio_do($indsucursal, $mysqli);

$booos = datos_clientes::verficiar_talonario($key, $mysqli);
if ($booos["indtalonario"] == null) {
    datos_clientes::Factura_genera_codigo($key, $talonario, $indsucursal, $mysqli);
    //datos_clientes::cambio_fecha_factura();
}
$cliente = datos_clientes::datos_clientes_generales($booos["indcliente"], $mysqli);
/// verificamos de que se registro el control de la factura
datos_clientes::update_Control_factura($talonario, $key, $mysqli);
?>
<div style="margin-top: 5.3em!important;margin-left: 1em">
    <p style="margin-left: 3em;width: 65%!important; font-size: 13px;" class="linea"><b><?php echo $cliente['nombre'] . " " . $cliente['apellido']; ?></b></p>
    <span style="position: static!important; width: 20%!important; font-size: 16px;margin-left: 3em;" class="linea"><b><?php echo datos_clientes::fecha_get_pc(); ?></b></span>
</div>
<br>
<table style="height: 150px; width: 600px;" id="contenidoTabla" >
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
                class="left-align"><b><?php echo $resultado['codigo_producto']; ?></b></td>
            <td style="width: 40px; height: 20px;margin-left: 6px;"
                class="right-align"><b><?php echo $resultado['unidad']; ?></b></td>
            <td style="width: 400px; height: 20px;margin-left: 4px;"><b><?php echo $resultado['nombre_producto']; ?></b></td>
            <td style="width: 68px; height: 20px;padding-left: 0em;"
                class="right-align"><b><?php echo number_format(($resultado['precio_unidad']), 2, '.', ','); ?></b></td>
            <td style="width: 68px; height: 20px;padding-left: 1em;"
                class="right-align"><b><?php echo number_format(($resultado['precio_total']), 2, '.', ','); ?></b></td>
        </tr>
        <?php
    }
    $res = 9 - $bandera;
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
        <td style="width: 68px; height:10px;font-size: 15px!important;">&nbsp;&nbsp;<b><?php echo number_format(($subtotal), 2, '.', ','); ?></b></td>
    </tr>
    <tr style="height: 5px;" >
        <td style="width: 100px; height:20px;">&nbsp;</td>
        <td style="width: 40px; height:20px;">&nbsp;</td>
        <td style="width: 400px; height:20px;">&nbsp;</td>
        <td style="width: 68px; height:20px;">&nbsp;</td>
        <td style="width: 68px; height:20px;font-size: 15px!important;">&nbsp;&nbsp;<b><?php echo number_format(($total), 2, '.', ','); ?></b></td>
    </tr>
    </tbody>
</table>
</body>

