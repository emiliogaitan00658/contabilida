<?php
include "../header/header_panel_informe.php";
?>
    <br>
    <br>
    <br>
    <br>
    <div class="container white rounded z-depth-2" style="border-radius: 6px;">
        <div style="padding: 1em">
            <h5><i class="ui-icon-person red-text"></i> Entrega de materiales Asignado</h5>
            <p><span class="red-text"> *</span>Los informenes son mensuales o semanales si desea desde una fecha determinada</p>
            <hr>
            <br>
            <form action="../imprimir/informe_entrega_materiale.php" target="_blank" method="post">
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
                        </select>
                    </div>
                    <div class="control-pares col-md-2">
                        <input type="submit" value="Generar Informe" class="btn white-text blue-grey btn-primary"/>
                    </div>
                </section>
            </form>
            <a class="btn btn-dark light-blue right" href="../panel_control.php"><i class="icon-arrow-left2"></i>Regresar</a>
            <br>
            <p>Nota: Los detalle del producto solo seran cambiado y autizado por el personal adminstrativo de la
                plataforma.</p>
            <p>contactar al ingeniero de la empresa</p>
            <br>
        </div>
    </div>
<?php
include_once "../header/footer_temporal.php";
?>