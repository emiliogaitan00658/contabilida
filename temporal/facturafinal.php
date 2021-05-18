<?php
include_once '../BD-Connection/conection.php';
include_once '../BD-Connection/datos_clientes.php';
session_start();
$Key = $_SESSION["Key"];
if ($_POST) {
    $check_value1 = isset($_POST['flexCheckCheckedcordoba']) ? 1 : 0;
    $check_value2 = isset($_POST['flexCheckCheckeddolar']) ? 1 : 0;
    $check_value3 = isset($_POST['flexCheckCheckedtraferencia']) ? 1 : 0;
    $check_value4 = isset($_POST['flexCheckCheckedlafise']) ? 1 : 0;
    $check_value4 = isset($_POST['flexCheckCheckedbac']) ? 1 : 0;
    $check_value5 = isset($_POST['flexCheckCheckedtargeta']) ? 1 : 0;
    $cordobas=$_POST['textcordobas'];
    $dolar=$_POST['textdolar'];
}