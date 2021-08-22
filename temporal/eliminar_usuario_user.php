<?php
include_once "../header/header_temporal.php";
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
echo $induser = $_GET["induser"];
datos_clientes::eliminar_user_acceso($induser, $mysqli);
echo '<script>
 location.href="crear_usuario.php"; 
 </script>';
