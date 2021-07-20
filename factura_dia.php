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
                        if ($_POST) {
                            echo $_POST["textfecha"];
                        } else {
                            $fcha = date("Y-m-d");
                            echo $fcha;
                        }

                        ?>" required>
                    </div>
                    <div class="control-pares col-md-3">
                        <select name="textsucursal" class="form-control" required>
                            <?php  if (!$_POST){ ?>
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
                                    ?>
                                </option>
                            <?php }else{ ?>
                                <option class="form-control" value="<?php
                                echo $_POST['textsucursal']; ?>" selected><?php

                                    if ($_POST['textsucursal'] == "1") {
                                        echo "Managua";
                                    }
                                    if ($_POST['textsucursal'] == "2") {
                                        echo "Masaya";
                                    }
                                    if ($_POST['textsucursal'] == "3") {
                                        echo "Chontales";
                                    }
                                    if ($_POST['textsucursal'] == "6") {
                                        echo "Esteli";
                                    }
                                    if ($_POST['textsucursal'] == "5") {
                                        echo "Leon";
                                    }
                                    if ($_POST['textsucursal'] == "9") {
                                        echo "Matagalpa";
                                    }
                                    if ($_POST['textsucursal'] == "4") {
                                        echo "Chinandega";
                                    }
                                    if ($_POST['textsucursal'] == "7") {
                                        echo "Managua Bolonia";
                                    }
                                    if ($_POST['textsucursal'] == "8") {
                                        echo "Managua Villa Fontana";
                                    }
                                    ?>
                                </option>
                            <?php } ?>
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
            <hr>
            <a class="btn btn-dark right" href="imprimir/diario_reporte_materiales.php" style="margin-right: 1em">Reporte
                Radiografia</a>
            <a class="btn btn-dark right" href="imprimir/diario_reporte_materiales.php" style="margin-right: 1em">Reporte
                Materiales</a>
            <br>
            <br>
        </div>
    </div>
    <hr>
    <div class="container z-depth-1 rounded white">
        <table class="table table-borderless" style="padding: 1em;">
            <thead>
            <tr style="border-bottom: 1px solid black">
                <th scope="col">No.Factura</th>
                <th scope="col" class="center-align">Nombre y Apellido</th>
                <th scope="col">Subtotal C$</th>
                <th scope="col">Total C$</th>
                <th scope="col">Total $</th>
                <th scope="col">Fecha</th>
                <th scope="col">Hora</th>
                <th scope="col">Imprimir</th>
                <th scope="col">Eliminar</th>
                <th scope="col">Editar</th>
                <th scope="col">Anular</th>
            </tr>
            </thead>
            <tbody>
            <?php

            if ($_POST) {
                $fecha2 = $_POST["textfecha"];
                $sucursal = $_POST["textsucursal"];
                $result4 = $mysqli->query("SELECT * FROM `total_factura` WHERE total_factura.fecha='$fecha2' and total_factura.indsucursal='$sucursal' ORDER by indtotalfactura DESC");
            } else {
                $fecha = datos_clientes::fecha_get_pc_MYSQL();
                $result4 = $mysqli->query("SELECT * FROM `total_factura` WHERE total_factura.fecha='$fecha'and total_factura.indsucursal='$indsucursal' ORDER by indtotalfactura DESC");
            }

            while ($resultado = $result4->fetch_assoc()) {
                $indcliente = $resultado['indcliente'];
                $nombre_apelido = datos_clientes::nombre_apellido_cliente($indcliente, $mysqli);
                ?>
                <?php if ($resultado['bandera'] == "1") { ?>
                    <tr>
                        <td><?php echo $resultado["indtalonario"]; ?></td>
                        <td><?php echo $nombre_apelido; ?></td>
                        <td class="center-align"><?php echo number_format($resultado["subtotal"], 2, '.', ','); ?></td>
                        <td class="center-align"><?php echo number_format($resultado["total"], 2, '.', ','); ?></td>
                        <td class="center-align"><?php echo number_format(($resultado["total"] / $dolar), 2, '.', ','); ?></td>
                        <td class="center-align"><?php echo $resultado["fecha"]; ?></td>
                        <td class="center-align"><?php echo $resultado["hora"]; ?></td>
                        <td class="center-align"><a href="PDF/htmltopdf.php?key=<?php echo $resultado['indtemp']; ?>"
                                                    class="btn btn-success">Imprimir</a></td>
                        <td><a href="PDF/htmltopdf.php?key=<?php echo $resultado['indtemp']; ?>"
                               class="btn btn-danger"><i class="btn-danger icon-bin"></i></a></td>
                        <td class="center-align"><a href="detaller_clientes.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                                    class="btn btn-success">Editar</a></td>
                        <td class="center-align"><a href="#" onclick="
                                    var i='<?php echo $resultado['indtemp']; ?>';
                                    verficar_anulacion(i);"
                                                    class="btn btn-primary">Anular</a></td>
                    </tr>
                <?php } else { ?>
                    <tr class="red-text">
                        <td><?php echo $resultado["indtalonario"]; ?></td>
                        <td><?php echo $nombre_apelido; ?></td>
                        <td class="center-align"><?php echo number_format($resultado["subtotal"], 2, '.', ','); ?></td>
                        <td class="center-align"><?php echo number_format($resultado["total"], 2, '.', ','); ?></td>
                        <td class="center-align"><?php echo number_format(($resultado["total"] / $dolar), 2, '.', ','); ?></td>
                        <td><?php echo $resultado["fecha"]; ?></td>
                        <td><?php echo $resultado["hora"]; ?></td>
                        <td><a href="PDF/htmltopdf.php?key=<?php echo $resultado['indtemp']; ?>"
                               class="btn btn-success">Imprimir</a></td>
                        <td><a href="PDF/htmltopdf.php?key=<?php echo $resultado['indtemp']; ?>"
                               class="btn btn-danger"><i class="btn-danger icon-bin"></i></a></td>
                        <td><a href="detaller_clientes.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                               class="btn btn-success">Editar</a></td>

                        <?php ?>
                        <td><a href="#" class="btn btn-primary">-----</a></td>
                    </tr>
                    <?php
                }
                ?>

                <?php
            } ?>
            </tbody>
        </table>
    </div>


    <script>
        function verficar_anulacion(codigo) {
            swal({
                title: "Anular?",
                text: "Seguro de Anular Factura",
                icon: "success",
                buttons: true,

            })
                .then((willDelete) => {
                    if (willDelete) {
                        location.href = "temporal/anular.php?key=" + codigo;
                    } else {
                        location.href = "factura_dia.php";
                    }
                });
        }
    </script>

<?php include "header/footer.php" ?>