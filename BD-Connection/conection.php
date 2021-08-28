<?php
/**
 * Created by PhpStorm.
 * User: Emilio-Gaitan
 * Date: 05/03/2020
 * Time: 03:38 PM
 */
$mysqli = new mysqli("localhost", "root", "", "contabilidad");
//$mysqli = new mysqli("mysql.hostinger.com", "u893429626_contable", ">iXeZlC5", "u893429626_contabilidad");

if (mysqli_connect_errno()) {
    die("Error al conectar: " . mysqli_connect_error());
}
$mysqli->set_charset("utf8"); //Estableciendo utf8




