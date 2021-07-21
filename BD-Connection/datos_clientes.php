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


    public static function datos_clientes_generales_actualizar($indcliente, $direccion1, $direccion2, $telefono, $sucursale, $mysqli)
    {
        $insert1 = "UPDATE `clientes`
SET `direccion1` = '$direccion1 ', `direccion2` = '$direccion2', `telefono` = '$telefono ', `indsucursal` = '$sucursale' WHERE `clientes`.`indcliente` = '$indcliente';";
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
VALUES (NULL, '$indsucursal', '$indcliente', NULL, '$monto', '$cuotas', '$inicio', '1', '$prima', '$key');";


        $query = mysqli_query($mysqli, $insert1);


        $fecha = $inicio;
        $bandera = 0;

        $d = date('d', strtotime($fecha));
        $m = date('m', strtotime($fecha));
        $y = date('Y', strtotime($fecha));
        $m + 1;

        $pago_cu = $monto / $cuotas;
        $pago_cuatos = round($pago_cu, 2);

        for ($i = 1; $i <= $cuotas; $i++) {
            if ($i == $cuotas) {
                $bandera = 1;
            }
            $bandera;
            $m = $m + 1;
            if ($m > 12) {
                $m = 1;
                $y = $y + 1;
            }

            if (checkdate($m, $d, $y)) {
                $date = $y . "-" . $m . "-" . $d;
            } else {
                $date = $y . "-" . $m . "-" . "1";
            }
            $result = $mysqli->query("SELECT * FROM `credito` WHERE indtemp='$key'");
            $row = $result->fetch_array(MYSQLI_ASSOC);

            $indcredito = $row["indcredito"];

            $insert1 = "INSERT INTO `creditos_pago` (`indpago`, `indcredito`, `indfactura`, `pago`, `fechapago`, `status`, `bandera`, `indsucursal`, `indtemp`)
                   VALUES (NULL, '$indcredito', null, '$pago_cuatos', '$date', 'false', '$bandera', '$indsucursal', '$key');";
            $query = mysqli_query($mysqli, $insert1);
        }
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
        if ($_SESSION['sucursal'] == "1") {
            return "Managua";
        }
        if ($_SESSION['sucursal'] == "2") {
            return "Masaya";
        }
        if ($_SESSION['sucursal'] == "3") {
            return "Chontales";
        }
        if ($_SESSION['sucursal'] == "6") {
            return "Esteli";
        }
        if ($_SESSION['sucursal'] == "5") {
            return "Leon";
        }
        if ($_SESSION['sucursal'] == "9") {
            return "Matagalpa";
        }
        if ($_SESSION['sucursal'] == "4") {
            return "Chinandega";
        }
        if ($_SESSION['sucursal'] == "7") {
            return "Managua Bolonia";
        }
        if ($_SESSION['sucursal'] == "8") {
            return "Managua Villa Fontana";
        }
        return 0;
    }

    public static function cambio_talonario($indsucursal, $notalonario, $mysqli)
    {
        $insert = "UPDATE `talonario` SET `numero` = '$notalonario' WHERE `talonario`.`indsucursal` = '$indsucursal';";
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
        $result = $mysqli->query("SELECT COUNT(status) as suma FROM `credito` WHERE indcliente='$indcliente' and status=1 ORDER by indcliente");
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
            return $res=sumatotal_factursa_subfactura($key, $mysqli);
        }
    }
    public static function nombre_paciente_rax($indsucursal,$mysqli)
    {
        $result = $mysqli->query("SELECT total FROM `total_factura` WHERE indtemp='$key'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3["total"];
        }
        return "No existe este usuario";
    }


    public static function buscar_producto($indproducto,$mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `producto` WHERE indproducto='$indproducto'");
        $row3 = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row3)) {
            return $row3;
        }
        return "";
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
    public static function eliminar_producto_lista($indproducto,$mysqli)
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

    public static function rax_cliente_doctor($RAX,$indcliente,$Key,$sucursal,$mysqli)
    {
        $fecha=self::fecha_get_pc_MYSQL();
        $hora=self::hora_get_pc();
        $nombre_completo=self::nombre_apellido_cliente($indcliente,$mysqli);
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

    public static function control_ingreso_facturar($sucursal,$detalle,$Key,$mysqli)
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

    public static function Factura_genera_codigo($key, $talonario, $indsucursal, $mysqli)
    {
        $insert = "UPDATE `factura` SET `indtalonario` = '$talonario' WHERE `factura`.`indtemp` ='$key'";
        $query = mysqli_query($mysqli, $insert);

        $insert2 = "UPDATE `total_factura` SET `indtalonario` = '$talonario' WHERE `total_factura`.`indtemp` = '$key'";
        $query = mysqli_query($mysqli, $insert2);

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

    public static function cambio_dato_producto($indproducto,$producto,$precio1,$precio2,$precio3,$mysqli)
    {
        $hora = self::hora_get_pc();
        $fecha = self::fecha_get_pc_MYSQL();
        $insert = "UPDATE `producto` SET `nombre_producto` = '$producto', `precio1` = '$precio1', `precio2` = '$precio2', `precio3` = '$precio3'
WHERE `producto`.`indproducto` = '$indproducto'";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }
}
