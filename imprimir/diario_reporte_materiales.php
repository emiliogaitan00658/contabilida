<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
include "../header/header_imprimir.php";
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
?>
<style>
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
    <p>Fecha reporte : <b><?php echo datos_clientes::fecha_get_pc(); ?></b></p>
</div>
<div class=" white rounded" style="margin: 0em;">
    <br>
    <div class="  rounded white" style="width: 100%!important;">
        <table class="table table-bordered" style="padding: 1em;" >
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
                <th class="center-align" scope="col">Subtotal C$</th>
                <th class="center-align" scope="col">Total C$</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $fecha = datos_clientes::fecha_get_pc_MYSQL();
            $result4 = $mysqli->query("SELECT * FROM `total_factura` WHERE total_factura.fecha='$fecha'and total_factura.indsucursal='$idsucursal' and indtalonario IS NOT NULL");

            while ($resultado = $result4->fetch_assoc()) {
                $indcliente = $resultado['indcliente'];
                $nombre_apelido = datos_clientes::nombre_apellido_cliente($indcliente, $mysqli);
                echo $resultado['bandera'];
                if ($resultado['bandera'] == "1"){
                ?>
                <tr>
                    <td class="center-align"><?php echo $resultado["indtalonario"]; ?></td>
                    <td class="center-align"><?php echo $nombre_apelido; ?></td>
                    <td class="center-align"><?php if ($resultado["efectivo"] == "1") {echo "<b>X</b>";} else {echo "";} ?></td>
                    <td class="center-align"><?php if ($resultado["dolar"] == "1") {echo "<b>X</b>";} else {echo "";} ?></td>
                    <td class="center-align"><?php if ($resultado["cordoba"] == "1") {echo "<b>X</b>";} else {echo "";} ?></td>
                    <td class="center-align"><?php if ($resultado["targeta"] == "1") {echo "<b>X</b>";} else {echo "";} ?></td>
                    <td class="center-align"><?php if ($resultado["trasferencia"] == "1") {echo "<b>X</b>";} else {echo "";} ?></td>
                    <td class="center-align"><?php if ($resultado["bac"] == "1") {echo "<b>X</b>";} else {echo "";} ?></td>
                    <td class="center-align"><?php if ($resultado["lafise"] == "1") {echo "<b>X</b>";} else {echo "";} ?></td>
                    <td class="center-align"><?php if ($resultado["credito"] == "1") {echo "<b>X</b>";} else {echo "";} ?></td>
                    <td class="center-align"><?php echo number_format($resultado["subtotal"], 2, '.', ','); ?></td>
                    <td class="center-align"><?php echo number_format($resultado["subtotal"], 2, '.', ','); ?></td>
                </tr>
                <?php
            } else {?>
                    <tr>
                    <td class="center-align"><del> <?php echo $resultado["indtalonario"]; ?></del></td>
                <td class="center-align"><del><?php echo $nombre_apelido; ?></del></td>
                <td class="center-align"><del><?php if ($resultado["efectivo"] == "1") {echo "<b>X</b>";} else {echo "";} ?></del></td>
                <td class="center-align"><del><?php if ($resultado["dolar"] == "1") {echo "<b>X</b>";} else {echo "";} ?></del></td>
                <td class="center-align"><del><?php if ($resultado["cordoba"] == "1") {echo "<b>X</b>";} else {echo "";} ?></del></td>
                <td class="center-align"><del><?php if ($resultado["targeta"] == "1") {echo "<b>X</b>";} else {echo "";} ?>v</td>
                <td class="center-align"><del><?php if ($resultado["trasferencia"] == "1") {echo "<b>X</b>";} else {echo "";} ?></del></td>
                <td class="center-align"><del><?php if ($resultado["bac"] == "1") {echo "<b>X</b>";} else {echo "";} ?></del></td>
                <td class="center-align"><del><?php if ($resultado["lafise"] == "1") {echo "<b>X</b>";} else {echo "";} ?></del></td>
                <td class="center-align"><del><?php if ($resultado["credito"] == "1") {echo "<b>X</b>";} else {echo "";} ?></del></td>
                <td class="center-align"><del><?php echo number_format($resultado["subtotal"], 2, '.', ','); ?></del></td>
                <td class="center-align"><del><?php echo number_format($resultado["subtotal"], 2, '.', ','); ?>v</td>
                </tr>
                    <?php
                }
            } ?>
            </tbody>
        </table>
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

