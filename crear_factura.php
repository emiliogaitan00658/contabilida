<?php include "header/header.php";
$indcliente = $_GET["indcliente"];
$row = datos_clientes::buscar($indcliente, $mysqli);
if (!$_SESSION) {
    echo '<script> location.href="login" </script>';
}

if ($_POST) {

    if (!empty($_POST['textnombre'])) {
        $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));
        $apellido = strtoupper(filter_var($_POST['textapellido'], FILTER_SANITIZE_STRING));
        $sucursale = strtoupper(filter_var($_POST['textsucursal'], FILTER_SANITIZE_STRING));
        $cedula = strtoupper(filter_var($_POST['textcedula'], FILTER_SANITIZE_STRING));
        $direccion1 = strtoupper(filter_var($_POST['textdireccion1'], FILTER_SANITIZE_STRING));
        $direccion2 = strtoupper(filter_var($_POST['textdireccion2'], FILTER_SANITIZE_STRING));
        $telefono = strtoupper(filter_var($_POST['texttelefono'], FILTER_SANITIZE_STRING));
    }
}
?>

<div class="container z-depth-1 rounded white center-block">
    <div class="modal-header white rounded right">
        <h4 class="modal-title blue-grey-text unoem right">Factura: <b><?php
                try {
                    if (!empty($_SESSION['sucursal'])) {
                        $indsucursal = $_SESSION['sucursal'];
                        echo datos_clientes::cambio_do($indsucursal, $mysqli);
                    }
                } catch (Exception $e) {

                }
                ?></b></h4>
    </div>
    <br>
    <br>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <section class="row">
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Nombres: *</label>
                <input type="text" name="textnombre" class="form-control"
                       value="<?php echo $row["nombre"] ?>" placeholder="Nombres" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Apellidos: *</label>
                <input type="text" name="textapellido" class="form-control"
                       value="<?php echo $row["apellido"] ?>" placeholder="Apellidos" required>
            </div>
            <div class="control-pares col-md-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                    <label class="form-check-label" for="flexCheckChecked">
                        Efectivo
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                    <label class="form-check-label" for="flexCheckChecked">
                        Targeta
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                    <label class="form-check-label" for="flexCheckChecked">
                        Credito
                    </label>
                </div>
            </div>

            <div class="control-pares col-md-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                        Cordobas
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                        Dolar
                    </label>
                </div>
            </div>
        </section>
        <br>
        <div class="modal-footer">
            <input type="submit" value="Nuevo Cliente" class="btn white-text blue-grey btn-primary"/>
        </div>
    </form>
</div>
<div class="container z-depth-1 rounded white">
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col"># ID</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Sucursal</th>
            <th scope="col">Detalles</th>
            <th scope="col">Creditos</th>
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
                        ?></td>
                    <td><a href="detaller_clientes.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                           class="btn btn-success">Detalles</a></td>
                    <td><a href="crear_factura.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                           class="btn btn-primary">Crear Factura</a></td>
                </tr>
            <?php }

        } ?>

        </tbody>
    </table>
</div>
<?php include "header/footer.php" ?>

