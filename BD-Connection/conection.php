<?php
/**
 * Created by PhpStorm.
 * User: Emilio-Gaitan
 * Date: 05/03/2020
 * Time: 03:38 PM
 */
$mysqli = new mysqli("localhost", "root", "", "contabilidad");
//$mysqli = new mysqli("mysql.hostinger.com", "u893429626_orthodentalsa", "@p2bH?Y8Y", "u893429626_prestamos");

if (mysqli_connect_errno()) {
    die("Error al conectar: " . mysqli_connect_error());
}
$mysqli->set_charset("utf8"); //Estableciendo utf8




