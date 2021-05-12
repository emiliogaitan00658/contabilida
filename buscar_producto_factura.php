<?php include "header/header.php";
//session_start();
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
if ($_GET) {
    $indproducto = $_GET['codigo'];
    $precio = $_GET['precio'];
    $producto = $_GET['producto'];
    $indtemp = $_SESSION['Key'];
    $indsucursal = $_SESSION['sucursal'];
    datos_clientes::facturagenerada_filtro1($indtemp, $dolar, $indsucursal, $precio, $producto, $indproducto, $mysqli);
 echo '<script>
    swal("Exito Registor Producto.")
.then((value) => {
  location.href="crear_factura.php";
});
</script>';
}
?>
<div class="container white rounded z-depth-2" style="border-radius: 6px;">
    <div style="padding: 1em">
        <h5>Buscar producto</h5>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <section class="row">
                <div class="control-pares col-md-4">
                    <input type="text" name="textproducto" class="form-control" placeholder="Buscar ....." required>
                </div>
                <div class="control-pares col-md-4">
                    <input type="submit" value="Buscar producto" class="btn white-text blue-grey btn-primary"/>
                </div>
            </section>
        </form>
        <hr>
        <a class="btn btn-dark light-blue right" href="index"><i class="icon-arrow-left2"></i> Regresar</a>
        <br>
        <br>
    </div>
</div>
<hr>
<div class="container z-depth-1 rounded white">
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col">No# Codigo</th>
            <th scope="col">Detalles Producto</th>
            <th scope="col">Precio 1</th>
            <th scope="col">Precio 2</th>
            <th scope="col">Precio 3</th>
        </tr>
        </thead>
        <tbody>
        <?php
        if (!empty($_POST["textproducto"])) {
            $producto = $_POST["textproducto"];
            $result4 = $mysqli->query("SELECT * FROM `producto` WHERE `nombre_producto` LIKE '%%$producto%%' ORDER by nombre_producto ASC");
        } else {
            $result4 = $mysqli->query("SELECT * FROM `producto` ORDER by nombre_producto ASC limit 30");
        }
        while ($resultado = $result4->fetch_assoc()) {
            ?>
            <tr>
                <th scope="row"><?php echo $resultado['codigo_producto']; ?></th>
                <td><?php echo $resultado['nombre_producto']; ?></td>
                <td>
                    <a href="buscar_producto_factura.php?codigo=<?php echo $resultado['codigo_producto'] . '&precio=' . $resultado['precio1'] . '&producto=' . $resultado['nombre_producto']; ?>">$ <?php echo $resultado['precio1'] . ' (' . $dolar * $resultado['precio1'] . ')'; ?></a>
                </td>
                <td>
                    <a href="buscar_producto_factura.php?codigo=<?php echo $resultado['codigo_producto'] . '&precio=' . $resultado['precio2'] . '&producto=' . $resultado['nombre_producto']; ?>">$ <?php echo $resultado['precio2']; ?></a>
                </td>
                <td>
                    <a href="buscar_producto_factura.php?codigo=<?php echo $resultado['codigo_producto'] . '&precio=' . $resultado['precio3'] . '&producto=' . $resultado['nombre_producto']; ?>">$ <?php echo $resultado['precio3']; ?></a>
                </td>
            </tr>
        <?php } ?>

        </tbody>
    </table>
</div>
<?php include "header/footer.php" ?>


