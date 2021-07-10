<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ORTHO DENTAL S.A</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/cssindex.css">
    <link rel="stylesheet" href="assets/icomoon/style.css">

    <link rel="stylesheet" href="assets/bootstrap/jquery-ui.css">
    <script src="assets/js/jquery-1.12.4.js"></script>
    <script src="assets/js/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">

    <link rel="stylesheet" href="assets/animate/css/libs/animate.css">


    <script src="assets/sweetalert/sweetalert.min.js"></script>
    <script src="assets/jquery-expander/jquery.expander.min.js"></script>
</head>

<body style="background-color: rgb(247,247,249)" id="page-top">
<?php
include_once 'BD-Connection/conection.php';
include_once 'BD-Connection/datos_clientes.php';
?>

<div class="white rounded container-fluid">
   <div style="padding: 1em " class="container">
       <ul class="nav nav-tabs">
           <li class="nav-item">
               <a class="nav-link" href="index">Registro Clientes</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="buscar_clientes">Buscar Clientes</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="pagos_mora">Pagos Mes</a>
           </li>
           <li class="nav-item">
               <a class="nav-link btn-success white-text" href="cerrar_seccion">Cerrar Sección</a>
           </li>
       </ul>
   </div>
</div>
<br>