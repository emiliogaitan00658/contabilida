<?php include "header/header.php";
if (!$_SESSION){
    echo '<script> location.href="login" </script>';
}

if($_SESSION["Key"]==""){

}else{
    echo '<script> location.href="crear_factura.php" </script>';
}

if (!empty($_POST["textnombre"])) {
    $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));
}else{
    $nombre ="0";
}
?>
<div class="container white rounded z-depth-1" style="border-radius: 6px;">
    <div style="padding: 1em">
        <h5>Buscardor de Clientes</h5>
        <hr>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <section class="row">
                <div class="control-pares col-md-4">
                    <input type="text" name="textnombre" class="form-control mr-sm-2" type="search" placeholder="Buscar cliente o Empresa ....."  aria-label="Search" required>
                </div>
                <div class="control-pares col-md-4">
                    <input type="submit" value="Buscar" class="btn  white-text blue-grey btn-primary"/>
                </div>
            </section>
        </form>
        <hr>
        <a class="btn btn-dark blue-grey right" href="index" style="margin-left:1em!important; "><i class="icon-user-plus white-text"></i> Nuevo Cliente</a>
        <br>
        <br>
    </div>
</div>
<br>
<div class="container z-depth-1 rounded white">
    <table class="table table-hover" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col"># ID</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Sucursal</th>
            <th scope="col">No Deudas</th>
            <th scope="col">Detalles</th>
            <th scope="col">Crear Factura</th>
        </tr>
        </thead>
        <tbody>
        <?php
        if ($_POST) {
            $result4 = $mysqli->query("SELECT * FROM clientes 
         WHERE nombre LIKE _utf8  '%%$nombre%%' 
         OR apellido LIKE _utf8  '%%$nombre%%' ORDER BY nombre");
            while ($resultado = $result4->fetch_assoc()) {
                ?>
                <tr>
                    <th scope="row"><?php echo $resultado['indcliente']; ?></th>
                    <td><?php echo $resultado['nombre']; ?></td>
                    <td><?php echo $resultado['apellido']; ?></td>
                    <td><?php
                        if($resultado['indsucursal']=="1"){echo "Managua";}
                        if($resultado['indsucursal']=="2"){echo "Masaya";}
                        if($resultado['indsucursal']=="3"){echo "Chontales";}
                        if($resultado['indsucursal']=="6"){echo "Esteli";}
                        if($resultado['indsucursal']=="5"){echo "Leon";}
                        if($resultado['indsucursal']=="9"){echo "Matagalpa";}
                        if($resultado['indsucursal']=="4"){echo "Chinandega";}
                        if($resultado['indsucursal']=="7"){echo "Managua Bolonia";}
                        if($resultado['indsucursal']=="8"){echo "Managua Villa Fontana";}
                        if($resultado['indsucursal']=="10"){echo "Clinica Dansing";}
                        ?></td>
                    <td class="btn-link center-align  center-block"><a href="credito.php?indcliente=<?php echo $resultado['indcliente']; ?>"><?php echo datos_clientes::conteo_cuentas_pagar($resultado['indcliente'],$mysqli);?></a></td>
                    <td><a href="detaller_clientes.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                           class="btn btn-success">Detalles</a></td>
                    <td><a href="temporal/indcliente.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                           class="btn btn-primary">Crear Factura</a></td>
                </tr>
            <?php }

        } ?>

        </tbody>
    </table>
</div>
<?php include "header/footer.php" ?>
