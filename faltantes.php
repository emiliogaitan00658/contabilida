<?php include "header/header.php";
//session_start();
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
?>
    <div class="container white rounded z-depth-2" style="border-radius: 6px;">
        <div style="padding: 1em">
            <h5>Factura </h5>
            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                <section class="row">
                    <div class="control-pares col-md-3">
                        <input type="date" name="textfecha1" class="form-control" placeholder="Fecha" value="<?php
                        if ($_POST) {
                            $new_date = date('Y-m-d', strtotime($_POST['textfecha1']));
                            echo $new_date;
                        } else {
                            $fcha = date("Y-m-d");
                            echo $fcha;
                        }
                        ?>" required>
                    </div>
                    <span>a</span>
                    <div class="control-pares col-md-3">
                        <input type="date" name="textfecha2" class="form-control" placeholder="Fecha" value="<?php
                        if ($_POST) {
                            $new_date = date('Y-m-d', strtotime($_POST['textfecha2']));
                            echo $new_date;
                        } else {
                            $fcha = date("Y-m-d");
                            echo $fcha;
                        }
                        ?>" required>
                    </div>
                    <div class="control-pares col-md-2">
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
                                if ($_SESSION['sucursal'] == "10") {
                                    echo "Clinica Dansing";
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
                            <option class="form-control" value="10">Clinica Dansing</option>
                        </select>
                    </div>
                    <div class="control-pares col-md-2">
                        <input type="submit" value="Buscar" class="btn white-text blue-grey btn-primary"/>
                    </div>
                    <span>  <i class="icon-file-pdf" style="font-size: 30px;"> </i>&nbsp; </span>
                    <span>&nbsp;<i class="icon-file-excel" style="font-size: 30px;"></i></span>
                </section>
            </form>
            <br>
        </div>
    </div>
    </div>
    <hr>
    <div class="container z-depth-1 rounded white">
        <table class="table table-borderless" style="padding: 1em;">
            <thead>
            <tr style="border-bottom: 1px solid black">
                <th scope="col">#Codigo</th>
                <th scope="col">Unidad</th>
                <th scope="col">Producto</th>
                <th scope="col">Fecha</th>
                <th scope="col">Precio/Descuento</th>
                <th scope="col">Precio/Unidad</th>
                <th scope="col">Precio/Subtotal</th>
                <th scope="col">Precio/Total</th>
            </tr>
            </thead>
            <tbody>
            <?php
            if ($_POST) {
                $fecha1 = $_POST["textfecha1"];
                $fecha2 = $_POST["textfecha2"];
                $sucursal = $_POST["textsucursal"];
                $result4 = $mysqli->query("SELECT * FROM `factura` WHERE `bandera` = 0 and indsucursal='$sucursal' and indtalonario IS NOT NULL");
            } else {
                $result4 = $mysqli->query("SELECT * FROM `factura` WHERE `bandera` = 0 and indtalonario IS NOT NULL");
            }

            while ($resultado = $result4->fetch_assoc()) {
                $fechad = datos_clientes::get_fecha_faltante($resultado['indtemp'], 1, $mysqli);
                if ($_POST) {
                    $FE = date('Y-m-d', strtotime($fechad['fecha']));
                    $contractDateBegin = date('Y-m-d', strtotime($fecha1));
                    $contractDateEnd = date('Y-m-d', strtotime($fecha2));

                    if (($FE >= $contractDateBegin) && ($FE <= $contractDateEnd)) {
                        ?>
                        <tr>
                            <th scope="row"><?php echo $resultado['indtalonario']; ?></th>
                            <td><?php echo $resultado['unidad']; ?></td>
                            <td><?php echo $resultado['nombre_producto']; ?></td>
                            <td><?php echo $fechad['fecha3']; ?></td>
                            <td>% <?php echo $resultado['descuento']; ?></td>
                            <td>C$ <?php echo number_format($resultado['precio_unidad'], 2, '.', ','); ?></td>
                            <td>C$ <?php echo number_format($resultado['precio_total'], 2, '.', ','); ?></td>
                            <td>C$ <?php
                                if ($resultado['descuento'] == "0") {
                                    echo number_format($resultado['precio_total'], 2, '.', ',');
                                }else{
                                    echo number_format($resultado['total_descuento'], 2, '.', ',');
                                }
                                ?></td>
                        </tr>
                    <?php }
                } else {
                    ?>
                    <tr>
                        <th scope="row"><?php echo $resultado['indtalonario']; ?></th>
                        <td><?php echo $resultado['unidad']; ?></td>
                        <td><?php echo $resultado['nombre_producto']; ?></td>
                        <td><?php echo $fechad['fecha']; ?></td>
                        <td>% <?php echo $resultado['descuento']; ?></td>
                        <td>C$ <?php echo number_format($resultado['precio_unidad'], 2, '.', ','); ?></td>
                        <td>C$ <?php echo number_format($resultado['precio_total'], 2, '.', ','); ?></td>
                        <td>C$ <?php
                            if ($resultado['descuento'] == "0") {
                                echo number_format($resultado['precio_total'], 2, '.', ',');
                            }else{
                                echo number_format($resultado['total_descuento'], 2, '.', ',');
                            }
                            ?></td>
                    </tr>
                <?php }
            } ?>
            </tbody>
        </table>
    </div>
<?php include "header/footer.php" ?>