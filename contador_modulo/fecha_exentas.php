<?php
include "../header/header_panel_informe.php";
?>
    <br>
    <br>
    <br>
    <br>
    <div class="container white rounded z-depth-2" style="border-radius: 6px;">
        <div style="padding: 1em">
            <h5>Venta de ortho dental (Exedentes de ley 822 Art. 127 y 136)</h5>
            <p><span class="red-text">*</span>Los informenes son mensuales o semanales si desea desde una fecha determinada</p>
            <hr>
            <br>
            <form action="contado_venta_exentas.php" target="_blank" method="post">
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
                        <input type="submit" value="Generar Informe" class="btn white-text blue-grey btn-primary"/>
                    </div>
                </section>
            </form>
            <a class="btn btn-dark light-blue right" href="../panel_control.php"><i class="icon-arrow-left2"></i>Regresar</a>
            <br>
            <p>Nota: Los detalle del producto solo seran cambiado y autizado por el personal adminstrativo de la
                plataforma.</p>
            <p>Contactar al ingeniero de la empresa</p>
            <br>
        </div>
    </div>
<?php
include_once "../header/footer_temporal.php";
?>