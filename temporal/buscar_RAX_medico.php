<?php include "../header/header_temporal.php";
include_once "../BD-Connection/conection.php";
include_once "../BD-Connection/datos_clientes.php";
session_start();
$nombre = "0";
if (!empty($_GET["key"])){
    $key = $_GET['key'];
    $_SESSION['keycookies'] = $key;
} else {
    $key = $_SESSION['keycookies'];
}
if (!empty($_POST["textnombre"])) {
    $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));
} else {
    $nombre = "0";
}


if (!empty($_GET["medico"])) {
    $indmedico = $_GET["medico"];
    datos_clientes::medico_rax($indmedico,$key, $mysqli);
    echo '  <script>  swal({
                title: "Exito",
                text: "Radiografia agregada",
                icon: "success",
                buttons: true,

            })
                .then((willDelete) => {
                    if (willDelete) {
                        location.href = "../factura_dia.php";
                    } else {
                        location.href = "../factura_dia.php";
                    }
                });    </script>';


}
?>
<br>
<div class="container white rounded z-depth-1">
    <div style="padding: 1em">
        <h5>Asignar radiografia al medico o empresa</h5>
        <p>buscar medico o empresa que le pertence esa radiografia (Si el cliente no esta registrado debe de registrar antes)</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <section class="row">
                <div class="control-pares col-md-4">
                    <input type="text" name="textnombre" class="form-control" placeholder="Buscar ....." required>
                </div>
                <div class="control-pares col-md-4">
                    <input type="submit" value="Buscar" class="btn  white-text blue-grey btn-primary"/>
                </div>
            </section>
        </form>
    </div>
    <p class="green-text">* Debe incluir a que doctor le remite esta radiografia es obligatorio registar</p>
</div>
<hr>
<div class="container z-depth-1 rounded white">
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col"># ID</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Sucursal</th>
            <th scope="col">Asignar</th>
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
                        if ($resultado['indsucursal'] == "1") {
                            echo "Managua";
                        }
                        if ($resultado['indsucursal'] == "2") {
                            echo "Masaya";
                        }
                        if ($resultado['indsucursal'] == "3") {
                            echo "Chontales";
                        }
                        if ($resultado['indsucursal'] == "6") {
                            echo "Esteli";
                        }
                        if ($resultado['indsucursal'] == "5") {
                            echo "Leon";
                        }
                        if ($resultado['indsucursal'] == "9") {
                            echo "Matagalpa";
                        }
                        if ($resultado['indsucursal'] == "4") {
                            echo "Chinandega";
                        }
                        if ($resultado['indsucursal'] == "7") {
                            echo "Managua Bolonia";
                        }
                        if ($resultado['indsucursal'] == "8") {
                            echo "Managua Villa Fontana";
                        }
                        if ($resultado['indsucursal'] == "10") {
                            echo "Clinica Dansing";
                        }
                        ?></td>
                    <td>
                        <a href="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]) . '?medico=' . $resultado['indcliente']; ?>"
                           class="btn btn-outline-info">asignar</a></td>
                </tr>
            <?php }

        } ?>

        </tbody>
    </table>
</div>
<?php include "../header/footer_temporal.php" ?>

