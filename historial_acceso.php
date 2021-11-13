<?php
include_once "header/header.php";
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
?>
<div class="container white rounded z-depth-2" style="border-radius: 6px;">
    <div style="padding: 1em">
        <h5>Historial de acceso</h5>
        <hr>
        <br>
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
                        <?php if ($_POST) { ?>
                            <option class="form-control" value="<?php
                            echo $_POST["textsucursal"]; ?>" selected><?php

                                if ($_POST["textsucursal"] == "1") {
                                    echo "Managua";
                                }
                                if ($_POST["textsucursal"] == "2") {
                                    echo "Masaya";
                                }
                                if ($_POST["textsucursal"] == "3") {
                                    echo "Chontales";
                                }
                                if ($_POST["textsucursal"] == "6") {
                                    echo "Esteli";
                                }
                                if ($_POST["textsucursal"] == "5") {
                                    echo "Leon";
                                }
                                if ($_POST["textsucursal"] == "9") {
                                    echo "Matagalpa";
                                }
                                if ($_POST["textsucursal"] == "4") {
                                    echo "Chinandega";
                                }
                                if ($_POST["textsucursal"] == "7") {
                                    echo "Managua Bolonia";
                                }
                                if ($_POST["textsucursal"] == "8") {
                                    echo "Managua Villa Fontana";
                                }
                                if ($_POST["textsucursal"] == "10") {
                                    echo "Clinica Dansing";
                                }
                                ?></option>
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
                        <option class="form-control" value="10">Clinica Dansing</option>

                    </select>
                </div>
                <div class="control-pares col-md-2">
                    <input type="submit" value="Generar Informe" class="btn white-text blue-grey btn-primary"/>
                </div>
            </section>
        </form>
        <br>
    </div>
</div>
<br>
<div class="row">
    <div class="z-depth-1 rounded white center-block" style="width: 95%;padding: 1em;">
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr style="border-bottom: 1px solid black;">
                <th scope="col" class="center-align">N.#</th>
                <th scope="col" class="center-align">Detalles</th>
                <th scope="col" class="center-align">Nombre</th>
                <th scope="col" class="center-align">SUCURSAL</th>
                <th scope="col" class="center-align">Fecha</th>
                <th scope="col" class="center-align">Hora</th>
            </tr>
            </thead>
            <tbody>
            <?php

            if ($_POST) {
                $fecha1 = $_POST["textfecha1"];
                $fecha2 = $_POST["textfecha2"];
                $sucursal = $_POST["textsucursal"];
                $result4 = $mysqli->query("SELECT * FROM `historial_acceso` WHERE (fecha BETWEEN '$fecha1' AND '$fecha2' ) and indsucursal='$sucursal'");
            } else {
                $fecha = datos_clientes::fecha_get_pc_MYSQL();
                $result4 = $mysqli->query("SELECT * FROM `historial_acceso` WHERE fecha='$fecha' and indsucursal='$indsucursal'");
            }

            while ($resultado = $result4->fetch_assoc()) {
                $empleado = datos_clientes::datos_empleado($resultado["indempleado"], $mysqli);
                ?>
                <tr>
                    <td class="center-align"><?php echo $resultado["indacceso"]; ?></td>
                    <td class="center-align"><?php echo $resultado["descripcion_acceso"]; ?></td>
                    <td class="center-align"><?php echo $empleado["nombre_empleado"] . " " . $empleado["apellido_empleado"]; ?></td>
                    <td class="center-align">Factura Faltante</td>
                    <td class="center-align"><?php echo $resultado["fecha"]; ?></td>
                    <td class="center-align"><?php echo $resultado["hora"]; ?></td>
                </tr>
                <?php
            } ?>
            </tbody>
        </table>
    </div>


