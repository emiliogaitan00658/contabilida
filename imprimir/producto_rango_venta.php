<?php
include_once "../header/header_panel_informe.php";;
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
$fecha1 = 0;
$fecha2 = 0;
$sucursal = 0;
if ($_POST) {
    $fecha1 = $_POST["textfecha1"];
    $fecha2 = $_POST["textfecha2"];
    $sucursal = $_POST["textsucursal"];
    $sucursal_nombre = datos_clientes::nombre_sucursal_ind($sucursal, $mysqli);

    $primera = datos_clientes::primera_factura_no($sucursal, $fecha1, $fecha2, $mysqli);
    $segunda = datos_clientes::ultima_factura_no($sucursal, $fecha1, $fecha2, $mysqli);

    $result4 = $mysqli->query("SELECT nombre_producto,codigo_producto, SUM(unidad) as conteo,indtalonario FROM `factura` 
WHERE (indtalonario >= '$primera' AND indtalonario <= '$segunda') and indsucursal='$sucursal' GROUP BY codigo_producto");
}
?>
<div class="container">
    <hr>
    <h2 class="center">INFORME DE MATERILES DE SUCURSAL
        DE <?php echo strtoupper(datos_clientes::nombre_sucursal_ind($sucursal)); ?></h2>
    <h5 class="center-align">Fecha de facturaciòn <?php echo $fecha1 ?> al <?php echo $fecha2 ?></h5>
    <hr>
</div>
<div class="z-depth-1 white row">
    <table class="table table-bordered table-responsive" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col">#</th>
            <th scope="col">Unidad</th>
            <th scope="col">Codigo Producto</th>
            <th scope="col">Producto</th>
            <th scope="col">Numero Factura</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $conteo = 0;
        while ($resultado = $result4->fetch_assoc()) {
            $conteo = $conteo + 1;
            ?>
            <tr>
                <th scope="row"><?php echo $conteo; ?></th>
                <td class="greend"><?php echo $resultado['conteo']; ?></td>
                <td><?php echo $resultado['codigo_producto']; ?></td>
                <td><?php echo $resultado['nombre_producto']; ?></td>
                <td><?php echo $resultado['indtalonario']; ?></td>
            </tr>
            <?php
        } ?>
        </tbody>
    </table>
</div>
<script language="javascript" type="text/javascript">
    window.onload = function () {
        var td = document.getElementsByTagName('td');
        for (var i = 0; i < td.length; i++) {
            td[i].onclick = function () {
                this.className = this.className == "yellow" ? "white" : "yellow";
            }
        }

    };
</SCRIPT>
<style type="text/css">
    .white {
        background: #2a96a5;
    }

    .greend {
        background: white;
    }
</style>
