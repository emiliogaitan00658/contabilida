<?php
session_start();
if($_SESSION){

}else{
    echo '<script>location.href="login.php";</script>';
}
$cuotas = 12;
$monto = 600;
$fecha = "2020-06-30";



$contador = 0;
$contador_mes = 0;
$contador_anio = 0;



echo $d=date('d', strtotime($fecha));
echo "<br>";
echo $m=date('m', strtotime($fecha));
echo "<br>";
echo $y=date('Y', strtotime($fecha));
echo "<br>";
echo $m+1;
echo "<br>";
echo "<br>";
$pago_cuatos=$monto/$cuotas;
echo "<br>";

for ($i = 1; $i <= $cuotas; $i++) {
    echo $pago_cuatos;
    $m=$m+1;
    if($m==12){
        $m=1;
        $y=$y+1;
    }
    echo "//".$d."//".$m."//".$y;


    echo "<br>";
    $contador++;
}
?>

