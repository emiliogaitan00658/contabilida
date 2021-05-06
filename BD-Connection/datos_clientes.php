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


    public static function pago_actualizar($indcredito,$factura, $fecha, $mysqli)
    {
        $insert1 = "UPDATE `creditos_pago` SET `indfactura` = '$factura',status='true' WHERE creditos_pago.indcredito = '$indcredito' AND fechapago='$fecha'";
        $query = mysqli_query($mysqli, $insert1);
        return true;
    }


    public static function nuevo_usuario($indusuario, $nombre,  $direccion1,$direccion2, $cedula, $telefono, $sucursale, $apellido, $mysqli)
    {
        $insert1 = "INSERT INTO `clientes` (`indcliente`, `nombre`, `apellido`, `direccion1`, `direccion2`, `cedula`, `telefono`, `indsucursal`, `status`) 
VALUES ( '$indusuario', '$nombre', '$apellido', '$direccion1', '$direccion2', '$cedula', '$telefono', '$sucursale', '1');";
        $query = mysqli_query($mysqli, $insert1);
        return true;
    }

    public static function nuevo_credito($indcliente, $producto, $inicio, $monto, $cuotas, $prima, $mysqli)
    {
        $indcredito = self::generar_ind_cuota_pago($mysqli);

        $insert1 = "INSERT INTO `credito` (`indcredito`, `indcliente`, `producto`, `totalCredito`, `numeroCuotas`, `fechaInicio`, `status`, `prima`) 
VALUES ('$indcredito' , '$indcliente,', '$producto', '$monto', '$cuotas', '$inicio', 'true', $prima);";
        $query = mysqli_query($mysqli, $insert1);

        $fecha = $inicio;
        $bandera = 0;

        $d = date('d', strtotime($fecha));
        $m = date('m', strtotime($fecha));
        $y = date('Y', strtotime($fecha));
        $m + 1;

        $pago_cu = $monto / $cuotas;
        $pago_cuatos= round($pago_cu, 2);

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

            $insert1 = "INSERT INTO `creditos_pago` (`indpago`, `indcredito`, `indfactura`, `pago`, `fechapago`, `status`, `bandera`)
                   VALUES (NULL, '$indcredito', null, '$pago_cuatos', '$date', 'false', '$bandera');";
            $query = mysqli_query($mysqli, $insert1);
        }
        return true;
    }

    public static function login_empleado($user,$pass, $mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `empleado` WHERE `user` = '$user' AND `pass` = '$pass'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row["indsucursal"];
        }else{
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
        }else{
            return "error";
        }
    }
    public static function cambio_do($indsucursal,$mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `talonario` WHERE `indsucursal` = '$indsucursal'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row["numero"];
        }else{
            return "error";
        }
    }
    public static function buscar($indclientes,$mysqli)
    {
        $result = $mysqli->query("SELECT * FROM `clientes` WHERE indcliente= '$indclientes'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row;
        }else{
            return "error";
        }
    }
    public static function nombre_apellido_cliente($indcliente,$indsucursal,$mysqli)
    {
        $result = $mysqli->query("SELECT *  FROM `clientes` WHERE  indsucursal= '$indsucursal'");
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            return $row["nombre"]. $row["apellido"];
        }else{
            return "error";
        }
    }

    public static function nombre_sucursal($indsucursal)
    {
        if ($_SESSION['sucursal'] == "1") {
            return "Managua";
        }
        if ($_SESSION['sucursal'] == "2") {
            return  "Masaya";
        }
        if ($_SESSION['sucursal'] == "3") {
            return  "Chontales";
        }
        if ($_SESSION['sucursal'] == "6") {
            return  "Esteli";
        }
        if ($_SESSION['sucursal'] == "5") {
            return  "Leon";
        }
        if ($_SESSION['sucursal'] == "9") {
            return  "Matagalpa";
        }
        if ($_SESSION['sucursal'] == "4") {
            return  "Chinandega";
        }
        if ($_SESSION['sucursal'] == "7") {
            return  "Managua Bolonia";
        }
        if ($_SESSION['sucursal'] == "8") {
            return  "Managua Villa Fontana";
        }
        return 0;
    }

    public static function cambio_talonario($indsucursal,$notalonario,$mysqli)
    {
        $indsucursal;
        $notalonario;
        $insert = "UPDATE `talonario` SET `numero` = '$notalonario' WHERE `talonario`.`indtalonario` = '$indsucursal';";
        $query = mysqli_query($mysqli, $insert);
        return true;
    }

}
