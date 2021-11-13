<?php

class Password
{
    const SALT = 'EstoEsUnSalt';

    public static function hash($password)
    {
        return hash('sha512', self::SALT . $password);
    }

    public static function verify($password, $hash)
    {
        return ($hash == self::hash($password));
    }
}


class incriptar
{
    public static function hash_inscriptar($valor)
    {
        $clave = 'Una cadena, muy, muy larga para mejorar la encriptacion';
        $method = 'aes-256-cbc';
        $iv = base64_decode("C9fBxl1EWtYTL1/M8jfstw==");

        return openssl_encrypt($valor, $method, $clave, false, $iv);
    }

    public static function hash_desencriptar($valor)
    {
        $clave = 'Una cadena, muy, muy larga para mejorar la encriptacion';
        $method = 'aes-256-cbc';
        $iv = base64_decode("C9fBxl1EWtYTL1/M8jfstw==");
        $encrypted_data = base64_decode($valor);
        return openssl_decrypt($valor, $method, $clave, false, $iv);

    }
}


class datos_clientes
{
    public static function fecha_get_pc()
    {
        date_default_timezone_set('America/Managua');
        $fecha = date("j-n-Y");
        return $fecha;
    }

    public static function fecha_get_pc_formulario()
    {
        date_default_timezone_set('America/Managua');
        $fecha = date("j/n/Y");
        return $fecha;
    }

    public static function traforma_fecha($fecha)
    {
        $timestamp = strtotime($fecha);
        return date('d/m/Y', $timestamp);
    }

    public static function fecha_get_pc_MYSQL()
    {
        date_default_timezone_set('America/Managua');
        $fecha = date("Y-n-j");
        return $fecha;
    }

    public static function hora_get_pc()
    {
        date_default_timezone_set('America/Managua');
        $hora = date("h:i:s");
        return $hora;
    }

    public static function generar_ind_cliente($mysqli)
    {
        $result = $mysqli->query("SELECT COUNT(indcliente) as contador FROM `clientes`");
        $row = $result->fetch_array(MYSQLI_ASSOC);

        if (!empty($row)) {
            $pinunico = $row['contador'];
            $pin = $pinunico + 1;
            return $pin;
        }

        return 0;
    }

    public static function generar_ind_cuota_pago($mysqli)
    {
        $result = $mysqli->query("SELECT COUNT(indcredito) as contador FROM `credito`");
        $row = $result->fetch_array(MYSQLI_ASSOC);

        if (!empty($row)) {
            $pinunico = $row['contador'];
            $pin = $pinunico + 1;
            return $pin;
        }

        return 0;
    }

    public static function verificar_nombre_apellido($nombre, $apellido, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `clientes` WHERE nombre='$nombre' and apellido='$apellido'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return true;
        }
        return false;
    }

    public static function buscador_usuario($buscar, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM clientes 
         WHERE nombre LIKE _utf8  '%$buscar%' 
         AND apellidos LIKE _utf8  '%$buscar%' ORDER BY nombre");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row;
        }
        return false;
    }


    public static function datos_clientes_generales($indcliente, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `clientes` WHERE indcliente='$indcliente'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row;
        }
        return false;
    }


    public static function datos_clientes_moras($indcredito, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `credito` WHERE indcredito='$indcredito'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row['indcliente'];
        }
        return false;
    }

    public static function datos_clientes_generales_dadd($indcliente, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `clientes` WHERE indcliente='$indcliente'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row;
        }
        return false;
    }


    public static function datos_clientes_generales_actualizar($indcliente, $nombre, $apellido, $cedula, $direccion1, $direccion2, $telefono, $sucursale, $mysqli)
    {
        $insert1 = "UPDATE `clientes` SET `nombre` = '$nombre', `apellido` = '$apellido', `direccion1` = '$direccion1', `direccion2` = '$direccion2', `cedula` = '$cedula', `telefono` = '$telefono' WHERE `clientes`.`indcliente` = '$indcliente';";
        $query = mysqli_query($mysqli, $insert1);
        return true;
    }


    public static function pago_actualizar($indcredito, $factura, $fecha, $mysqli)
    {
        $insert1 = "UPDATE `creditos_pago` SET `indfactura` = '$factura',status='true' WHERE creditos_pago.indcredito = '$indcredito' AND fechapago='$fecha'";
        $query = mysqli_query($mysqli, $insert1);
        return true;
    }


    public static function nuevo_usuario($indusuario, $nombre, $direccion1, $direccion2, $cedula, $telefono, $sucursale, $apellido, $mysqli)
    {
        $insert1 = "INSERT INTO `clientes` (`indcliente`, `nombre`, `apellido`, `direccion1`, `direccion2`, `cedula`, `telefono`, `indsucursal`, `status`) 
VALUES ( '$indusuario', '$nombre', '$apellido', '$direccion1', '$direccion2', '$cedula', '$telefono', '$sucursale', '1');";
        $query = mysqli_query($mysqli, $insert1);
        return true;
    }

    public static function nuevo_credito($indcliente, $indsucursal, $key, $inicio, $monto, $cuotas, $prima, $mysqli)
    {

        $insert1 = "INSERT INTO `credito` (`indcredito`, `indsucursal`, `indcliente`, `producto`, `totalCredito`, `numeroCuotas`, `fechaInicio`, `status`, `prima`, `indtemp`) 
VALUES (NULL, '$indsucursal', '$indcliente', NULL, '$monto','', '$inicio', '1', '', '$key');";

        $result = $mysqli->query("SELECT * FROM `credito` WHERE indtemp='$key'");
        $row = $result->fetch_array(MYSQLI_ASSOC);

        $query = mysqli_query($mysqli, $insert1);


//        $query = mysqli_query($mysqli, $insert1);
//
//
//        $fecha = $inicio;
//        $bandera = 0;
//
//        $d = date('d', strtotime($fecha));
//        $m = date('m', strtotime($fecha));
//        $y = date('Y', strtotime($fecha));
//        $m + 1;
//
//        $pago_cu = $monto / $cuotas;
//        $pago_cuatos = round($pago_cu, 2);
//
//        for ($i = 1; $i <= $cuotas; $i++) {
//            if ($i == $cuotas) {
//                $bandera = 1;
//            }
//            $bandera;
//            $m = $m + 1;
//            if ($m > 12) {
//                $m = 1;
//                $y = $y + 1;
//            }
//
//            if (checkdate($m, $d, $y)) {
//                $date = $y . "-" . $m . "-" . $d;
//            } else {
//                $date = $y . "-" . $m . "-" . "1";
//            }
//            $result = $mysqli->query("SELECT * FROM `credito` WHERE indtemp='$key'");
//            $row = $result->fetch_array(MYSQLI_ASSOC);
//
//            $indcredito = $row["indcredito"];
//
//            $insert1 = "INSERT INTO `creditos_pago` (`indpago`, `indcredito`, `indfactura`, `pago`, `fechapago`, `status`, `bandera`, `indsucursal`, `detalles`, `indtemp`)
//                   VALUES (NULL, '$indcredito', null, '$pago_cuatos', '$date', 'false', '$bandera', '$indsucursal', '00000', '$key');";
//            $query = mysqli_query($mysqli, $insert1);
//        }
        return true;
    }

    public static function login_empleado($user, $pass, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `empleado` WHERE `user` = '$user' AND `pass` = '$pass'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row["indsucursal"];
        } else {
            return "indsucursal";
        }
        return "indsucursal";
    }

    public static function ind_empleado($user, $pass, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `empleado` WHERE `user` = '$user' AND `pass` = '$pass'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row["indempleado"];
        } else {
            return "indsucursal";
        }
        return "indsucursal";
    }

    public static function cambio_dolar($mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `tasa`");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row["dolar"];
        } else {
            return "error";
        }
    }

    public static function cambio_do($indsucursal, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `talonario` WHERE `indsucursal` = '$indsucursal'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row["numero"];
        } else {
            return "error";
        }
    }
    public static function total_deuda_faltante($indtemp,$mysqli)
    {
        $result = $mysqli->query("SELECT SUM(pago) as total FROM `creditos_pago` WHERE indtemp= '$indtemp'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row["total"];
        } else {
            return "error";
        }
    }
    public static function total_deuda_faltante22($indtemp,$mysqli)
    {
        $result = $mysqli->query("SELECT SUM(pago) as total FROM `creditos_pago` WHERE indcredito= '$indtemp'");
        $row = $result->fetch_array(MYSQLI_ASSOC);

        $result2 = $mysqli->query("SELECT totalCredito FROM `credito` WHERE indcredito= '$indtemp'");
        $row2= $result2->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row2["totalCredito"]-$row["total"];
        } else {
            return "error";
        }
    }

    public static function buscar($indclientes, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `clientes` WHERE indcliente= '$indclientes'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row;
        } else {
            return "error";
        }
    }

    public static function nombre_apellido_cliente($indcliente, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `clientes` WHERE  indcliente='$indcliente'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row["nombre"] . " " . $row["apellido"];
        } else {
            return "error";
        }
    }

    public static function nombre_sucursal($indsucursal)
    {
        if ($indsucursal == "1") {
            return "Managua";
        }
        if ($indsucursal == "2") {
            return "Masaya";
        }
        if ($indsucursal == "3") {
            return "Chontales";
        }
        if ($indsucursal == "6") {
            return "Esteli";
        }
        if ($indsucursal == "5") {
            return "Leon";
        }
        if ($indsucursal == "9") {
            return "Matagalpa";
        }
        if ($indsucursal == "4") {
            return "Chinandega";
        }
        if ($indsucursal == "7") {
            return "Managua Bolonia";
        }
        if ($indsucursal == "8") {
            return "Managua Villa Fontana";
        }
        if ($indsucursal == "10") {
            return "Clinica Managua";
        }
        return 0;
    }

    public static function nombre_sucursal_ind($indsucursal)
    {
        if ($indsucursal == "1") {
            return "Managua";
        }
        if ($indsucursal == "2") {
            return "Masaya";
        }
        if ($indsucursal == "3") {
            return "Chontales";
        }
        if ($indsucursal == "6") {
            return "Esteli";
        }
        if ($indsucursal == "5") {
            return "Leon";
        }
        if ($indsucursal == "9") {
            return "Matagalpa";
        }
        if ($indsucursal == "4") {
            return "Chinandega";
        }
        if ($indsucursal == "7") {
            return "Managua Bolonia";
        }
        if ($indsucursal == "8") {
            return "Managua Villa Fontana";
        }
        if ($indsucursal == "10") {
            return "Clinica Managua";
        }
        return 0;
    }

    public static function cambio_talonario($indsucursal, $notalonario, $mysqli)
    {
        $insert = "UPDATE `talonario` SET `numero` = '$notalonario' WHERE `talonario`.`indsucursal` = '$indsucursal';";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }
    public static function bandera_credito_cancelado($indtemp,$mysqli)
    {
        $insert = "UPDATE `credito` SET `status` = '0' WHERE `credito`.`indtemp` = '$indtemp';";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function cambio_numero_factura($key, $indtalonario, $mysqli)
    {
        $insert1 = "UPDATE `control` SET `indfactura` = '$indtalonario' WHERE `control`.`indtemp` = '$key'";
        $query = mysqli_query($mysqli, $insert1);
        $insert = "UPDATE `total_factura` SET `indtalonario` = '$indtalonario' WHERE `total_factura`.`indtemp` ='$key'";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function Verificar_generador_codigo($mysqli)
    {
        $longitud = 100;
        $key = '';
        $pattern = '1234567890abcdefghijklmnopqrstuvwxyz';
        $max = strlen($pattern) - 1;
        for ($i = 0; $i < $longitud; $i++) $key .= $pattern{mt_rand(0, $max)};

        $result = $mysqli->query(" SELECT * FROM `factura` WHERE indtemp='$key'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return "true";
            self::Verificar_generador_codigo($mysqli);
        } else {
            return $key;
        }
    }

    public static function verificar_producto_factura($indtemp, $indproducto, $mysqli)
    {
        $result = $mysqli->query(" SELECT * FROM `factura` WHERE factura.indtemp='$indtemp' AND factura.codigo_producto='$indproducto'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return "true";
        } else {
            return "false";
        }
    }


    public static function conteo_cuentas_pagar($indcliente, $mysqli)
    {
        $result = $mysqli->query("SELECT COUNT(credito.status) as suma FROM `credito` LEFT JOIN `creditos_pago` ON `creditos_pago`.`indcredito`= `credito`.`indcredito` WHERE indcliente='$indcliente' and credito.status=1 and credito.producto >1 ORDER BY indcliente");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["suma"];
        } else {
            return "0";
        }
    }

    public static function sumatotal_factura_total($key, $mysqli)
    {
        $result = $mysqli->query("SELECT total FROM `total_factura` WHERE indtemp='$key'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["total"];
        } else {
            return $res = sumatotal_factursa_subfactura($key, $mysqli);
        }
    }

    public static function nombre_paciente_rax($indsucursal, $mysqli)
    {
        $result = $mysqli->query("SELECT total FROM `total_factura` WHERE indtemp='$key'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["total"];
        }
        return "No existe este usuario";
    }


    public static function cierre_cordobas($fecha1, $fecha2, $indsucursal, $mysqli)
    {
        $result = $mysqli->query("SELECT SUM(cordoba_pago) as total FROM `total_factura` WHERE fecha BETWEEN '$fecha1' AND '$fecha2' AND indsucursal='$indsucursal' AND bandera='1'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["total"];
        }
        return "No existe este usuario";
    }

    public static function cierre_dolar($fecha1, $fecha2, $indsucursal, $mysqli)
    {
        $result = $mysqli->query("SELECT SUM(dolare_pago) as total FROM `total_factura` WHERE fecha BETWEEN '$fecha1' AND '$fecha2' AND indsucursal='$indsucursal' AND bandera='1'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["total"];
        }
        return "No existe este usuario";
    }

    public static function tipo_factura_RAX($indtalonario, $sucursal, $mysqli)
    {
        //RAX
        //$result = $mysqli->query("SELECT tipocontrol FROM `control` WHERE indsucursal='' and indfactura='$indtalonario'");
        $result = $mysqli->query("SELECT codigo_producto FROM `factura` WHERE indtalonario=$indtalonario and indsucursal='$sucursal'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            $temp = $row3["codigo_producto"];
            //echo var_dump(strpos("$temp", 'RAX'));
            if (strpos("$temp", 'RAX') !== false) {
                return "RX";
            } else {
                return "";
            }
        }
        return "";
    }

    public static function buscar_producto($indproducto, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `producto` WHERE indproducto='$indproducto'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "";
    }

    public static function nombre_empleado($indempleado,$mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `empleado` WHERE indempleado='$indempleado'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["nombre_empleado"]." ".$row3["apellido_empleado"];
        }
        return "";
    }
    public static function datos_empleado($indempleado,$mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `empleado` WHERE indempleado='$indempleado'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "";
    }

    public static function buscar_producto_codigo_producto($indproducto, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `producto` WHERE codigo_producto='$indproducto'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "";
    }

    public static function datos_factura_general_subtotal($Key, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `total_factura` WHERE indtemp='$Key'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "";
    }

    public static function verificar_codigo_exitente($codigo, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `producto` WHERE codigo_producto='$codigo'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "0";
    }

    public static function datos_generales_factura($indtemp, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `factura` WHERE indtemp='$indtemp'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "error";
    }

    public static function datos_generales_factura_talonario($indtalonario, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `factura` WHERE indtalonario='$indtalonario'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "error";
    }

    public static function datos_generales_talonario($key, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `total_factura` WHERE indtemp='$key'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "error";
    }

    public static function numero_retencion_exite($numero_recibo, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `retencion` WHERE norecibo='$numero_recibo'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "error";
    }

    public static function recibo_repetido($numero_recibo, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `retencion` WHERE norecibo='$numero_recibo'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "error";
    }

    public static function ultima_factura_no($indsucursal, $fecha1, $fecha2, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `total_factura` WHERE indsucursal='$indsucursal' and bandera='1' and indtalonario IS NOT NULL and (fecha BETWEEN '$fecha1' and '$fecha2') order by indtalonario desc limit 1");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["indtalonario"];
        }
        return "0";
    }
    public static function ultima_factura_credito($indsucursal, $fecha1, $fecha2, $mysqli)
    {
        //$result = $mysqli->query(" IS NOT NULL and (fecha BETWEEN '$fecha1' and '$fecha2') order by indtalonario desc limit 1");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["indtalonario"];
        }
        return "0";
    }

    public static function primera_factura_no($indsucursal, $fecha1, $fecha2, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `total_factura` WHERE indsucursal='$indsucursal' and bandera='1' and indtalonario IS NOT NULL and (fecha BETWEEN '$fecha1' and '$fecha2') order by indtalonario asc limit 1");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["indtalonario"];
        }
        return "0";
    }

    public static function conteo_factura($indsucursal, $fecha1, $fecha2, $mysqli)
    {
        $result = $mysqli->query("SELECT count(indtalonario) as conteo FROM `total_factura` WHERE indsucursal='$indsucursal' and bandera='1' and indtalonario IS NOT NULL and (fecha BETWEEN '$fecha1' and '$fecha2') order by indtalonario asc limit 1");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["conteo"];
        }
        return "0";
    }

    public static function busqueda_alerta($i, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `total_factura` WHERE indtalonario='$i'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return "1";
        }
        return "0";
    }

    public static function suma_total_venta_contador($indsucursal, $fecha1, $fecha2, $mysqli)
    {
        $result = $mysqli->query("SELECT count(indtalonario) as conteo FROM `total_factura` WHERE indsucursal='$indsucursal' and bandera='1' and indtalonario IS NOT NULL and (fecha BETWEEN '$fecha1' and '$fecha2') order by indtalonario asc limit 1");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["conteo"];
        }
        return "0";
    }

    public static function dos_decimales($total)
    {
        $total_decimal = number_format($total, 2, '.', ',');
        return $total_decimal;
    }

    public static function suma_total_venta_contado_totales($indsucursal, $fecha1, $fecha2, $mysqli)
    {
        $result = $mysqli->query("SELECT sum(total) as suma FROM `total_factura` WHERE indsucursal='$indsucursal' and bandera='1' and credito='0' and indtalonario IS NOT NULL and (fecha BETWEEN '$fecha1' and '$fecha2')");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["suma"];
        }
        return "0";
    }

    public static function suma_total_venta_credito_totales($indsucursal, $fecha1, $fecha2, $mysqli)
    {
        $result = $mysqli->query("SELECT sum(total) as suma FROM `total_factura` WHERE indsucursal='$indsucursal' and bandera='1' and credito='1' and indtalonario IS NOT NULL and (fecha BETWEEN '$fecha1' and '$fecha2')");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["suma"];
        }
        return "0";
    }

    public static function total_suma_contador($indsucursal, $fecha1, $fecha2, $mysqli)
    {
        $result = $mysqli->query("SELECT sum(total) as suma FROM `total_factura` WHERE indsucursal='$indsucursal' and bandera='1' and credito='0' and indtalonario IS NOT NULL and (fecha BETWEEN '$fecha1' and '$fecha2')");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        $result1 = $mysqli->query("SELECT sum(total) as suma FROM `total_factura` WHERE indsucursal='$indsucursal' and bandera='1' and credito='1' and indtalonario IS NOT NULL and (fecha BETWEEN '$fecha1' and '$fecha2')");
        $row4 = $result1->fetch_array(MYSQLI_ASSOC);
        $suma = $row3["suma"] + $row4["suma"];
        return $suma;
    }

    /* Creacion dela factura todos los datos integrados */

    public static function facturagenerada_filtro1($indtemp, $dolar, $indsucursal, $precio, $producto, $indproducto, $mysqli)
    {
        $precio_cordobas = $dolar * $precio;
        $indcliente = $_SESSION["indcliente"];
        $insert = "INSERT INTO `factura` (`indfactura`, `indtalonario`, `codigo_producto`, `nombre_producto`, `unidad`, `precio_unidad`, `precio_total`, `cordoba`, `descuento`,`total_descuento`, `bandera`, `indcliente`, `indsucursal`, `anular`, `indtemp`) 
VALUES (NULL, NULL, '$indproducto', '$producto','1','$precio_cordobas','$precio_cordobas', '$dolar', '', '' , '0','$indcliente', '$indsucursal', '', '$indtemp');";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function eliminar_producto_factura($indproducto, $key, $mysqli)
    {
        $insert = "DELETE FROM `factura` WHERE `factura`.`indtemp` = '$key' AND codigo_producto='$indproducto'";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function eliminar_producto_lista($indproducto, $mysqli)
    {
        $insert = "DELETE FROM `producto` WHERE `producto`.`indproducto` = '$indproducto'";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function eliminar_todo_factura($key, $mysqli)
    {
        $insert = "DELETE FROM `factura` WHERE `factura`.`indtemp` = '$key'";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function rax_cliente_doctor($RAX, $indcliente, $Key, $sucursal, $mysqli)
    {
        $fecha = self::fecha_get_pc_MYSQL();
        $hora = self::hora_get_pc();
        $nombre_completo = self::nombre_apellido_cliente($indcliente, $mysqli);
        $insert = "INSERT INTO `radiografia_conteo` (`indconteo`, `indcliente`, `nombre_completo`, `indsucursal`, `indtemp`, `factura`, `fecha`, `hora`) VALUES
         (NULL, '$RAX', '$nombre_completo', '$sucursal', '$Key', '', '$fecha', '$hora');";

        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function sumatotal_factursa($key, $mysqli)
    {
        $result4 = $mysqli->query("SELECT * FROM `factura` WHERE factura.indtemp='$key'");
        $total_subtotal = 0;
        $total_descuento = 0;
        while ($resultado = $result4->fetch_assoc()) {
            if ($resultado["descuento"] == "0") {
                $total_subtotal = $resultado["precio_total"] + $total_subtotal;
            } else {
                $total_descuento = $resultado["total_descuento"] + $total_descuento;
            }
        }
        return $final_total = $total_subtotal + $total_descuento;
    }


    public static function sumatotal_subtotal($key, $mysqli)
    {
        $result4 = $mysqli->query("SELECT * FROM `factura` WHERE factura.indtemp='$key'");
        $total_subtotal = 0;
        while ($resultado = $result4->fetch_assoc()) {
            $total_subtotal = $resultado["precio_total"] + $total_subtotal;
        }
        $total_subtotal;
        return $total_subtotal;
    }

    public static function sumatotal_factursa_subfactura($key, $mysqli)
    {
        $result4 = $mysqli->query("SELECT * FROM `factura` WHERE factura.indtemp='$key'");
        $total_subtotal = 0;
        while ($resultado = $result4->fetch_assoc()) {
            $total_subtotal = $resultado["precio_total"] + $total_subtotal;
        }
        $final_total = $total_subtotal;
        return $final_total;
    }

    public static function cambio_factura_update($Key, $codigo_producto, $total, $precio, $mysqli)
    {
        $insert = "UPDATE `factura` SET `unidad` = '$total' WHERE `factura`.`indtemp` = '$Key' and factura.codigo_producto='$codigo_producto'";
        $query = mysqli_query($mysqli, $insert);

        $total_actual = ($total * $precio);
        $insert = "UPDATE `factura` SET `precio_total` = '$total_actual' WHERE `factura`.`indtemp` = '$Key' and factura.codigo_producto='$codigo_producto'";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function descuento_update($Key, $codigo, $descuento, $descuento_total, $mysqli)
    {
        $insert = "UPDATE `factura` SET `descuento` = '$descuento' WHERE `factura`.`indtemp` = '$Key' and factura.codigo_producto='$codigo'";
        $query = mysqli_query($mysqli, $insert);

        $insert1 = "UPDATE `factura` SET `total_descuento` = '$descuento_total' WHERE `factura`.`indtemp` = '$Key' and factura.codigo_producto='$codigo'";
        $query = mysqli_query($mysqli, $insert1);

        return true;
    }


    public static function facturafinal($Key, $sucursal, $check_credito, $indcliente, $check_cordoba, $check_dolar, $check_tras, $check_efect, $check_fise, $check_bac, $check_targeta,
                                        $cordobas, $dolar, $subtotalF, $totalF, $mysqli)
    {
        $fecha = self::fecha_get_pc_MYSQL();
        $hora = self::hora_get_pc();

        $result = $mysqli->query("SELECT * FROM `total_factura` WHERE `indtemp` LIKE '$Key'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return false;
        } else {
            $insert = "INSERT INTO `total_factura` (`indtotalfactura`, `indcliente`, `indsucursal`, `indtalonario`, `subtotal`, `total`, `cordoba_pago`, 
                             `dolare_pago`, `cordoba`, `dolar`, `efectivo`, `credito`, `trasferencia`, `targeta`, `bac`, `lafise`, `fecha`, `hora`, `indtemp`, `bandera`)
 VALUES (NULL, '$indcliente','$sucursal', NULL, '$subtotalF', '$totalF', '$cordobas', '$dolar', '$check_cordoba', '$check_dolar', '$check_efect', '$check_credito', '$check_tras', '$check_targeta', '$check_bac', '$check_fise', '$fecha', '$hora', '$Key', '1');";
            $query = mysqli_query($mysqli, $insert);
            return true;
        }
    }

    public static function anular_factura($key, $mysqli)
    {
        $insert = "UPDATE `total_factura` SET `bandera` = '0' WHERE `total_factura`.`indtemp` ='$key'";
        $query = mysqli_query($mysqli, $insert);


        $insert2 = "UPDATE `control` SET `anulado` = '1' WHERE `control`.`indtemp` = '$key'";
        $query = mysqli_query($mysqli, $insert2);
        return true;
    }

    public static function control_ingreso_facturar($sucursal, $detalle, $Key, $mysqli)
    {
        $fecha = self::fecha_get_pc_MYSQL();
        $hora = self::hora_get_pc();
        $insert = "INSERT INTO `control` (`indcontrol`, `indfactura`, `indsucursal`, `indtemp`, `tipocontrol`, `fecha`, `hora`, `anulado`) VALUES 
                            (NULL, NULL, '$sucursal', '$Key', '$detalle', '$fecha', '$hora', '0');";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function update_Control_factura($talonario, $key, $mysqli)
    {
        $insert = "UPDATE `control` SET `indfactura` = '$talonario' WHERE `control`.`indtemp` ='$key' ;";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function agregar_dato_producto($codigo, $producto, $precio1, $precio2, $precio3, $mysqli)
    {

        $fecha = self::fecha_get_pc_MYSQL();
        $insert = "INSERT INTO `producto` (`indproducto`, `codigo_producto`, `nombre_producto`, `precio1`, `precio2`, `precio3`, `fecha_vencimiento`, `bandera`)
                  VALUES (NULL, '$codigo', '$producto', '$precio1', '$precio2', '$precio3', '$fecha', '1');";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function Factura_genera_codigo($key, $talonario, $indsucursal, $mysqli)
    {
        $fecha = self::fecha_get_pc_MYSQL();
        $hora = self::hora_get_pc();
        $insert = "UPDATE `factura` SET `indtalonario` = '$talonario' WHERE `factura`.`indtemp` ='$key'";
        $query = mysqli_query($mysqli, $insert);

        $insert4 = "UPDATE `total_factura` SET `fecha` = '$fecha' WHERE `total_factura`.`indtemp` = '$key'";
        $query = mysqli_query($mysqli, $insert4);

        $insert5 = "UPDATE `total_factura` SET `hora` = '$hora' WHERE `total_factura`.`indtemp` = '$key'";
        $query = mysqli_query($mysqli, $insert5);

        $insert2 = "UPDATE `total_factura` SET `indtalonario` = '$talonario' WHERE `total_factura`.`indtemp` = '$key'";
        $query = mysqli_query($mysqli, $insert2);

        $insert6 = "UPDATE `credito` SET `producto` = '$talonario' WHERE `credito`.`indtemp` = '$key'";
        $query = mysqli_query($mysqli, $insert6);

        $talonario_nuevo = $talonario + 1;
        $insert3 = "UPDATE `talonario` SET `numero` = '$talonario_nuevo' WHERE `talonario`.`indsucursal` = '$indsucursal'";
        $query = mysqli_query($mysqli, $insert3);
        return true;
    }

    public static function get_fecha_faltante($key, $indsucursal, $mysqli)
    {
        $result = $mysqli->query("SELECT  DATE_FORMAT(fecha, '%d/%m/%Y') as fecha3,fecha FROM `total_factura` where indtemp='$key' and indsucursal='$indsucursal'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        } else {
            return "false";
        }
    }

    public static function verficiar_talonario($key, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `total_factura` WHERE total_factura.indtemp='$key'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        } else {
            return "false";
        }
    }

    public static function entregar_matariales_bandera($indfactura, $bandera, $mysqli)
    {
        $insert = "UPDATE `factura` SET `bandera` = '$bandera' WHERE `factura`.`indfactura` = '$indfactura'";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function historial_acceso($descripcion, $indcliente, $indsucursal, $mysqli)
    {
        $hora = self::hora_get_pc();
        $fecha = self::fecha_get_pc_MYSQL();
        $insert = "INSERT INTO `historial_acceso` (`indacceso`, `descripcion_acceso`, `ip_acceso`, `fecha`, `hora`, `indsucursal`, `indempleado`) 
VALUES (NULL, 'acceso', '127.0.0.1', '$fecha', '$hora', '1', '1');";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function cambio_dato_producto($indproducto, $producto, $precio1, $precio2, $precio3, $mysqli)
    {
        $hora = self::hora_get_pc();
        $fecha = self::fecha_get_pc_MYSQL();
        $insert = "UPDATE `producto` SET `nombre_producto` = '$producto', `precio1` = '$precio1', `precio2` = '$precio2', `precio3` = '$precio3'
WHERE `producto`.`indproducto` = '$indproducto'";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function registro_usuario_mysql($nombre, $apellido, $user, $pas, $sucursal, $mysqli)
    {

        $insert = "INSERT INTO `empleado` (`indempleado`, `nombre_empleado`, `apellido_empleado`, `user`, `pass`, `indsucursal`) 
VALUES (NULL, '$nombre', '$apellido', '$user', '$pas', '$sucursal');";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

    public static function eliminar_todo_las_factura($key, $mysqli)
    {
        $insert1 = "DELETE FROM `control` WHERE `control`.`indtemp` ='$key' ";
        $insert2 = "DELETE FROM `factura` WHERE `factura`.`indtemp` ='$key' ";
        $insert3 = "DELETE FROM `total_factura` WHERE `total_factura`.`indtemp` ='$key' ";
        $query = mysqli_query($mysqli, $insert1);
        $query = mysqli_query($mysqli, $insert2);
        $query = mysqli_query($mysqli, $insert3);



        $insert5 = "DELETE FROM `credito` WHERE `credito`.`indtemp`='$key' ";
        $insert4 = "DELETE FROM `creditos_pago` WHERE `creditos_pago`.`indtemp` ='$key' ";

        $query = mysqli_query($mysqli, $insert4);
        $query = mysqli_query($mysqli, $insert5);

        return true;
    }

    public static function eliminar_user_acceso($induser, $mysqli)
    {
        $insert1 = "DELETE FROM `empleado` WHERE `empleado`.`indempleado`='$induser' ";
        $query = mysqli_query($mysqli, $insert1);
        return true;
    }

    public static function eliminar_cuenta_cliente($indcliente, $mysqli)
    {
        $insert1 = "DELETE FROM `clientes` WHERE `clientes`.`indcliente` = '$indcliente' ";
        $query = mysqli_query($mysqli, $insert1);

        return true;
    }


    public static function eliminar_credito($temp,$mysqli)
    {
        $insert1 = "DELETE FROM `creditos_pago` WHERE `creditos_pago`.`indtemp` ='$temp' ";
        $query = mysqli_query($mysqli, $insert1);

        $insert2 = "DELETE FROM `credito` WHERE `credito`.`indtemp` ='$temp' ";
        $query = mysqli_query($mysqli, $insert2);
        return true;
    }


    public static function medico_rax($indmedico, $key, $mysqli)
    {
        $insert1 = "UPDATE `radiografia_conteo` SET `indcliente` = '$indmedico' WHERE `radiografia_conteo`.`indtemp` ='$key' ";
        $query = mysqli_query($mysqli, $insert1);
        return true;
    }

    public static function eliminar_indtalonario($temp, $mysqli)
    {
        $insert1 = "DELETE FROM `total_factura` WHERE `total_factura`.`indtemp` ='$temp' ";
        $query = mysqli_query($mysqli, $insert1);
        $insert1 = "DELETE FROM `control` WHERE `control`.`indtemp` ='$temp' ";
        $query = mysqli_query($mysqli, $insert1);
        return true;
    }


    public static function ingresar_retencion($key, $numero_recibo, $subtotal, $indtotalfactura, $sucursal, $porsentaje, $indtalonario, $mysqli)
    {
        $fecha = self::fecha_get_pc_MYSQL();
        $hora = self::hora_get_pc();
        $datos_factura = self::datos_generales_talonario($key, $mysqli);
        $cliente = $datos_factura['indcliente'];

        $insert1 = "INSERT INTO `retencion` (`indretencion`, `indcliente`, `indsucursal`, `indtotalfactura`, `indcontrol`, `norecibo`, `fecha`, `hora`, `bandera`, `indtemp`, `subtotal`, `porsentaje`) 
VALUES (NULL, '$cliente', '$sucursal', '$indtotalfactura', '$indtalonario', '$numero_recibo', '$fecha', '$hora', '1', '$key', '$subtotal', '$porsentaje');";
        $query = mysqli_query($mysqli, $insert1);
        return true;
    }
}
