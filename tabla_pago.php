<?php include "header/header.php";
if($_SESSION){

}else{
    echo '<script>location.href="login.php";</script>';
}
if ($_GET) {
    $indcredito = $_GET['indcredito'];
} else {
    echo '<script> location.href="buscar_clientes.php" </script>';
}

if ($_POST) {
    $factura = $_POST['textfactura'];
    $fecha = $_POST['textfecha'];
    if ($factura == "" || $fecha == "") {

    }else{
        $resues=datos_clientes::pago_actualizar($indcredito, $factura, $fecha, $mysqli);
        if($resues==true){
            echo '<script>
 swal({
   title: "Exito ?",
   text: "Guardado Con Exito",
   icon: "success",
   buttons: true,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="tabla_pago.php?indcredito='. $indcredito.'";
   }else {
     location.href="tabla_pago.php?indcredito='. $indcredito.'";
   }
 });
 </script>';
        }
    }
}

?>
<div class="container white z-depth-1 rounded" style="border-radius: 6px;">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Pagar Credito</h4>
    </div>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>?indcredito=<?php echo $indcredito; ?>"
          method="post">
        <br>
        <section class="row">
            <div class="control-pares col-md-4">
                <label for="" class="control-label">Numero de Recibo: *</label>
                <input type="text" name="textfactura" class="form-control" placeholder="Numero Factura" required>
            </div>
            <div class="control-pares col-md-5">
                <label>Fecha Pagar: *</label>
                <select name="textfecha" class="form-control" required>
                    <option class="form-control" value="" selected>Opcion Fecha</option>
                    <?php
                    if ($_GET) {
                        $result4 = $mysqli->query("SELECT * FROM `creditos_pago` WHERE indcredito='$indcredito' AND status='false' ORDER BY indcredito ");
                        while ($resultado = $result4->fetch_assoc()) {
                            ?>
                            <option class="form-control"
                                    value="<?php echo $resultado['fechapago']; ?>"><?php
                                $fecha_cambio = $resultado['fechapago'];
                                $timestamp = strtotime($fecha_cambio);
                                echo date("d/m/Y", $timestamp);
                                ?></option>
                            <?php
                        }
                    }
                    ?>

                </select>
            </div>
        </section>
        <br>
        <div class="modal-footer">
            <input type="submit" value="Pagar" class="btn white-text blue-grey btn-primary"/>
        </div>
    </form>
</div>
<br>
<div class="container z-depth-1 rounded white" style="border-radius: 6px;">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Lista de Creditos</h4>
    </div>
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col"># ID</th>
            <th scope="col">USD Pago</th>
            <th scope="col">No Recibo</th>
            <th scope="col">Fecha Pago</th>
            <th scope="col">Pagar</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $contador=1;
        if ($_GET) {
            $result4 = $mysqli->query("SELECT * FROM `creditos_pago` WHERE indcredito='$indcredito' ORDER BY indcredito DESC");
            while ($resultado = $result4->fetch_assoc()) {
                ?>
                <tr>
                    <th scope="row"><?php echo $contador; ?></th>
                    <td><b>USD <?php echo $resultado['pago']; ?></b></td>
                    <td><b><?php echo $resultado['indfactura']; ?></b></td>
                    <td><?php
                        $fecha_cambio = $resultado['fechapago'];
                        $timestamp = strtotime($fecha_cambio);
                        echo date("d/m/Y", $timestamp);
                        ?></td>
                    <td class="center-align"><?php
                        if ($resultado['status'] == "false") {
                            ?>
                            <p class="red white-text rounded"  style="border-radius: 6px;">Cuenta Por Cobrar</p>
                            <?php
                        } else {
                            ?>
                            <p class="bg-success white-text rounded" style="background-color:#1cc88a!important;border-radius: 6px;">Cancelado</p>
                            <?php
                        }
                        ?>
                    </td>
                </tr>
            <?php

            $contador=$contador+1;
            }

        } ?>
        </tbody>
    </table>
</div>

<?php include "header/footer.php" ?>