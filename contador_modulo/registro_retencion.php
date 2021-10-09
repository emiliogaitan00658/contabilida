<?php
include "../header/header_panel.php";
$key = 0;
$sucursal = $_SESSION['sucursal'];
if (!empty($_GET["key"])) {
    $key = $_GET['key'];
    $_SESSION['keycookies'] = $key;
} else {
    $key = $_SESSION['keycookies'];
}
$datos = datos_clientes::datos_generales_talonario($key, $mysqli);
$indtalonario = $datos['indtalonario'];
if ($indtalonario == "") {
    echo '<script>
   swal({
     title: "error",
     text: "No Completa con los campos requerido",
     icon: "error",
     buttons: true,

   })
   .then((willDelete) => {
     if (willDelete) {
        location.href="../factura_dia.php";
     }else {
        location.href="../factura_dia.php";
     }
   });
   </script>';
}


$factura = datos_clientes::datos_generales_talonario($key, $mysqli);
$dato_cliente = datos_clientes::datos_clientes_generales($datos["indcliente"], $mysqli);


if ($_POST) {

    $numero_recibo = $_POST["textrecibo"];
    $subtotal = $_POST["textsubtotal"];
    $porsentaje = $_POST["textporcentaje"];
    $indtotalfactura = $factura["indtotalfactura"];

    $exite_numero_retnecion = datos_clientes::numero_retencion_exite($numero_recibo, $mysqli);
    if ($exite_numero_retnecion == "") {

    } else {
        $repetido = datos_clientes::recibo_repetido($numero_recibo, $mysqli);
        datos_clientes::ingresar_retencion($key, $numero_recibo, $subtotal, $indtotalfactura, $sucursal, $porsentaje, $indtalonario, $mysqli);
        echo '<script>
   swal({
     title: "Exito",
     text: "Retencion Guardada",
     icon: "success",
     buttons: true,

   })
   .then((willDelete) => {
     if (willDelete) {
        location.href="../factura_dia.php";
     }else {
        location.href="../factura_dia.php";
     }
   });
   </script>';

    }

}
$total_factura=$factura["subtotal"];
if ($total_factura>=1000){

}else{
    echo '<script>
   swal({
     title: "Error",
     text: "Retenciòn mayor C$ 1,000",
     icon: "error",
     buttons: true,

   })
   .then((willDelete) => {
     if (willDelete) {
        location.href="../factura_dia.php";
     }else {
        location.href="../factura_dia.php";
     }
   });
   </script>';

}


?>
<br>
<div class="container z-depth-2 rounded white" style="border-radius: 6px">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Registro de retencion de la empresa</h4>
    </div>
    <p class="red-text">* el sistema registrar todos los datos de la retencion y los calculo son automatico.</p>
    <p>No deben de registar las retenciones por error (Se reponsabilizar a las personas encargada.)</p>
    <br>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <section class="row">
            <div class="control-pares col-md-5">
                <label for="" class="control-label">RUC: *</label>
                <input type="text" name="textnombre" class="form-control" value="<?php echo $dato_cliente["nombre"]; ?>"
                       placeholder="Nombres" required readonly=readonly>
            </div>
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Nombre de Empresa: *</label>
                <input type="text" name="textapellido" class="form-control"
                       value="<?php echo $dato_cliente["apellido"]; ?>" placeholder="Apellidos" required
                       readonly=readonly>
            </div>
        </section>
        <br>
        <section class="row">
            <div class="control-pares col-md-3">
                <label for="" class="control-label">No. Recibo *</label>
                <input type="number" name="textrecibo" class="form-control" placeholder="Recibo" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Sub-Total: *</label>
                <input type="text" name="textsubtotal" class="form-control" placeholder="Subtotal"
                       value="<?php echo $factura["subtotal"]; ?>">
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">2%</label>
                <input type="text" name="textporcentaje" class="form-control" placeholder="2%"
                       value="<?php echo datos_clientes::dos_decimales(($factura["subtotal"] * 0.02)); ?>">
            </div>
        </section>
        <br>
        <div class="modal-footer">
            <input type="submit" value="Regitrar" class="btn white-text blue-grey btn-primary"/>
        </div>
    </form>
</div>

<?php include "../header/footer_temporal.php" ?>
