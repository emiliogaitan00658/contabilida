<?php
$key = $_GET["key"];
session_start();
$indsucursal = $_SESSION["sucursal"];
include_once "./vendor/autoload.php";
use Dompdf\Dompdf;
$dompdf = new Dompdf();
ob_start();

if ($indsucursal == "1") {
    include "imprimir_factura.php";
} else if ($indsucursal == "2") {
    include "imprimir_masaya.php";
}else if ($indsucursal == "3") {
    include "imprimir_juigalpa.php";
}else if ($indsucursal == "4") {
    include "factura_chinandega.php";
} else {
    include "imprimir_factura.php";
}

$html = ob_get_clean();
$dompdf->loadHtml($html);
$dompdf->render();
header("Content-type: application/pdf");
header("Content-Disposition: inline; filename=documento.pdf");
echo $dompdf->output();
?>