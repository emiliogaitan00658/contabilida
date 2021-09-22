<?php
include_once "../header/header_panel_informe.php";;
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
$fecha1 =0;
$fecha2 = 0;
$sucursal = 0;
if ($_POST) {
    $fecha1 = $_POST["textfecha1"];
    $fecha2 = $_POST["textfecha2"];
    $sucursal = $_POST["textsucursal"];
    $result4 = $mysqli->query("SELECT COUNT(unidad) as total_unidad,unidad,nombre_producto,precio_total,bandera,anular,indtemp,codigo_producto,indtalonario,total_descuento,descuento FROM `factura` WHERE `bandera` = 0 and indsucursal='$sucursal' and indtalonario IS NOT NULL ");
}
?>
<div class="container">
    <hr>
    <h2 class="center">INFORME DE MATERILES DE SUCURSAL DE <?php echo strtoupper(datos_clientes::nombre_sucursal($sucursal)); ?></h2>
    <h5 class="center-align">Fecha de facturaciòn <?php echo $fecha1 ?> al <?php echo $fecha2 ?></h5>
    <hr>
</div>
<div class="z-depth-1 center-block rounded white" style="width: 95%!important;">
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col">#Codigo</th>
            <th scope="col">#COD_producto</th>
            <th scope="col">Unidad</th>
            <th scope="col">Producto</th>
            <th scope="col">Fecha</th>
            <th scope="col">Precio/Total</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $Subtotal = 0;
        $Total = 0;
        while ($resultado = $result4->fetch_assoc()) {
            $fechad = datos_clientes::get_fecha_faltante($resultado['indtemp'], $sucursal, $mysqli);
            //datos_clientes::verificar_anulacion($resultado['indtemp'],$mysqli);
            if ($_POST) {
                $FE = date('Y-m-d', strtotime($fechad['fecha']));
                $contractDateBegin = date('Y-m-d', strtotime($fecha1));
                $contractDateEnd = date('Y-m-d', strtotime($fecha2));

                if (($FE >= $contractDateBegin) && ($FE <= $contractDateEnd)) {


                    ///cierre informenes
                    $Subtotal = $resultado['precio_total'] + $Subtotal;
                    if ($resultado['descuento'] == "0") {
                        $Total = $resultado['precio_total'] + $Total;
                    } else {

                        $Total = $resultado['total_descuento'] + $Total;
                    }

                    ?>
                    <tr>
                        <th scope="row"><?php echo $resultado['indtalonario']; ?></th>
                        <td><?php echo $resultado['codigo_producto']; ?></td>
                        <td><?php echo $resultado['total_unidad']; ?></td>
                        <td><?php echo $resultado['nombre_producto']; ?></td>
                        <td><?php echo $fechad['fecha3']; ?></td>
                        <td>C$ <?php
                            if ($resultado['descuento'] == "0") {
                                echo number_format($resultado['precio_total'], 2, '.', ',');
                            } else {
                                echo number_format($resultado['total_descuento'], 2, '.', ',');
                            }
                            ?></td>
                    </tr>
                <?php }
            }
        } ?>
        </tbody>
    </table>
</div>

