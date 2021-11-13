<style type="text/css">
    @font-face {
        font-family: "source_sans_proregular";
        src: local("Source Sans Pro"), url("fonts/sourcesans/sourcesanspro-regular-webfont.ttf") format("truetype");
        font-weight: normal;
        font-style: normal;

    }

    * {
        font-family: "source_sans_proregular", Calibri, Candara, Segoe, Segoe UI, Optima, Arial, sans-serif;
    }
</style>

<style>
    * {
        font-family: Helvetica;
    }

    .linea {
        display: inline-block;
        font-family: 'lucida grande', helvetica, verdana, arial, sans-serif !important;
    }

    #contenidoTabla {
        font-size: 5px;
        font-family: 'lucida grande', helvetica, verdana, arial, sans-serif !important;
        border-color: #0d0d0d;
    }

    td {
        font-size: 13px;
        font-family: 'lucida grande', helvetica, verdana, arial, sans-serif !important;
    }

    th {
        font-size: 13px;
        font-family: 'lucida grande', helvetica, verdana, arial, sans-serif !important;
    }
    html {
        font-family: sans-serif;
        line-height: 1.15;
        -webkit-text-size-adjust: 100%;
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0)
    }
    body {
        margin: 0;
        font-family: Nunito, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #858796;
        text-align: left;
        background-color: #fff
    }
    .text-center {
        text-align: center !important;
    }
    .center-blocks {
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
    .left-align {
         text-align: left;
     }

    .right-align {
        text-align: right;
    }

    .center, .center-align {
        text-align: center;
    }

    .table {
        width: 100%;
        margin-bottom: 0;
        color: #858796
    }

    .table td, .table th {
        padding: 0;
        vertical-align: top;
        border-top: 1px solid #e3e6f0
    }

    .table thead th {
        vertical-align: bottom;
        border-bottom: 2px solid #e3e6f0
    }

    .table tbody + tbody {
        border-top: 2px solid #e3e6f0
    }

    .table-sm td, .table-sm th {
        padding: 0
    }


</style>
<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
$indsucursal = $_SESSION["sucursal"];
$dolar=datos_clientes::cambio_dolar($mysqli);
$talonario = datos_clientes::cambio_do($indsucursal, $mysqli);

$booos = datos_clientes::verficiar_talonario($key, $mysqli);
if ($booos["indtalonario"] == null) {
    //datos_clientes::Factura_genera_codigo($key, $talonario, $indsucursal, $mysqli);
    //datos_clientes::cambio_fecha_factura();
}
$cliente = datos_clientes::datos_clientes_generales($booos["indcliente"], $mysqli);
/// verificamos de que se registro el control de la factura
//datos_clientes::update_Control_factura($talonario, $key, $mysqli);



?>
<div class="container">
    <div class="text-center" style="width: 100%!important;">
        <br>
        <img src="../imgbanco.png" width="15%" alt=""><h2 class="text-center" style="position: center!important;margin-bottom: 0!important;">ORTHODENTAL S.A</h2>
        <p class="red-text text-center " style="font-style: normal;margin-top: 0!important;">Producto de Credito</p>
    </div>
</div>
<div style="margin-left: 1em">
    <p style="margin-left: 2em;width: 65%!important; font-size: 13px;" class="linea">
        <b>CLIENTE: <?php echo $cliente['nombre'] . " " . $cliente['apellido']; ?></b></p>
    <span style="position: static!important; width: 40%!important; font-size: 16px;margin-left: 1em;"
          class="linea"><b><span
                    style="font-size: 13px!important;">FECHA: </span> <?php echo datos_clientes::fecha_get_pc(); ?></b></span>
</div>
<table style="height: 130px!important; width: 100%!important;margin: 0!important;"
       class="table table-bordered">
    <tbody>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;"><b class="center-align">Codigo</b></td>
        <td style="width: 40px; height:20px;" class="text-center"><b class="center-align">Cantidad</b></td>
        <td style="width: 400px; height:20px;" class="text-center"><b class="center-align">Detalle del Producto<b></td>
        <td style="width: 68px; height:20px;" class="text-center"><b class="center-align">P./Unit</td>
        <td style="width: 68px; height:20px;" class="text-center"><b class="center-align">Precio Total<b></td>
    </tr>
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
            <td style="width: 40px; height: 20px;margin-left: 6px"
                class="text-center"><b><?php echo $resultado['unidad']; ?></b></td>
            <td style="width: 400px; height: 20px;margin-left: 6px"><b><?php echo $resultado['nombre_producto']; ?></b>
            </td>
            <td style="width: 68px; height: 20px;padding-left: 2em"
                class="right-align"><b><?php echo number_format((($pregunta == 1 ? $resultado['precio_unidad']/$dolar: $resultado['precio_unidad'])), 2, '.', ','); ?></b></td>
            <td style="width: 68px; height: 20px;padding-left: 1em"
                class="right-align"><b><?php echo number_format((($pregunta == 1 ?$resultado['precio_total']/$dolar:$resultado['precio_total'])), 2, '.', ','); ?></b></td>
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
        <td style="width: 68px; height:20px;"><b>Subtotal <?php echo $pregunta == 1 ?"$":"C$"; ?></b></td>
        <td style="width: 68px; height:20px;font-size: 15px!important;">
            <b><?php echo number_format((($pregunta == 1 ?$subtotal/$dolar:$subtotal)), 2, '.', ','); ?></b></td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height:20px;">&nbsp;</td>
        <td style="width: 40px; height:20px;">&nbsp;</td>
        <td style="width: 400px; height:20px;">&nbsp;</td>
        <td style="width: 68px; height:20px;"><b>Total: <?php echo $pregunta == 1 ?"$":"C$"; ?></b></td>
        <td style="width: 68px; height:20px;font-size: 15px!important;"><b><?php echo number_format((($pregunta == 1 ?$total/$dolar:$total)), 2, '.', ','); ?></b></td>
    </tr>
    </tbody>
</table>
<p style="font-size: 16px">*Nota= Los precios de producto cotizados tiene una validez de 30 dìa.</p>
<?php
if ($pregunta==1)
{

}else{?>
    <p style="font-size: 16px">Taza de cambio de dolar= C$ <?php echo $dolar ?></p>
<?php }
?>

<div class="container">
    <img src="../assets/img/sello.jpg" width="20%" alt="" style="margin-left: 30em;margin-top: 3em;">
</div>

