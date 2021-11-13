<?php
$key = $_GET["key"];
session_start();
$indsucursal = $_SESSION["sucursal"];
include_once "./vendor/autoload.php";
use Dompdf\Dompdf;
$dompdf = new Dompdf();
ob_start();
include "imprimir_altamira.php";
$html = ob_get_clean();
$dompdf->loadHtml($html);
$dompdf->render();
header("Content-type: application/pdf");
header("Content-Disposition: inline; filename=documento.pdf");
echo $dompdf->output();
?>