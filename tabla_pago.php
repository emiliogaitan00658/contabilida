<?php include "header/header.php";
if ($_SESSION) {

} else {
    echo '<script>location.href="login.php";</script>';
}
if ($_GET) {
    $indcredito = $_GET['indcredito'];
    $indtemp = $_GET['indtemp'];
} else {
    echo '<script> location.href="buscar_clientes.php" </script>';
}

$total_faltante = datos_clientes::total_deuda_faltante22($indcredito, $mysqli);

if ($_POST) {
    $recibo = $_POST['textrecibo'];
    $detalle = $_POST['textdetalles'];
    echo $total = $_POST['texttotal'];
    $fecha = $_POST['textfecha'];
    $indsucursal = $_SESSION['sucursal'];
    if ($total_faltante != 0) {
        if ($total <= $total_faltante) {
            datos_clientes::ingresar_credito_pago($indcredito, $indtemp, $indsucursal, $recibo, $detalle, $total, $fecha, $mysqli);
            echo '<script>location.href="tabla_pago.php?indcredito=' . $indcredito . '&indtemp=' . $indtemp . '";</script>';
        } else {
            echo '<script>
 swal({
   title: "Que haces?",
   text: "Revisa bien, cuanto ingresas en monto",
   icon: "error",
   buttons: true,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="#";
   }else {
     location.href="#";
   }
 });
 </script>';
        }
    } else {
        echo '<script>
 swal({
   title: "Que haces?",
   text: "La deuda ya esta cancelada",
   icon: "error",
   buttons: true,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="tabla_pago.php?indcredito=' . $indcredito . '&indtemp=' . $indtemp . '";
   }else {
     location.href="tabla_pago.php?indcredito=' . $indcredito . '&indtemp=' . $indtemp . '";
   }
 });
 </script>';
    }
}


//echo '<script>
// swal({
//   title: "Exito ?",
//   text: "Guardado Con Exito",
//   icon: "success",
//   buttons: true,
//
// })
// .then((willDelete) => {
//   if (willDelete) {
//     location.href="tabla_pago.php?indcredito='. $indcredito.'";
//   }else {
//     location.href="tabla_pago.php?indcredito='. $indcredito.'";
//   }
// });
// </script>';
?>
    <div class="container white z-depth-1 rounded" style="border-radius: 6px;">
        <div class="modal-header white rounded">
            <h4 class="modal-title blue-grey-text unoem">Deuda Pendiente: <span
                        class="red-text">$ <?php echo $total_faltante; ?></span></h4>
        </div>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>?indcredito=<?php echo $indcredito; ?>&indtemp=<?php echo $indtemp; ?>"
              method="post">
            <br>
            <section class="row">
                <div class="control-pares col-md-2">
                    <label for="" class="control-label">Numero de Recibo: *</label>
                    <input type="number" name="textrecibo" class="form-control" placeholder="Numero Factura" required>
                </div>
                <br>
                <div class="control-pares col-md-7">
                    <label for="" class="control-label">Por Concepto de: *</label>
                    <input type="text" name="textdetalles" class="form-control" placeholder="Numero Factura" required
                           value="">
                </div>
                <div class="control-pares col-md-2">
                    <label for="" class="control-label">Cantidad dolares: $ *</label>
                    <input type="text" name="texttotal" class="form-control" placeholder="Detalles de concepto"
                           required>
                </div>
                <div class="control-pares col-md-2">
                    <label for="" class="control-label">Fecha: *</label>
                    <input type="date" name="textfecha" value="<?php echo datos_clientes::fecha_get_pc_MYSQL(); ?>"
                           class="form-control" placeholder="Numero Factura" required>
                </div>
            </section>
            <div class="modal-footer">
                <input type="submit" value="Registrar pago" class="btn white-text blue-grey btn-primary"/>
            </div>
        </form>
    </div>
    <br>
    <div class="container z-depth-1 rounded white" style="border-radius: 6px;">
        <div class="modal-header white rounded">
            <h4 class="modal-title blue-grey-text unoem">Lista de Creditos</h4>
        </div>
        <table class="table table-bordered center-align" style="padding: 1em;">
            <thead>
            <tr style="border-bottom: 1px solid black">
                <th scope="col"># ID</th>
                <th scope="col">USD Pago</th>
                <th scope="col">No Recibo</th>
                <th scope="col">Fecha Pago</th>
                <th scope="col">Pagar</th>
                <th scope="col">Eliminar</th>
                <th scope="col" class="center-align">Imprimir</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $contador = 1;
            if ($_GET) {
                $result4 = $mysqli->query("SELECT * FROM `creditos_pago` WHERE indcredito='$indcredito' ORDER BY indcredito DESC");
                while ($resultado = $result4->fetch_assoc()) {
                    $indpago=$resultado['indpago'];
                    ?>
                    <tr>
                        <th scope="row"><?php echo $contador; ?></th>
                        <td><b>USD <?php echo $resultado['pago']; ?></b></td>
                        <td><b><?php echo $resultado['indrecibo']; ?></b></td>
                        <td><?php
                            $fecha_cambio = $resultado['fechapago'];
                            $timestamp = strtotime($fecha_cambio);
                            echo date("d/m/Y", $timestamp);
                            ?></td>
                        <td class="center-align"><?php
                            if ($resultado['status'] == "false") {
                                ?>
                                <p class="red white-text rounded" style="border-radius: 6px;">Cuenta Por Cobrar</p>
                                <?php
                            } else {
                                ?>
                                <p class="bg-success white-text rounded"
                                   style="background-color:#1cc88a!important;border-radius: 6px;">Cancelado</p>
                                <?php
                            }
                            ?>
                        <td class="center-align"><a href="#"
                                                    class="btn btn-danger" onclick="
                                    var i='<?php echo $resultado['indtemp']; ?>';
                                    verficar_eliminar(i);"><i class="btn-danger icon-bin"></i></a></td>
                        </td>
                        <td class="center-align"><a
                                    href="PDF/htmlpdf_credito.php?key=<?php echo $resultado['indtemp']; ?>&indpago=<?php echo $indpago; ?>"
                                    class="btn btn-success" target="_blank"><i class="icon-printer"></i></a>
                        </td>
                    </tr>
                    <?php

                    $contador = $contador + 1;
                }

            } ?>

            </tbody>
        </table>
    </div>

    <script>

        function verficar_eliminar(codigo) {
            swal({
                title: "Eliminar?",
                text: "Seguro de Eliminar Factura",
                icon: "success",
                buttons: true,

            })
                .then((willDelete) => {
                    if (willDelete) {
                        location.href = "temporal/eliminar_factura?key=" + codigo;
                    } else {
                        location.href = "factura_dia.php";
                    }
                });
        }


    </script>


<?php include "header/footer.php" ?>