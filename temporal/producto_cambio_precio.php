<?php
include_once "../header/header_panel.php";
$dolar = datos_clientes::cambio_dolar($mysqli);
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
            <br>
            <hr>
            <a href="nuevo_producto.php" class="btn btn-success">Agregar Producto</a>
            <hr>
            <p>Si desea buscar el producto por marca debe de asignar el codigo mas - ejemplo=(MAQUIRA-)</p>
            <hr>
           <a class="btn btn-dark light-blue right" href="../panel_control"><i class="icon-arrow-left2"></i>
                Regresar</a>
            <br>
            <br>
        </div>
    </div>
    <hr>
    <div class="container z-depth-1 rounded white">
        <table class="table table-bordered" style="padding: 1em;">
            <thead>
            <tr style="border-bottom: 1px solid black">
                <th scope="col">#Codigo</th>
                <th scope="col">Producto</th>
                <th scope="col">Precio 1</th>
                <th scope="col">Precio 2</th>
                <th scope="col">Precio 3</th>
                <th scope="col">Eliminar</th>
                <th scope="col">Cambiar</th>
            </tr>
            </thead>
            <tbody>
            <?php
            if (!empty($_POST["textproducto"])) {
                echo $producto = $_POST["textproducto"];
                $result4 = $mysqli->query("SELECT * FROM `producto` WHERE `nombre_producto` LIKE '%%$producto%%' OR `codigo_producto` LIKE '%%$producto%%' ORDER by nombre_producto ASC");
            } else {
                $result4 = $mysqli->query("SELECT * FROM `producto` ORDER by nombre_producto ASC limit 30");
            }
            while ($resultado = $result4->fetch_assoc()) {
                ?>
                <tr>
                    <th scope="row"><?php echo $resultado['codigo_producto']; ?></th>
                    <td><?php echo $resultado['nombre_producto']; ?></td>
                    <td>$ <?php echo $resultado['precio1']; ?></td>
                    <td>$ <?php echo $resultado['precio2']; ?></td>
                    <td>$ <?php echo $resultado['precio3']; ?></td>
                    <td><a href="eliminar_producto_lista.php?producto=<?php echo $resultado['indproducto']; ?>" class="btn btn-danger"><i class="icon-bin bt btn-danger"></i></a></td>
                    <td><a href="Edit_producto.php?producto=<?php echo $resultado['indproducto']; ?>" class="btn btn-success"  target="_blank">Editar</a></td>
                </tr>
            <?php } ?>

            </tbody>
        </table>
    </div>


<?php
include_once "../header/footer_temporal.php";
?>