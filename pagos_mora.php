<?php include "header/header.php";
if ($_SESSION) {

} else {
    echo '<script>location.href="login.php";</script>';
}
$valores = 0;
if ($_GET) {
    $valores = $_GET['sucursal'];
    if ($valores == 'TODO') {
        $valores = 0;
    }
} else {
    $valores = 0;
}
?>
<div class="container z-depth-1 rounded">
    <br>
    <div class="modal-header white rounded">
        <h6 class="modal-title blue-grey-text unoem">SUCURSALES</h6>
    </div>
    <div class="row" style="padding-top: 0.5em">
        <ul class="list-group list-group-horizontal">
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=TODO'">Todo</li>
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=MANAGUA'">Managua</li>
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=MASAYA'">Masaya</li>
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=LEON'">Leon</li>
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=CHONTALES'">Chontales</li>
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=ESTELI'">Esteli</li>
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=MATAGALPA'">Matagalpa</li>
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=CHINANDEGA'">Chinandega</li>
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=VILLA FONTANA'">
                Managua Villa Fontana
            </li>
            <li class="list-group-item" onclick="location.href='pagos_mora.php?sucursal=MANAGUA BOLONIA'">Managua
                Bolonia
            </li>
        </ul>
    </div>
    <br>
</div>
<br>
<div class="container z-depth-1 rounded white">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Lista de Creditos  (<?php echo datos_clientes::fecha_get_pc(); ?>)</h4>
    </div>
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col"># ID</th>
            <th scope="col">USD Pago</th>
            <th scope="col">Fecha Pago</th>
            <th scope="col">Nombre y Apellido</th>
            <th scope="col">Telefono</th>
            <th scope="col">Sucursal</th>
            <th scope="col">Detalles</th>
            <th scope="col">Pago</th>
        </tr>
        </thead>
        <tbody>
        <?php
        if ($_GET) {
            $fecha= datos_clientes::fecha_get_pc_MYSQL();
            $result4 = $mysqli->query("SELECT * FROM `creditos_pago` WHERE MONTH('$fecha') = MONTH(CURDATE()) AND YEAR('$fecha') = YEAR(CURDATE()) AND status='false' OR fechapago<=CURDATE()");
            while ($resultado = $result4->fetch_assoc()) {
                $indcredito = $resultado['indcredito'];
                $indcliente = datos_clientes::datos_clientes_moras($indcredito, $mysqli);
                $rows = datos_clientes::datos_clientes_generales_dadd($indcliente, $mysqli);
//                if ($resultado['status'] == "false" && $_SESSION['sucursal']==$valores) {
                    ?>
                    <tr>
                        <th scope="row"><?php echo $resultado['indpago']; ?></th>
                        <td><b>USD <?php echo $resultado['pago']; ?></b></td>
                        <td><?php
                            $fecha_cambio = $resultado['fechapago'];
                            $timestamp = strtotime($fecha_cambio);
                            echo date("d/m/Y", $timestamp);
                            ?></td>
                        <td><b><?php echo $rows['nombre'] . " " . $rows['apellido']; ?></b></td>
                        <td><b><?php echo $rows['telefono']; ?></b></td>
                        <td><b><?php echo datos_clientes::nombre_sucursal($resultado['indsucursal']); ?></b></td>
                        <td class="center-align"><?php
                            if ($resultado['status'] == "false") {
                                ?>
                                <p class="red white-text" style="border-radius: 6px;">Cuenta por Cobrar</p>
                                <?php
                            } ?>

                        </td>
                        <td><a href="tabla_pago.php?indcredito=1" class="btn btn-success">Pagar</a></td>
                    </tr>
                    <?php
                }
//            }
        } ?>
        </tbody>
    </table>
</div>

<?php include "header/footer.php" ?>
