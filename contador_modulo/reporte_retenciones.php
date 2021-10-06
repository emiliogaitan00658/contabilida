<?php
include_once "../header/header_panel_informe.php";
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
$fecha1 = $_POST["textfecha1"];
$fecha2 = $_POST["textfecha2"];
$ind = $_POST["textsucursal"];
?>
<div class="container">
    <hr>
    <h2 class="center text-uppercase">ORTHO DENTAL RUC:J031-193-134</h2>
    <h5 class="center-align">rETENCIONES EFECTUADAS POR NUESTRO CLEINTES EN SUCURSAL <?php echo datos_clientes::traforma_fecha($fecha1) ?>
        al <?php echo datos_clientes::traforma_fecha($fecha2) ?></h5>
    <hr>
</div>
<div class="row">
    <div class="z-depth-1 rounded white center-block" style="width: 95%">
        <table class="table table-bordered">
            <thead>
            <tr style="border-bottom: 1px solid black;">
                <th scope="col">RUC No</th>
                <th scope="col" class="center-align">PROOVEDOR</th>
                <th scope="col">Fecha</th>
                <th scope="col">No RECIBO</th>
                <th scope="col">SUB-TOTAL</th>
                <th scope="col">2%</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $total_factura = 0;
            $total_contado = 0;
            $total_credito = 0;
            $suma_totalventas=0;

            $result4 = $mysqli->query("SELECT * FROM `retencion` WHERE fecha BETWEEN '$fecha1' and '$fecha2' and indsucursal='$ind'");
            while ($resultado = $result4->fetch_assoc()) {

                $datos_cliente=datos_clientes::datos_clientes_generales($resultado["indcliente"],$mysqli);

                $n1 = 0;
                $n2 = 0;
                $sum = 0;
                $sum1 = 0;
                $d = 0;
                ?>
                <tr>
                    <td class="center-align"><?php echo $datos_cliente["nombre"]; ?></td>
                    <td class="center-align"><?php echo $datos_cliente["apellido"]; ?></td>
                    <td class="center-align"><?php echo datos_clientes::traforma_fecha($resultado["fecha"]); ?></td>
                    <td class="center-align"><?php echo $resultado["norecibo"]; ?></td>
                    <td class="center-align"><?php echo $resultado["subtotal"]; ?></td>
                  <td class="center-align"><?php $suma1=datos_clientes::total_suma_contador($resultado["indsucursal"], $fecha1, $fecha2, $mysqli);echo datos_clientes::dos_decimales($suma1); ?></td>
                </tr>
                <?php
                $total_contado = $total_contado + $n1;
                $total_credito = $total_credito + $n2;
                $suma_totalventas=$suma_totalventas+$suma1;
            } ?>
            <tr style="height: 5px;margin-top: 0!important;">
                <td class="center-align"><b>TOTAL RETENCIONES:</b></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="center-align"></td>
                <td class="center-align"><?php echo "C$ ".datos_clientes::dos_decimales($suma_totalventas); ?></td>
            </tr>
            </tbody>
        </table>
    </div>
