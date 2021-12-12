<?php
include "../BD-Connection/conection.php";
include "../BD-Connection/datos_clientes.php";
function basico($numero)
{
    $valor = array('UNO', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS', 'SIETE', 'OCHO',
        'NUEVE', 'DIEZ', 'ONCE', 'DOCE', 'TRECE', 'CATORCE', 'QUINSE', 'DIECISEIS', 'DIECISIETE', 'DIECIOCHO', 'DIECINUEVE', 'VEINTE', 'VEINTIUNO ', 'VEINTIDOS ', 'VEINTITRES ', 'VEINTICUATRO', 'VEINTICINCO',
        'VEINTISEIS', 'VEINTISIETE', 'VEINTIOCHO', 'VEINTINUEVE');
    return $valor[$numero - 1];
}

function decenas($n)
{
    $decenas = array(30 => 'TREINTA', 40 => 'CUARENTA', 50 => 'CINCUENTA', 60 => 'SENSENTA',
        70 => 'SETENTA', 80 => 'OCHENTA', 90 => 'NOVENTA');
    if ($n <= 29) return basico($n);
    $x = $n % 10;
    if ($x == 0) {
        return $decenas[$n];
    } else return $decenas[$n - $x] . ' y ' . basico($x);
}

function centenas($n)
{
    $cientos = array(100 => 'CIEN', 200 => 'DOCIENTO', 300 => 'TRESIENTO',
        400 => 'CUATROCIENTOS', 500 => 'QUINIENTO', 600 => 'SEISCIENTO',
        700 => 'SETECIENTO', 800 => 'OCHOCIENTO', 900 => 'NOVECIENTO');
    if ($n >= 100) {
        if ($n % 100 == 0) {
            return $cientos[$n];
        } else {
            $u = (int)substr($n, 0, 1);
            $d = (int)substr($n, 1, 2);
            return (($u == 1) ? 'CIENTO' : $cientos[$u * 100]) . ' ' . decenas($d);
        }
    } else return decenas($n);
}

function miles($n)
{
    if ($n > 999) {
        if ($n == 1000) {
            return 'MIL ';
        } else {
            $l = strlen($n);
            $c = (int)substr($n, 0, $l - 3);
            $x = (int)substr($n, -3);
            if ($c == 1) {
                $cadena = 'MIL ' . centenas($x);
            } else if ($x != 0) {
                $cadena = centenas($c) . ' MIL ' . centenas($x);
            } else $cadena = centenas($c) . ' MIL ';
            return $cadena;
        }
    } else return centenas($n);
}

function millones($n)
{
    if ($n == 1000000) {
        return 'UN MILLON ';
    } else {
        $l = strlen($n);
        $c = (int)substr($n, 0, $l - 6);
        $x = (int)substr($n, -6);
        if ($c == 1) {
            $cadena = ' MILLON ';
        } else {
            $cadena = ' MILLONES ';
        }
        return miles($c) . $cadena . (($x > 0) ? miles($x) : '');
    }
}

function convertir($n)
{
    switch (true) {
        case ($n >= 1 && $n <= 29) :
            return basico($n);
            break;
        case ($n >= 30 && $n < 100) :
            return decenas($n);
            break;
        case ($n >= 100 && $n < 1000) :
            return centenas($n);
            break;
        case ($n >= 1000 && $n <= 999999):
            return miles($n);
            break;
        case ($n >= 1000000):
            return millones($n);
    }
}

function NumberBreakdown($number, $returnUnsigned = false)
{
    $negative = 1;
    if ($number < 0) {
        $negative = -1;
        $number *= -1;
    }

    if ($returnUnsigned) {
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

$key = $_GET["key"];
$indpago = $_GET["indpago"];
if ($_GET) {
    $resultado = datos_clientes::datos_credito_generale($key, $mysqli);
    $datos_cliete_generales = datos_clientes::datos_clientes_generales($resultado["indcliente"], $mysqli);
    $datos_generales_pago = datos_clientes::datos_credito_generale_pago($indpago, $mysqli);
}
?>
<!--<style type="text/css">-->
<!--    table {border-collapse: collapse}-->
<!--    td {border:1px solid black}-->
<!--</style>-->
<div style="margin-top: 4.5em!important;margin-left:18em">
    <p style="position: static!important; width: 30%!important;padding: 3px!important; font-size: 18px;margin-left:12em;" class="linea">
        <b><?php echo datos_clientes::fecha_get_pc(); ?></b></p>
</div>
<table style="height: 150px; width: 750px;">
    <tbody>
    <tr style="height: 5px;">
        <td style="width: 100%; height: 20px;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b
                    style="margin-left:3em;"><?php echo $datos_cliete_generales["nombre"] . " " . $datos_cliete_generales["apellido"]; ?></b>
        </td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;" colspan="2">&nbsp;</td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;" colspan="2">
            <b> <?php
                $n = $datos_generales_pago["pago"];
                $numero_conver = floor($n);
                $fraction = ($n - $numero_conver) * 10;

                if ($fraction == 0) {
                    echo convertir($numero_conver);
                } else {
                    echo convertir($numero_conver) . " " . $fraction . "/100";
                }

                ?> DOLARES
            </b></td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;" colspan="2">&nbsp;</td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;" colspan="2">&nbsp;</td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;" colspan="2"><b class="text-uppercase"><?php echo $datos_generales_pago["detalles_factura"]; ?> </b>
        </td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;" colspan="2">&nbsp;</td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;" colspan="2">&nbsp;</td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;">&nbsp;</td>
        <td style="width: 10px; font-size: 18px"  style="margin-left: 6em">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>$ <?php echo  number_format(( $datos_generales_pago["pago"]), 2, '.', ',');; ?></b></td>
    </tr>
    <tr style="height: 5px;">
        <td style="width: 100px; height: 20px;">&nbsp;</td>
        <td style="width: 10px;">&nbsp;</td>
    </tr>
    <tr style="height: 5px;" >
        <td style="width: 100px; height: 20px;">&nbsp;</td>
        <td style="width: 10px; font-size: 18px"  style="margin-left: 6em">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>$ <?php echo  number_format(( $datos_generales_pago["pago"]), 2, '.', ',');; ?></b></td>
    </tr>
    </tbody>
</table>
