<?php include "header/header.php";
session_start();
if($_SESSION){

}else{
    echo '<script>location.href="login.php";</script>';
}
if ($_POST) {
    $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));
}
?>

<div class="container white rounded z-depth-1">
    <div style="padding: 1em">
        <h5>Buscardor de Clientes</h5>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <section class="row">
                <div class="control-pares col-md-4">
                    <input type="text" name="textnombre" class="form-control" placeholder="Buscar ....." required>
                </div>
                <div class="control-pares col-md-4">
                    <input type="submit" value="Buscar" class="btn white-text blue-grey btn-primary"/>
                </div>
            </section>
        </form>
    </div>
</div>
<hr>
<div class="container z-depth-1 rounded white">
    <table class="table table-borderless" style="padding: 1em;">
        <thead>
        <tr style="border-bottom: 1px solid black">
            <th scope="col"># ID</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Cedula</th>
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
                    <td><?php echo $resultado['cedula']; ?></td>
                    <td><?php echo $resultado['sucursal']; ?></td>
                    <td><a href="detaller_clientes.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                           class="btn btn-success">Detalles</a></td>
                    <td><a href="creditos.php?indcliente=<?php echo $resultado['indcliente']; ?>"
                           class="btn btn-primary">Creditos</a></td>
                </tr>
            <?php }

        } ?>

        </tbody>
    </table>
</div>
<?php include "header/footer.php" ?>
