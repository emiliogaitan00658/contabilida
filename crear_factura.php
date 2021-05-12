<?php include "header/header.php";
$indcliente = $_SESSION["indcliente"];
$Key = $_SESSION["Key"];
$_SESSION["Key"] = $Key;
$row = datos_clientes::buscar($indcliente, $mysqli);
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}
if ($_POST) {
    if (!empty($_POST['textnombre'])) {
        $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));
        $apellido = strtoupper(filter_var($_POST['textapellido'], FILTER_SANITIZE_STRING));
    }
}

if($_SESSION["Key"]==""){
    echo '<script> location.href="factura.php" </script>';
}

?>
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" name="myapp">
    <div class="container z-depth-1 rounded white center-block">
        <br>
        <br>
        <section class="row">
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Nombres: *</label>
                <input type="text" name="textnombre" class="form-control"
                       value="<?php echo $row["nombre"] ?>" placeholder="Nombres" readonly=readonly>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Apellidos: *</label>
                <input type="text" name="textapellido" class="form-control"
                       value="<?php echo $row["apellido"] ?>" placeholder="Apellidos" readonly=readonly>
            </div>
            <div class="control-pares col-md-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                        Cordobas
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                        Dolar
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                        Tarjeta
                    </label>
                </div>
            </div>

            <div class="control-pares col-md-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                        Trasferencia
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                        BAC
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                        LaFise
                    </label>
                </div>
            </div>
        </section>
        <br>
        <div class="modal-footer">
            <a class="btn white-text black btn-primary" href="temporal/cancelar_factura.php?indtemp=<?php echo $Key;?>"><i class="icon-bin"></i> Eliminar Factura</a>
            <a class="btn white-text blue-grey btn-primary" href="buscar_producto_factura.php"><i class="icon-search"> </i> Buscar Producto</a>
        </div>
    </div>

    <div class="container z-depth-1 rounded white">
        <table class="table table-bordered table-dark table ">
            <thead>
            <tr>
                <th style="width:15%;">No Codigo</th>
                <th style="width:8%;" scope="col">Cantidad</th>
                <th scope="col">Decripcion Producto</th>
                <th scope="col">Descuento</th>
                <th style="width:20px;" scope="col">P/Unidad</th>
                <th style="width:15%;" scope="col">Precio/Total</th>
                <th style="width:15%;" scope="col">Eliminar</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $result4 = $mysqli->query("SELECT * FROM `factura` WHERE `indtemp`='$Key'");
            //$result4 = $mysqli->query("SELECT * FROM `factura`");
            $contador=0;
            while ($resultado = $result4->fetch_assoc()) {
                $contador=$contador+1;
                ?>
                <tr>
                    <td style="width:15px;" scope="row"><input type="text" class="form-control" id='textcodigo<?php echo $contador;?>'
                                                   name="textcodigo<?php echo $contador;?>"
                                                   value="<?php echo $resultado['codigo_producto'];?>"  readonly=readonly></td>

                    <td style="width:20px;"><input type="text" class="form-control" id='textcantidad<?php echo $contador;?>'
                                                   name="textcantidad<?php echo $contador;?>"
                                                   value="1" onkeyup="suma<?php echo $contador;?>()"></td>
                    <td><?php echo $resultado['nombre_producto'];?></td>

                    <td style="width:20px;"><input type="text" class="form-control" id="textdescuento<?php echo $contador;?>"
                                                   name="textdescuento<?php echo $contador;?>"
                                                   value="" onkeyup="descuento<?php echo $contador;?>()"></td>

                    <td style="width:20px;"><input type="text" class="form-control" id="textprecio<?php echo $contador;?>" name="textprecio<?php echo $contador;?>"
                                                   value="<?php echo $resultado['precio'];?>" readonly=readonly></td>
                    <td style="width:20px;"><input type="text" class="form-control" id="texttotal<?php echo $contador;?>" name="texttotal<?php echo $contador;?>"
                                                   value="2" readonly=readonly></td>
                    <td style="width:20px;"><a class="btn btn-danger" href="temporal/eliminar_producto.php?indproducto=<?php echo $resultado['codigo_producto'];?>&indtemp=<?php echo $Key;?>"><i class="icon-bin"></i></a></td>
                </tr>
                <?php
            } ?>
            </tbody>
        </table>
        <br>
    </div>
    <div class="container z-depth-1 rounded white">
        <br>
        <section class="row">
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Pago Dolar:</b></label>
                <input type="text" name="textdolar" class="form-control"
                       value="" placeholder="Pago en dolar" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Pago Cordobas:</b></label>
                <input type="text" name="textcordobas" class="form-control"
                       value="" placeholder="Pago en cordobas" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Sub Total:</b></label>
                <input type="text" name="textsubtotal" id="textsubtotal" disabled class="form-control"
                       value="<?php echo datos_clientes::sumatotal_factursa($Key,$mysqli); ?>" placeholder="Sub total" readonly=readonly>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Total:</b></label>
                <input type="text" name="textotal33" id="textotal33" class="form-control"
                       value="<?php echo datos_clientes::sumatotal_factursa($Key,$mysqli); ?>" placeholder="Sub total" readonly=readonly required>
            </div>
            <br>
            <div class="control-pares col-md-3" style="padding-top: 2em;">
                <input type="submit" value="Pagadar" class="btn white-text btn-danger"/>
            </div>
        </section>
        <br>
    </div>
</form>
<script>
    function suma1() {
        var cantidad = document.myapp.textcantidad1.value;
        var precio = document.myapp.textprecio1.value;
        try {
            if (parseInt(cantidad)) {
                var total = cantidad * precio;
                document.myapp.texttotal1.value = dosdecimales(total);
            } else {
                document.myapp.textvalor1.value = "";
            }

            function dosdecimales(x) {
                return Number.parseFloat(x).toFixed(2);
            }
        } catch (e) {
            document.myapp.textvalor1.value = "";
        }
    }
    function descuento1(){
        var total_sub = document.myapp.textsubtotal.value;
        var descuento = document.myapp.textdescuento1.value;
        try {
            if (parseInt(total_sub)) {
                var total_descuento = total_sub * (descuento/100);
                var total = total_sub - total_descuento;
                document.myapp.textotal33.value = dosdecimales(total);
            } else {
                document.myapp.textotal33.value = "";
            }

            function dosdecimales(x) {
                return Number.parseFloat(x).toFixed(2);
            }
        } catch (e) {

        }
    }


</script>
<?php include "header/footer.php" ?>

