<?php include "header/header.php";
//session_start();
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
?>
<div class="container white rounded z-depth-1">
    <div style="padding: 1em">
        <h5>Factura </h5>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <section class="row">
                <div class="control-pares col-md-3">
                    <input type="date" name="textfecha" class="form-control" placeholder="Fecha" value="<?php
                    $fcha = date("Y-m-d");
                    echo $fcha; ?>" required>
                </div>
                <div class="control-pares col-md-3">
                    <select name="textsucursal" class="form-control" required>
                        <option class="form-control" value="<?php
                        echo $_SESSION['sucursal']; ?>" selected><?php

                            if ($_SESSION['sucursal'] == "1") {
                                echo "Managua";
                            }
                            if ($_SESSION['sucursal'] == "2") {
                                echo "Masaya";
                            }
                            if ($_SESSION['sucursal'] == "3") {
                                echo "Chontales";
                            }
                            if ($_SESSION['sucursal'] == "6") {
                                echo "Esteli";
                            }
                            if ($_SESSION['sucursal'] == "5") {
                                echo "Leon";
                            }
                            if ($_SESSION['sucursal'] == "9") {
                                echo "Matagalpa";
                            }
                            if ($_SESSION['sucursal'] == "4") {
                                echo "Chinandega";
                            }
                            if ($_SESSION['sucursal'] == "7") {
                                echo "Managua Bolonia";
                            }
                            if ($_SESSION['sucursal'] == "8") {
                                echo "Managua Villa Fontana";
                            }

                            ?></option>
                        <option class="form-control" value="1">Managua</option>
                        <option class="form-control" value="2">Masaya</option>
                        <option class="form-control" value="3">Chontales</option>
                        <option class="form-control" value="6">Esteli</option>
                        <option class="form-control" value="5">Leon</option>
                        <option class="form-control" value="9">Matagalpa</option>
                        <option class="form-control" value="4">Chinandega</option>
                        <option class="form-control" value="7">Managua Bolonia</option>
                        <option class="form-control" value="8">Managua Villa Fontana</option>
                    </select>
                </div>
                <div class="control-pares col-md-4">
                    <input type="submit" value="Buscar" class="btn white-text blue-grey btn-primary"/>
                </div>
            </section>
        </form>
        <br>
    </div>
</div>
<hr>
<div class="container z-depth-1 rounded white">
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col">No.Factura</th>
            <th scope="col">Nombre y Apellido</th>
            <th scope="col">Total</th>
            <th scope="col">Imprimir</th>
            <th scope="col">Editar</th>
            <th scope="col">Anular</th>
        </tr>
        </thead>
        <tbody>
        <?php
        if ($_POST) {
            $result4 = $mysqli->query("SELECT * FROM `factura` WHERE indsucursal='$indsucursal' ORDER by indfactura DESC");
        } else {
            $result4 = $mysqli->query("SELECT * FROM `factura` WHERE indsucursal='$indsucursal' ORDER by indfactura DESC");
        }

        while ($resultado = $result4->fetch_assoc()) {
            $indcliente = $resultado['indcliente'];
            $nombre_apelido = datos_clientes::nombre_apellido_cliente($indcliente, $indsucursal, $mysqli);
            ?>
            <tr>
                <td><?php echo $resultado["indtalonario"]; ?></td>
                <td><?php echo $nombre_apelido; ?></td>
                <td><?php echo "C$ " . $total = ($resultado['unidad'] * $resultado['precio'] * $resultado['cordoba']) ?></td>
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

