<?php include "header/header.php";
if (!$_SESSION){
    echo '<script> location.href="login" </script>';
}
if ($_GET) {
    $nombre = $_GET['indcliente'];
    $key = $_GET['key'];
    $total = $_GET['total'];
    $total_final=number_format(($total/$dolar), 2, '.', ''); ;
} else {
    echo '<script> location.href="buscar_clientes.php" </script>';
}
if ($_POST) {
    $producto = strtoupper(filter_var($_POST['textproducto'], FILTER_SANITIZE_STRING));
    $inicio = $_POST['textfechainicio'];
    $monto = $_POST['textpagar'];
    $cuotas = "0";
    $prima = "0";
    $recues =datos_clientes::nuevo_credito($nombre,$indsucursal,$key, $inicio, $monto, $cuotas, $prima, $mysqli);
    if ($recues == true) {
        echo '<script>
 swal({
   title: "Exito ?",
   text: "Credito Guardado",
   icon: "success",
   buttons: true,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="factura_dia.php";
   }else {
     location.href="factura_dia.php";
   }
 });
 </script>';
    }
}
?>
    <div class="container white z-depth-1 rounded">
        <div class="modal-header white rounded">
            <h4 class="modal-title blue-grey-text unoem">Registro Nuevos Credito</h4>
        </div>
        <p class="red-text">* Recordar que el monto minimo es de 15 dolares para credito (Si preguntar asu superiores acerca de credito)</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>?indcliente=<?php echo $nombre; ?>&key=<?php echo $key; ?>&total=<?php echo $total; ?>"
              method="post">
            <br>
            <section class="row">
                <div class="control-pares col-md-6">
                    <label for="" class="control-label">Nombre Completo:</label>
                    <input type="text" name="textproducto" class="form-control" placeholder="Detalle del Producto" readonly=readonly
                    value="<?php echo datos_clientes::nombre_apellido_cliente($nombre,$mysqli); ?>">
                </div>
                <div class="control-pares col-md-4">
                    <label for="" class="control-label">Sucursal: *</label>
                    <input type="text" name="textpagar" class="form-control" value="<?php echo datos_clientes::nombre_sucursal($indsucursal); ?>" readonly=readonly>
                </div>
            </section>
            <br>
            <section class="row">
                <div class="control-pares col-md-7">
                    <label for="" class="control-label">Codigo Factura: *</label>
                    <input type="text" name="textproducto" class="form-control" placeholder="Detalle del Producto"
                           readonly=readonly
                           value="<?php echo $key; ?>">
                </div>
                <div class="control-pares col-md-4">
                    <label for="" class="control-label">Monto a Pagar: $ dolares *</label>
                    <input type="text" name="textpagar" class="form-control" placeholder="USD" value="<?php echo $total_final; ?>" readonly=readonly>
                </div>
            </section>
            <br>
            <section class="row">
<!--                <div class="control-pares col-md-3">-->
<!--                    <label for="" class="control-label">Cuantas Cuotas: *</label>-->
<!--                    <input type="text" name="textcuotas" class="form-control" placeholder="Cuotas"-->
<!--                           value="" required>-->
<!--                </div>-->
<!--                <div class="control-pares col-md-3">-->
<!--                    <label for="" class="control-label">Prima USD: *</label>-->
<!--                    <input type="text" name="textprima" class="form-control" placeholder="Cuotas"-->
<!--                           value="">-->
<!--                </div>-->
                <div class="control-pares col-md-3">
                    <label for="" class="control-label">Fecha Inicio: *</label>
                    <input type="date" name="textfechainicio" class="form-control"
                           value="<?php echo date('Y-m-d', strtotime(datos_clientes::fecha_get_pc_MYSQL())) ?>">
                </div>
            </section>
            <br>
            <div class="modal-footer">
                <input type="submit" value="Nuevo Credito" class="btn white-text blue-grey btn-primary"/>
            </div>
        </form>
    </div>
<?php include "header/footer.php" ?>
<?php
