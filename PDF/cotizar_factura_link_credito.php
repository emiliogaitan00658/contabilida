<?php
$key=$_GET["key"];
$pregunta=$_GET["dolar"];
include_once "./vendor/autoload.php";
use Dompdf\Dompdf;
$dompdf = new Dompdf();
ob_start();
include "cotizar_factura_page_credito.php";
$html = ob_get_clean();
$dompdf->loadHtml($html);
$dompdf->render();
header("Content-type: application/pdf");
header("Content-Disposition: inline; filename=documento.pdf");
echo $dompdf->output();
?>