<!--<div class="container white z-depth-1 rounded">-->
<!--    <div class="modal-header white rounded">-->
<!--        <h4 class="modal-title blue-grey-text unoem">Registro Nuevos Credito</h4>-->
<!--    </div>-->
<!--    <form action="--><?php //echo htmlspecialchars($_SERVER["PHP_SELF"]); ?><!--?indcliente=--><?php //echo $nombre; ?><!--"-->
<!--          method="post">-->
<!--        <br>-->
<!--        <section class="row">-->
<!--            <div class="control-pares col-md-7">-->
<!--                <label for="" class="control-label">Producto o numero de factura: *</label>-->
<!--                <input type="text" name="textproducto" class="form-control" placeholder="Detalle Producto o numero de factura" required>-->
<!--            </div>-->
<!--            <div class="control-pares col-md-4">-->
<!--                <label for="" class="control-label">Monto a Pagar: *</label>-->
<!--                <input type="text" name="textpagar" class="form-control" placeholder="USD" required>-->
<!--            </div>-->
<!--        </section>-->
<!--        <br>-->
<!--        <section class="row">-->
<!--            <div class="control-pares col-md-3">-->
<!--                <label for="" class="control-label">Cuantas Cuotas: *</label>-->
<!--                <input type="text" name="textcuotas" class="form-control" placeholder="Cuotas"-->
<!--                       value="" required>-->
<!--            </div>-->
<!--            <div class="control-pares col-md-3">-->
<!--                <label for="" class="control-label">Prima USD: *</label>-->
<!--                <input type="text" name="textprima" class="form-control" placeholder="Cuotas"-->
<!--                       value="0" required>-->
<!--            </div>-->
<!--            <div class="control-pares col-md-3">-->
<!--                <label for="" class="control-label">Fecha Inicio: *</label>-->
<!--                <input type="date" name="textfechainicio" class="form-control"-->
<!--                       value="--><?php //echo date('Y-m-d', strtotime(datos_clientes::fecha_get_pc_MYSQL())) ?><!--">-->
<!--            </div>-->
<!--        </section>-->
<!--        <br>-->
<!--        <div class="modal-footer">-->
<!--            <input type="submit" value="Nuevo Credito" class="btn blue-grey white-text btn-primary"/>-->
<!--        </div>-->
<!--    </form>-->
<!--</div>-->
<!--<br>-->
<?php include "header/header.php";
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
if ($_GET) {
    $nombre = $_GET['indcliente'];
} else {
    echo '<script> location.href="factura_dia.php" </script>';
}

//if ($_POST) {
//    $producto = strtoupper(filter_var($_POST['textproducto'], FILTER_SANITIZE_STRING));
//    $inicio = $_POST['textfechainicio'];
//    $monto = $_POST['textpagar'];
//    $cuotas = $_POST['textcuotas'];
//    $prima = $_POST['textprima'];
//    $recues =datos_clientes::nuevo_credito($nombre, $producto, $inicio, $monto, $cuotas, $prima, $mysqli);
//    if ($recues == true) {
//        echo '<script>
// swal({
//   title: "Exito ?",
//   text: "Credito Guardado",
//   icon: "success",
//   buttons: true,
//
// })
// .then((willDelete) => {
//   if (willDelete) {
//     location.href="creditos.php?indcliente='.$nombre.'";
//   }else {
//     location.href="creditos.php?indcliente='.$nombre.'";
//   }
// });
// </script>';
//    }
//}
?>
<div class="container z-depth-1 rounded white">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Lista de Creditos</h4>
    </div>
    <table class="table table-bordered" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black" class="center-align">
            <th scope="col"># ID</th>
            <th scope="col">Numero Factura</th>
            <th scope="col">Credito</th>
            <th scope="col" class="red-text">Faltante Pago $</th>
            <th scope="col">Fecha Credito</th>
            <th scope="col">Eliminar</th>
            <th scope="col">Pagar</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $contador = 1;
        if ($_GET) {
            $result4 = $mysqli->query("SELECT * FROM `credito` WHERE indcliente='$nombre' ORDER BY indcredito DESC");
            while ($resultado = $result4->fetch_assoc()) {
                $total_faltante = datos_clientes::total_deuda_faltante($resultado['indtemp'], $mysqli);
                $total_faltante_resta = $resultado['totalCredito'] - $total_faltante;
                if ($total_faltante_resta == "0") {
                    datos_clientes::bandera_credito_cancelado($resultado['indtemp'], $mysqli);
                }
                ?>
                <tr class="center-align">
                    <th scope="row"><?php echo $contador; ?></th>
                    <td><a href="PDF/cotizar_factura_link_credito.php?dolar=1&key=<?php echo $resultado['indtemp']; ?>"
                           target="_blank"><b>No #<?php echo $resultado['producto']; ?></b></a></td>
                    <td class="center-align"><b>$ <?php echo $resultado['totalCredito']; ?></b></td>
                    <td class="center-align red-text"><b>$ <?php echo $total_faltante_resta ?></b></td>
                    <td><?php
                        $fecha_cambio = $resultado['fechaInicio'];
                        $timestamp = strtotime($fecha_cambio);
                        echo date("d/m/Y", $timestamp); ?></td>
                    <?php if ($total_faltante_resta == "0") { ?>
                        <td><a href="#" class="btn btn-danger"><i class="btn-danger icon-bin"></i></a></td>
                    <?php } else { ?>
                        <td>
                            <a href="temporal/eliminar_credito.php?indtemp=<?php echo $resultado['indtemp']; ?>&indcliente=<?php echo $nombre; ?>"
                               class="btn btn-danger"><i class="btn-danger icon-bin"></i></a></td>
                    <?php }
                    if ($resultado['producto']==null) { ?>

                        <td><a href="#" class="btn btn-primary green white-text">Pagar Creditos</a></td>
                    <?php }else {  ?>
  <td>
                            <a href="tabla_pago.php?indcredito=<?php echo $resultado['indcredito']; ?>&indtemp=<?php echo $resultado['indtemp']; ?>"
                               class="btn btn-primary green white-text">Pagar Creditos</a></td>

                    <?php } ?>
                </tr>
                <?php
                $contador = $contador + 1;
            }
        } ?>
        <!--        <tr>-->
        <!--            <th scope="row"></th>-->
        <!--            <th scope="row">Total Deuda= $ </th>-->
        <!--            <th scope="row">--><?php //echo $contador; ?><!--</th>-->
        <!--            <th scope="row">--><?php //echo $contador; ?><!--</th>-->
        <!--            <th scope="row">--><?php //echo $contador; ?><!--</th>-->
        <!--            <th scope="row">--><?php //echo $contador; ?><!--</th>-->
        <!--        </tr>-->
        </tbody>
    </table>
</div>

<?php include "header/footer.php" ?>
