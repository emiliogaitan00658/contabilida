<?php include "header/header.php";
$ress = $_GET["Key"];
$Key = $_GET["Key"];
$i = datos_clientes::datos_factura_general_subtotal($Key,$mysqli);
$indcliente = $i["indcliente"];
$sucursal = $_SESSION['sucursal'];
$row = datos_clientes::buscar($indcliente, $mysqli);
if (!$_GET) {
    echo '<script> location.href="factura_dia.php" </script>';
}
if ($_POST) {
    $check_cordoba = isset($_POST['flexCheckCheckedcordoba']) ? 1 : 0;
    $check_dolar = isset($_POST['flexCheckCheckeddolar']) ? 1 : 0;
    $check_tras = isset($_POST['flexCheckCheckedtraferencia']) ? 1 : 0;
    $check_efect = isset($_POST['flexCheckCheckedefectivo']) ? 1 : 0;
    $check_fise = isset($_POST['flexCheckCheckedlafise']) ? 1 : 0;
    $check_bac = isset($_POST['flexCheckCheckedbac']) ? 1 : 0;
    $check_credito = isset($_POST['flexCheckCheckedcredito']) ? 1 : 0;
    $check_targeta = isset($_POST['flexCheckCheckedtargeta']) ? 1 : 0;
    $check_rx = isset($_POST['flexCheckCheckedrx']) ? 1 : 0;
    $cordobas = $_POST['textcordobas'];
    $dolar = $_POST['textdolar'];

    $codo = datos_clientes::sumatotal_factursa_subfactura($Key, $mysqli);
    $RES = $codo;
    $subtotalF = number_format($RES, 2, '.', '');

    $res3 = datos_clientes::sumatotal_factursa($Key, $mysqli);
    $sum = $res3;
    $totalF = number_format($sum, 2, '.', '');
    if ($check_rx == 1) {
        datos_clientes::control_ingreso_facturar($sucursal,"RX",$Key,$mysqli);
    }else{
        datos_clientes::control_ingreso_facturar($sucursal,"PX",$Key,$mysqli);
    }
    $exito = datos_clientes::facturafinal($Key, $sucursal, $check_credito, $indcliente, $check_cordoba, $check_dolar, $check_tras, $check_efect, $check_fise, $check_bac, $check_targeta,
        $cordobas, $dolar, $subtotalF, $totalF, $mysqli);
    if ($exito == true) {
        $_SESSION["Key"] = "";
        if ($check_credito == 1) {
            echo '<script> location.href="detalles_credito.php?indcliente=' . $indcliente . '&key=' . $ress . '&total= ' . $totalF . '" </script>';
        } else {
            echo '<script> location.href="factura_dia.php" </script>';
        }
    }else{
        swal("alerta!", "Surgio un problema sistema!", "error");
    }

}

if ($_GET["Key"] == "") {
    echo '<script> location.href="factura_dia.php" </script>';
}
?>
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" name="myapp"
      onsubmit="return(appregistro());">
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


<!--            --><?php
//            $i=datos_clientes::tipo_trasferencia("",$Key,$mysqli);
//            if(){
//
//            }
//            ?>
            <div class="control-pares col-md-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedefectivo"
                           name="flexCheckCheckedefectivo" checked>
                    <label class="form-check-label" for="flexCheckChecked">
                        Efectivo
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedcordoba"
                           name="flexCheckCheckedcordoba">
                    <label class="form-check-label" for="flexCheckChecked">
                        Cordobas
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckeddolar"
                           name="flexCheckCheckeddolar">
                    <label class="form-check-label" for="flexCheckChecked">
                        Dolar
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedtargeta"
                           name="flexCheckCheckedtargeta">
                    <label class="form-check-label" for="flexCheckChecked">
                        Tarjeta
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedrx"
                           name="flexCheckCheckedrx">
                    <label class="form-check-label" for="flexCheckChecked">
                        RX
                    </label>
                </div>
            </div>

            <div class="control-pares col-md-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedtrasferencia"
                           name="flexCheckCheckedtraferencia">
                    <label class="form-check-label" for="flexCheckChecked">
                        Trasferencia
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedbac"
                           name="flexCheckCheckedbac">
                    <label class="form-check-label" for="flexCheckChecked">
                        BAC
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedlafise"
                           name="flexCheckCheckedlafise">
                    <label class="form-check-label" for="flexCheckChecked">
                        LaFise
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedcredito"
                           name="flexCheckCheckedcredito">
                    <label class="form-check-label" for="flexCheckChecked">
                        Credito
                    </label>
                </div>
            </div>
        </section>
        <br>
        <div class="modal-footer">
            <a class="btn white-text black btn-primary"
               href="temporal/cancelar_factura.php?indtemp=<?php echo $Key; ?>"><i class="icon-bin"></i> Eliminar
                Factura</a>
            <a class="btn white-text blue-grey btn-primary" href="buscar_producto_factura.php"><i
                    class="icon-search"> </i> Buscar Producto</a>
        </div>
    </div>

    <div class="container z-depth-1 rounded white">
        <table class="table table-bordered table-dark table ">
            <thead>
            <tr>
                <th style="width:15%;">No Codigo</th>
                <th style="width:5px;" scope="col">Cantidad</th>
                <th scope="col">Decripcion Producto</th>
                <th scope="col">Descuento</th>
                <th style="width:150px;" scope="col">P/Unidad</th>
                <th style="width:15%;" scope="col">Precio/Total</th>
                <th style="width:15%;" scope="col">Eliminar</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $result4 = $mysqli->query("SELECT * FROM `factura` WHERE `indtemp`='$Key'");
            //$result4 = $mysqli->query("SELECT * FROM `factura`");
            $contador = 0;
            while ($resultado = $result4->fetch_assoc()) {
                $contador = $contador + 1;
                ?>
                <tr>
                    <td style="width:15px;" scope="row"><input type="text" class="form-control"
                                                               id='textcodigo<?php echo $contador; ?>'
                                                               name="textcodigo<?php echo $contador; ?>"
                                                               value="<?php echo $resultado['codigo_producto']; ?>"
                                                               readonly=readonly></td>

                    <td style="width:20px;"><input type="text" class="form-control"
                                                   id='textcantidad<?php echo $contador; ?>'
                                                   name="textcantidad<?php echo $contador; ?>"
                                                   value="<?php echo $resultado['unidad']; ?>"
                                                   onkeydown="suma<?php echo $contador; ?>()"></td>
                    <td><?php echo $resultado['nombre_producto']; ?></td>

                    <td style="width:20px;"><input type="text" class="form-control"
                                                   id="textdescuento<?php echo $contador; ?>"
                                                   name="textdescuento<?php echo $contador; ?>"
                                                   value="<?php echo $resultado['descuento']; ?>"
                                                   onkeydown="descuento<?php echo $contador; ?>()"></td>

                    <td style="width:25px;"><input type="text" class="form-control"
                                                   id="textprecio<?php echo $contador; ?>"
                                                   name="textprecio<?php echo $contador; ?>"
                                                   value="<?php echo $resultado['precio_unidad']; ?>" readonly=readonly>
                    </td>
                    <td style="width:20px;"><input type="text" class="form-control"
                                                   id="texttotal<?php echo $contador; ?>"
                                                   name="texttotal<?php echo $contador; ?>"
                                                   value="<?php echo $resultado['precio_total']; ?>" readonly=readonly>
                    </td>
                    <td style="width:20px;"><a class="btn btn-danger"
                                               href="temporal/eliminar_producto.php?indproducto=<?php echo $resultado['codigo_producto']; ?>&indtemp=<?php echo $Key; ?>"><i
                                class="icon-bin"></i></a></td>
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
            <div class="control-pares col-md-2">
                <label for="" class="control-label"><b>Pago Dolar:</b></label>
                <input type="text" name="textdolar" class="form-control"
                       value="" placeholder="Pago en dolar">
            </div>
            <div class="control-pares col-md-2">
                <label for="" class="control-label"><b>Pago Cordobas:</b></label>
                <input type="text" name="textcordobas" class="form-control"
                       value="" placeholder="Pago en cordobas">
            </div>
            <div class="control-pares col-md-2">
                <label for="" class="control-label"><b>$ Dolar Total:</b></label>
                <input type="text" name="textotaldolar" id="textotaldolar" class="form-control"
                       value="<?php
                       $res = datos_clientes::sumatotal_factursa($Key, $mysqli);
                       $fac = $res / $dolar;
                       echo $english_format_number = number_format($fac, 2, '.', ''); ?>" placeholder="Total"
                       readonly=readonly required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Sub Total:</b></label>
                <input type="text" name="textsubtotal" id="textsubtotal" disabled class="form-control"
                       value="<?php $codo = datos_clientes::sumatotal_factursa_subfactura($Key, $mysqli);
                       $RES = $codo;
                       echo $english_format_number = number_format($RES, 2, '.', ''); ?>" placeholder="Sub total"
                       readonly=readonly>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label"><b>Total:</b></label>
                <input type="text" name="textotal33" id="textotal33" class="form-control"
                       value="<?php $res3 = datos_clientes::sumatotal_factursa($Key, $mysqli);
                       $sum = $res3;
                       echo $english_format_number = number_format($sum, 2, '.', ''); ?>" placeholder="Total"
                       readonly=readonly required>
            </div>
            <br>
            <div class="control-pares col-md-3" style="padding-top: 2em;">
                <input type="submit" value="Guardar Factura" class="btn white-text btn-large btn-info"/>
            </div>
        </section>
        <br>
    </div>
</form>
<script src="assets/auto_elemento_.js"></script>
<script>


    function appregistro() {
        var comprobar = document.myapp.textotal33.value;
        var cordobas = document.myapp.textcordobas.value;
        var dolar = document.myapp.textdolar.value;
        if (cordobas !== "" || dolar !== "") {
            if (comprobar == "0.00") {
                swal("Error!", "Agregar Producto", "error");
                return false;
            } else {
                return true;
            }
        } else {
            //swal("ERROR!", "Llenar Campos Requerido", "error");
            return false;
        }

    }

    //////////////////////////////////////////////////////////////////////////////////
    //cambio de cantidad de total de producto//

    function enviar(total, codigo, precio) {

        var enviar = "total=" + total;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "temporal/datos_actualizar_factura.php?indcodigo=" + codigo + "&precio=" + precio);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(enviar);

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                //alert(xhr.responseText);
            }
        }

    }

    function descuento_fun(codigo, descuento) {

        var enviar = "codigo=" + codigo;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "temporal/descuento_update.php?descuento=" + descuento);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(enviar);

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                //alert(xhr.responseText);
            }
        }

    }

    function sumar_totoales_producto(codigo, descuento, total) {

        var enviar = "codigo=" + codigo;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "temporal/total_descuento.php?descuento_total=" + descuento + "&descuento_suma=" + total);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(enviar);

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                //alert(xhr.responseText);
            }
        }

    }

    function sumar_totaldescuento_t(codigo) {
        var c;
        var enviar = "codigo=" + codigo;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "temporal/while_factura.php");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(enviar);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                c = parseFloat(xhr.responseText);
                var dolar = "<?php echo $dolar; ?>";
                textotaldolar.value = dosdecimales(c / dolar);
                textotal33.value = dosdecimales(xhr.responseText);
            }

            function dosdecimales(x) {
                return Number.parseFloat(x).toFixed(2);
            }
        }
    }


    /////////////////////////////////////////////////////////////////////////////////

</script>
<?php include "header/footer.php" ?>


