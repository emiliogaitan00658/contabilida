<?php include "header/header.php";
$indcliente = $_SESSION["indcliente"];
$Key= $_SESSION["Key"];
$row = datos_clientes::buscar($indcliente, $mysqli);
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}


if ($_POST) {

    if (!empty($_POST['textnombre'])) {
        $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));
        $apellido = strtoupper(filter_var($_POST['textapellido'], FILTER_SANITIZE_STRING));
        $sucursale = strtoupper(filter_var($_POST['textsucursal'], FILTER_SANITIZE_STRING));
        $cedula = strtoupper(filter_var($_POST['textcedula'], FILTER_SANITIZE_STRING));
        $direccion1 = strtoupper(filter_var($_POST['textdireccion1'], FILTER_SANITIZE_STRING));
        $direccion2 = strtoupper(filter_var($_POST['textdireccion2'], FILTER_SANITIZE_STRING));
        $telefono = strtoupper(filter_var($_POST['texttelefono'], FILTER_SANITIZE_STRING));
    }
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
                       value="<?php echo $row["nombre"] ?>" placeholder="Nombres" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Apellidos: *</label>
                <input type="text" name="textapellido" class="form-control"
                       value="<?php echo $row["apellido"] ?>" placeholder="Apellidos" required>
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
                        Targeta
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
            <a class="btn white-text blue-grey btn-primary" href="buscar_producto_factura.php">Buscar Producto</a>
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
            </tr>
            </thead>
            <tbody>
            <tr>
                <th style="width:15%;" scope="row">CAVEX-100</th>
                <td style="width:20px;"><input type="text" class="form-control" id="textcantidad" name="textcantidad"
                                               value="2" onkeyup="suma()"></td>
                <td>ALGINATO CREAM</td>
                <td style="width:20px;"><input type="text" class="form-control" id="textdescuento" name="textdescuento"
                                               value=""></td>
                <td style="width:20px;"><input type="text" class="form-control" id="textprecio" name="textprecio"
                                               value="34.23" disabled></td>
                <td style="width:20px;"><input type="text" class="form-control" id="texttotal" name="texttotal"
                                               value="2" disabled></td>
            </tr>
            </tbody>
        </table>
        <br>
    </div>


    <div class="container z-depth-1 rounded white">
        <br>
        <section class="row">
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Pago Dolar:</b></label>
                <input type="text" name="textapellido" class="form-control"
                       value="" placeholder="Pago en dolar" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Pago Cordobas:</b></label>
                <input type="text" name="textnombre" class="form-control"
                       value="" placeholder="Pago en cordobas" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Sub Total:</b></label>
                <input type="text" name="textnombre" disabled class="form-control"
                       value="" placeholder="Sub total" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Total:</b></label>
                <input type="text" name="textapellido" class="form-control"
                       value="" placeholder="Sub total" disabled required>
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
    function suma() {
        var cantidad = document.myapp.textcantidad.value;
        var precio = document.myapp.textprecio.value;
        try {
            if (parseInt(cantidad)) {
                var total = cantidad * precio;
                document.myapp.texttotal.value = dosdecimales(total);
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
</script>
<?php include "header/footer.php" ?>

