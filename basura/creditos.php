<?php include "header/header.php";
if (!$_SESSION){
    echo '<script> location.href="login" </script>';
}
if ($_GET) {
    $nombre = $_GET['indcliente'];
} else {
    echo '<script> location.href="buscar_clientes.php" </script>';
}
if ($_POST) {
    $producto = strtoupper(filter_var($_POST['textproducto'], FILTER_SANITIZE_STRING));
    $inicio = $_POST['textfechainicio'];
    $monto = $_POST['textpagar'];
    $cuotas = $_POST['textcuotas'];
    $prima = $_POST['textprima'];
    $recues =datos_clientes::nuevo_credito($nombre, $producto, $inicio, $monto, $cuotas, $prima, $mysqli);
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
     location.href="creditos.php?indcliente='.$nombre.'";
   }else {
      location.href="creditos.php?indcliente='.$nombre.'";
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
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>?indcliente=<?php echo $nombre; ?>"
          method="post">
        <br>
        <section class="row">
            <div class="control-pares col-md-7">
                <label for="" class="control-label">Producto: *</label>
                <input type="text" name="textproducto" class="form-control" placeholder="Detalle del Producto" required>
            </div>
            <div class="control-pares col-md-4">
                <label for="" class="control-label">Monto a Pagar: *</label>
                <input type="text" name="textpagar" class="form-control" placeholder="USD" required>
            </div>
        </section>
        <br>
        <section class="row">
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Cuantas Cuotas: *</label>
                <input type="text" name="textcuotas" class="form-control" placeholder="Cuotas"
                       value="" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Prima USD: *</label>
                <input type="text" name="textprima" class="form-control" placeholder="Cuotas"
                       value="0" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Fecha Inicio: *</label>
                <input type="date" name="textfechainicio" class="form-control"
                       value="<?php echo date('Y-m-d', strtotime(datos_clientes::fecha_get_pc_MYSQL())) ?>">
            </div>
        </section>
        <br>
        <div class="modal-footer">
            <input type="submit" value="Nuevo Credito" class="btn blue-grey btn-primary"/>
        </div>
    </form>
</div>
<br>
<div class="container z-depth-1 rounded white">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Lista de Creditos</h4>
    </div>
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col"># ID</th>
            <th scope="col">Producto</th>
            <th scope="col">Credito</th>
            <th scope="col">Fecha Credito</th>
            <th scope="col">Pagar</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $contador=1;
        if ($_GET) {
            $result4 = $mysqli->query("SELECT * FROM `credito` WHERE indcliente='1' ORDER BY indcredito DESC");
            while ($resultado = $result4->fetch_assoc()) {
                ?>
                <tr>
                    <th scope="row"><?php echo $contador; ?></th>
                    <td><b><?php echo $resultado['producto']; ?></b></td>
                    <td><?php echo $resultado['totalCredito']; ?></td>
                    <td><?php
                        $fecha_cambio = $resultado['fechaInicio'];
                        $timestamp = strtotime($fecha_cambio);
                        echo date("d/m/Y", $timestamp); ?></td>
                    <td><a href="tabla_pago.php?indcredito=<?php echo $resultado['indcredito']; ?>" class="btn btn-primary">Pagar Creditos</a></td>
                </tr>
            <?php
            $contador=$contador+1;
            }
        } ?>
        </tbody>
    </table>
</div>
<?php include "header/footer.php" ?>
