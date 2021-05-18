<?php
$html = '
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Generate HTML to PDF</title>
	<style>
	*{text-align:center;}
	</style>
</head>
<body>	
	<table border="1" cellpadding="20" cellspacing="0" width="100%">
		<tr>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		<tr>
			<td width="15%" size="5px">ANELSAM-100</td>
			<td width="15%">1</td>
			<td>Computer Science & Engg.</td>
		</tr><tr>
			<td width="15%">ANELSAM-100</td>
			<td width="15%">1</td>
			<td>Computer Science & Engg.</td>
		</tr><tr>
			<td width="15%">ANELSAM-100</td>
			<td width="15%">1</td>
			<td>Computer Science & Engg.</td>
		</tr>
		
	</table>	
</body>
</html>';


require 'vendor/autoload.php';

use Dompdf\Dompdf;

$dompdf = new Dompdf();

$dompdf->loadHtml($html);

$dompdf->setPaper('A4', 'portrait');

$dompdf->render();

$dompdf->stream("playerofcode", array("Attachment" => 0));

?>