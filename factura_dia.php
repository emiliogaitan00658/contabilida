<?php include "header/header.php";
//session_start();
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
if ($_POST) {
    $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));
}
?>
<div class="container white rounded z-depth-1">
    <div style="padding: 1em">
        <h5>Factura </h5>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <section class="row">
                <div class="control-pares col-md-4">
                    <input type="date" name="textnombre" class="form-control" placeholder="Fecha" required>
                </div>
                <div class="control-pares col-md-4">
                    <input type="submit" value="Buscar" class="btn white-text blue-grey btn-primary"/>
                </div>
            </section>
        </form>
        <br>
        <a class="btn btn-dark" href="factura">Crear Nueva Facuración</a>
    </div>
</div>
<hr>
<div class="container z-depth-1 rounded white">
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col">indtatolnario</th>
            <th scope="col">Nombre y Apellido</th>
            <th scope="col">Total</th>
            <th scope="col">Imprimir</th>
            <th scope="col">Editar</th>
            <th scope="col">Anular</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $result4 = $mysqli->query("SELECT * FROM `factura` WHERE indsucursal='$indsucursal' ORDER by indfactura DESC");

        /* $result4 = $mysqli->query("SELECT * FROM clientes
      WHERE nombre LIKE _utf8  '%%$nombre%%'
      OR apellido LIKE _utf8  '%%$nombre%%' ORDER BY nombre");*/

        while ($resultado = $result4->fetch_assoc()) {
            $indcliente=$resultado['indcliente'];
            $nombre_apelido=datos_clientes::nombre_apellido_cliente($indcliente, $indsucursal, $mysqli);
            ?>
            <tr>
                <td><?php echo $resultado["indtalonario"]; ?></td>
                <td><?php echo $nombre_apelido; ?></td>
                <td><?php echo "C$ ".$total=($resultado['unidad']*$resultado['precio']*$resultado['cordoba'])?></td>
                <td><a href="detaller_clientes.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                       class="btn btn-success">Imprimir</a></td>
                <td><a href="detaller_clientes.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                       class="btn btn-success">Editar</a></td>
                <td><a href="crear_factura.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                       class="btn btn-primary">Anular</a></td>
            </tr>
            <?php

        } ?>
        </tbody>
    </table>
</div>
<?php include "header/footer.php" ?>

