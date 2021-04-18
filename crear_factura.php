<?php include "header/header.php";

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

<div class="container z-depth-1 rounded white">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem"><i class="icon-user-plus" size="80%"></i> Registro de Clientes
            Nuevos</h4>
    </div>
    <br>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <section class="row">
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Nombres: *</label>
                <input type="text" name="textnombre" class="form-control"
                       value="<?php if (!empty($_POST['textnombre'])) {
                           echo $_POST['textnombre'];
                       } ?>" placeholder="Nombres" required>
            </div>
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Apellidos: *</label>
                <input type="text" name="textapellido" class="form-control"
                       value="<?php if (!empty($_POST['textapellido'])) {
                           echo $_POST['textapellido'];
                       } ?>" placeholder="Apellidos" required>
            </div>
        </section>
        <br>
        <div class="modal-footer">
            <input type="submit" value="Nuevo Cliente" class="btn white-text blue-grey btn-primary"/>
        </div>
    </form>
</div>

<?php include "header/footer.php" ?>

