<?php
include_once "../header/header_panel.php";
include_once "../BD-Connection/conection.php";
include_once "../BD-Connection/datos_clientes.php";
if ($_GET) {
    $temp = $_GET['indtemp'];
    $indcliente = $_GET['indcliente'];
    $res = datos_clientes::eliminar_credito($temp, $mysqli);
    echo '<script>
 swal({
   title: "Exito?",
   text: "Se a eliminado el credito",
   icon: "succesus",
   buttons: true,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="../credito.php?indcliente=' . $indcliente .'";
   }else {
     location.href="../credito.php?indcliente=' . $indcliente .'";
   }
 });
 </script>';
}
include_once "../header/footer_temporal.php";
