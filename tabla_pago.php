<?php include "header/header.php";
if($_SESSION){

}else{
    echo '<script>location.href="login.php";</script>';
}
if ($_GET) {
    $indcredito = $_GET['indcredito'];
} else {
    echo '<script> location.href="buscar_clientes.php" </script>';
}

if ($_POST) {
    echo $recibo = $_POST['textrecibo'];
    echo $detalle = $_POST['textdetalles'];
    echo $total = $_POST['texttota'];
//    $ = $_POST['text'];
    echo $fecha = $_POST['textfecha'];
}
$total_faltante=datos_clientes::total_deuda_faltante22($indcredito,$mysqli);





//echo '<script>
// swal({
//   title: "Exito ?",
//   text: "Guardado Con Exito",
//   icon: "success",
//   buttons: true,
//
// })
// .then((willDelete) => {
//   if (willDelete) {
//     location.href="tabla_pago.php?indcredito='. $indcredito.'";
//   }else {
//     location.href="tabla_pago.php?indcredito='. $indcredito.'";
//   }
// });
// </script>';
?>
<div class="container white z-depth-1 rounded" style="border-radius: 6px;">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Deuda Pendiente: <span class="red-text">$ <?php echo $total_faltante; ?></span> </h4>
    </div>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>?indcredito=<?php echo $indcredito; ?>"
          method="post">
        <br>
        <section class="row">
            <div class="control-pares col-md-2">
                <label for="" class="control-label">Numero de Recibo: *</label>
                <input type="number" name="textrecibo" class="form-control" placeholder="Numero Factura" required>
            </div>
            <br>
            <div class="control-pares col-md-7">
                <label for="" class="control-label">Por Concepto de: *</label>
                <input type="text" name="textdetalles" class="form-control" placeholder="Numero Factura" required value="">
            </div>
            <div class="control-pares col-md-2">
                <label for="" class="control-label">Cantidad dolares: $ *</label>
                <input type="number" name="texttotal" class="form-control" placeholder="Detalles de concepto" required>
            </div>
            <div class="control-pares col-md-2">
                <label for="" class="control-label">Fecha: *</label>
                <input type="date" name="textfecha" value="<?php echo datos_clientes::fecha_get_pc_MYSQL();?>" class="form-control" placeholder="Numero Factura" required>
            </div>
        </section>
        <div class="modal-footer">
            <input type="submit" value="Registrar pago" class="btn white-text blue-grey btn-primary"/>
        </div>
    </form>
</div>
<br>
<div class="container z-depth-1 rounded white" style="border-radius: 6px;">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Lista de Creditos</h4>
    </div>
    <table class="table table-bordered" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col"># ID</th>
            <th scope="col">USD Pago</th>
            <th scope="col">No Recibo</th>
            <th scope="col">Fecha Pago</th>
            <th scope="col">Pagar</th>
            <th scope="col" class="center-align">Imprimir</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $contador=1;
        if ($_GET) {
            $result4 = $mysqli->query("SELECT * FROM `creditos_pago` WHERE indcredito='$indcredito' ORDER BY indcredito DESC");
            while ($resultado = $result4->fetch_assoc()) {
                ?>
                <tr>
                    <th scope="row"><?php echo $contador; ?></th>
                    <td><b>USD <?php echo $resultado['pago']; ?></b></td>
                    <td><b><?php echo $resultado['indfactura']; ?></b></td>
                    <td><?php
                        $fecha_cambio = $resultado['fechapago'];
                        $timestamp = strtotime($fecha_cambio);
                        echo date("d/m/Y", $timestamp);
                        ?></td>
                    <td class="center-align"><?php
                        if ($resultado['status'] == "false") {
                            ?>
                            <p class="red white-text rounded"  style="border-radius: 6px;">Cuenta Por Cobrar</p>
                            <?php
                        } else {
                            ?>
                            <p class="bg-success white-text rounded" style="background-color:#1cc88a!important;border-radius: 6px;">Cancelado</p>
                            <?php
                        }
                        ?>
                    </td>
                    <td class="center-align"><a href="PDF/htmltopdf.php?key=<?php echo $resultado['indtemp']; ?>"
                                                class="btn btn-success" target="_blank"><i class="icon-printer"></i></a></td>
                </tr>
            <?php

            $contador=$contador+1;
            }

        } ?>

        <tr>
            <th scope="row"></th>
            <th scope="row"><?php echo $contador; ?></th>
            <th scope="row"><?php echo $contador; ?></th>
            <th scope="row"><?php echo $contador; ?></th>
            <th scope="row"><?php echo $contador; ?></th>
            <th scope="row"><?php echo $contador; ?></th>
        </tr>
        </tbody>
    </table>
    </div>
<?php
function basico($numero) {
    $valor = array ('UNO','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO',
        'NUEVE','DIEZ','ONCE','DOCE','TRECE','CATORCE','QUINSE','DIECISEIS','DIECISIETE','DIECIOCHO','DIECINUEVE','VEINTE','VEINTIUNO ','VEINTIDOS ','VEINTITRES ', 'VEINTICUATRO','VEINTICINCO',
        'VEINTISEIS','VEINTISIETE','VEINTIOCHO','VEINTINUEVE');
    return $valor[$numero - 1];
}

function decenas($n) {
    $decenas = array (30=>'TREINTA',40=>'CUARENTA',50=>'CINCUENTA',60=>'SENSENTA',
        70=>'SETENTA',80=>'OCHENTA',90=>'NOVENTA');
    if( $n <= 29) return basico($n);
    $x = $n % 10;
    if ( $x == 0 ) {
        return $decenas[$n];
    } else return $decenas[$n - $x].' y '. basico($x);
}

function centenas($n) {
    $cientos = array (100 =>'CIEN',200 =>'DOCIENTO',300=>'TRESIENTO',
        400=>'CUATROCIENTOS', 500=>'QUINIENTO',600=>'SEISCIENTO',
        700=>'SETECIENTO',800=>'OCHOCIENTO', 900 =>'NOVECIENTO');
    if( $n >= 100) {
        if ( $n % 100 == 0 ) {
            return $cientos[$n];
        } else {
            $u = (int) substr($n,0,1);
            $d = (int) substr($n,1,2);
            return (($u == 1)?'CIENTO':$cientos[$u*100]).' '.decenas($d);
        }
    } else return decenas($n);
}

function miles($n) {
    if($n > 999) {
        if( $n == 1000) {return 'MIL ';}
        else {
            $l = strlen($n);
            $c = (int)substr($n,0,$l-3);
            $x = (int)substr($n,-3);
            if($c == 1) {$cadena = 'MIL '.centenas($x);}
            else if($x != 0) {$cadena = centenas($c).' MIL '.centenas($x);}
            else $cadena = centenas($c). ' MIL ';
            return $cadena;
        }
    } else return centenas($n);
}

function millones($n) {
    if($n == 1000000) {return 'UN MILLON ';}
    else {
        $l = strlen($n);
        $c = (int)substr($n,0,$l-6);
        $x = (int)substr($n,-6);
        if($c == 1) {
            $cadena = ' MILLON ';
        } else {
            $cadena = ' MILLONES ';
        }
        return miles($c).$cadena.(($x > 0)?miles($x):'');
    }
}
function convertir($n) {
    switch (true) {
        case ( $n >= 1 && $n <= 29) : return basico($n); break;
        case ( $n >= 30 && $n < 100) : return decenas($n); break;
        case ( $n >= 100 && $n < 1000) : return centenas($n); break;
        case ($n >= 1000 && $n <= 999999): return miles($n); break;
        case ($n >= 1000000): return millones($n);
    }
}
function NumberBreakdown($number, $returnUnsigned = false)
{
    $negative = 1;
    if ($number < 0)
    {
        $negative = -1;
        $number *= -1;
    }

    if ($returnUnsigned){
        return array(
            floor($number),
            ($number - floor($number))
        );
    }

    return array(
        floor($number) * $negative,
        ($number - floor($number)) * $negative
    );
}
$n = 55232.5;
$numero_conver = floor($n);      // 1
$fraction = ($n - $numero_conver)*10; // .25




echo convertir($numero_conver). " " .$fraction."/100";

include "header/footer.php" ?>