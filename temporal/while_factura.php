<?php
include_once '../BD-Connection/conection.php';
session_start();
$Key=$_SESSION["Key"];

$result4 = $mysqli->query("SELECT * FROM `factura` WHERE factura.indtemp='$Key'");
$total_subtotal=0;
$total_descuento=0;
while ($resultado = $result4->fetch_assoc()) {
    if($resultado["descuento"]=="0"){
        $total_subtotal=$resultado["precio_total"]+$total_subtotal;
    }else{
        $total_descuento =$resultado["total_descuento"]+$total_descuento;
    }
}
echo $final_total=$total_subtotal+$total_descuento;
