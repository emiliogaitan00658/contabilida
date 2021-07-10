<?php include "header/header.php";
session_start();
if($_SESSION){

}else{
    echo '<script>location.href="login.php";</script>';
}
if ($_GET) {
    $indcliente = $_GET['indcliente'];
} else {
    echo '<script> location.href="buscar_clientes.php" </script>';
}

if ($_POST) {
    $sucursale = strtoupper(filter_var($_POST['textsucursal'], FILTER_SANITIZE_STRING));
    $direccion1 = filter_var($_POST['textdireccion1'], FILTER_SANITIZE_STRING);
    $direccion2 = filter_var($_POST['textdireccion2'], FILTER_SANITIZE_STRING);
    $telefono = strtoupper(filter_var($_POST['texttelefono'], FILTER_SANITIZE_STRING));
    $recues = datos_clientes::datos_clientes_generales_actualizar($indcliente, $direccion1, $direccion2, $telefono, $sucursale, $mysqli);
    if ($recues == true) {
        echo '<script>
 swal({
   title: "Exito ?",
   text: "Datos Actualizado",
   icon: "success",
   buttons: true,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="detaller_clientes.php?indcliente='.$indcliente.'";
   }else {
     location.href="detaller_clientes.php?indcliente='.$indcliente.'";
   }
 });
 </script>';
    }
}
$datos = datos_clientes::datos_clientes_generales($indcliente, $mysqli);
?>

<div class="container z-depth-1 rounded white">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Detalles de Cliente</h4>
    </div>
    <br>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>?indcliente=<?php echo $indcliente;?>" method="post">
        <section class="row">
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Nombres: *</label>
                <input type="text" name="textnombre" disabled class="form-control"
                       value="<?php echo $datos['nombre']; ?>" placeholder="Nombres" required>
            </div>
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Apellidos: *</label>
                <input type="text" name="textapellido" disabled class="form-control"
                       value="<?php echo $datos['apellido']; ?>" placeholder="Apellidos" required>
            </div>
        </section>
        <br>
        <section class="row">
            <div class="control-pares col-md-3">
                <label>Seleccionar Sucursal: *</label>
                <select name="textsucursal" class="form-control text-uppercase text-lowercase" required>
                    <option class="form-control" value="<?php echo $datos['sucursal']; ?>"
                            selected><?php echo $datos['sucursal']; ?></option>
                    <option class="form-control" value="Managua">Managua</option>
                    <option class="form-control" value="Masaya">Masaya</option>
                    <option class="form-control" value="Chonrales">Chontales</option>
                    <option class="form-control" value="Esteli">Esteli</option>
                    <option class="form-control" value="Leon">Leon</option>
                    <option class="form-control" value="Matagalpa">Matagalpa</option>
                    <option class="form-control" value="Chinandega">Chinandega</option>
                    <option class="form-control" value="Managua Bolonia">Managua Bolonia</option>
                    <option class="form-control" value="Managua Bello Horizonte">Managua Bello Horizonte</option>
                </select>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Cedula Identidad: *</label>
                <input type="text" name="textcedula" disabled class="form-control"
                       value="<?php echo $datos['cedula']; ?>" placeholder="No Cedula" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Telefono: *</label>
                <input type="text" name="texttelefono" placeholder="Telefono" class="form-control"
                       value="<?php echo $datos['telefono']; ?>" required>
            </div>
        </section>
        <br>
        <section class="row">
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Dirección 1: *</label>
                <input type="text" name="textdireccion1" class="form-control" placeholder="Direccion de domicilio"
                       value="<?php echo $datos['direccion1']; ?>" required>
            </div>
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Dirección 2: *</label>
                <input type="text" name="textdireccion2" class="form-control" placeholder="Direccion de domicilio"
                       value="<?php echo $datos['direccion2']; ?>">
            </div>
        </section>
        <br>
        <div class="modal-footer">
            <input type="submit" value="Actualizar Datos" class="btn blue-grey btn-primary"/>
        </div>
    </form>
</div>


<?php include "header/footer.php" ?>
