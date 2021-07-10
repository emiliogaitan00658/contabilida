<?php include "header/header.php";
session_start();
if($_SESSION){

}else{
  echo '<script>location.href="login.php";</script>';
}



if ($_POST) {
   $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));
   $apellido = strtoupper(filter_var($_POST['textapellido'], FILTER_SANITIZE_STRING));
   $sucursale = strtoupper(filter_var($_POST['textsucursal'], FILTER_SANITIZE_STRING));
   $cedula = strtoupper(filter_var($_POST['textcedula'], FILTER_SANITIZE_STRING));
   $direccion1 = strtoupper(filter_var($_POST['textdireccion1'], FILTER_SANITIZE_STRING));
   $direccion2 = strtoupper(filter_var($_POST['textdireccion2'], FILTER_SANITIZE_STRING));
   $telefono = strtoupper(filter_var($_POST['texttelefono'], FILTER_SANITIZE_STRING));

    $varficar_nombres = datos_clientes::verificar_nombre_apellido($nombre, $apellido, $mysqli);
    if ($varficar_nombres == false) {
        $indusuario=datos_clientes::generar_ind_cliente($mysqli);
        $recues=datos_clientes::nuevo_usuario($indusuario, $nombre, $direccion1,$direccion2, $cedula, $telefono, $sucursale, $apellido, $mysqli);
        if($recues==true){
            echo '<script>
 swal({
   title: "Exito ?",
   text: "Guardado Con Exito",
   icon: "success",
   buttons: true,

 })
 .then((willDelete) => {
   if (willDelete) {
     location.href="index.php";
   }else {
      location.href="index.php";
   }
 });
 </script>';
        }
    } else {
        echo '<script>
 swal({
   title: "Error ?",
   text: "Este Usuario Existe",
   icon: "error",
   buttons: false,

 })
 .then((willDelete) => {
   if (willDelete) {
     
   }else {
      
   }
 });
 </script>';

    }
}
?>

<div class="container z-depth-1 rounded white">
    <div class="modal-header white rounded">
        <h4 class="modal-title blue-grey-text unoem">Registro de Clientes Nuevos</h4>
    </div>
    <br>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <section class="row">
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Nombres: *</label>
                <input type="text" name="textnombre" class="form-control" value="<?php if ($_POST) {
                    echo $_POST['textnombre'];
                } ?>" placeholder="Nombres" required>
            </div>
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Apellidos: *</label>
                <input type="text" name="textapellido" class="form-control" value="<?php if ($_POST) {
                    echo $_POST['textapellido'];
                } ?>" placeholder="Apellidos" required>
            </div>
        </section>
        <br>
        <section class="row">
            <div class="control-pares col-md-3">
                <label>Seleccionar Sucursal: *</label>
                <select name="textsucursal" class="form-control" required>
                    <option class="form-control" value="" selected>Opcion Sucursal</option>
                    <option class="form-control" value="Managua">Managua</option>
                    <option class="form-control" value="Masaya">Masaya</option>
                    <option class="form-control" value="Chonrales">Chontales</option>
                    <option class="form-control" value="Esteli">Esteli</option>
                    <option class="form-control" value="Leon">Leon</option>
                    <option class="form-control" value="Matagalpa">Matagalpa</option>
                    <option class="form-control" value="Chinandega">Chinandega</option>
                    <option class="form-control" value="Managua Bolonia">Managua Bolonia</option>
                    <option class="form-control" value="Managua Villa Fontana">Managua Villa Fontana</option>
                </select>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Cedula Identidad: *</label>
                <input type="text" name="textcedula" class="form-control" value="<?php if ($_POST) {
                    echo $_POST['textcedula'];
                } ?>" placeholder="No Cedula" required>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Telefono: *</label>
                <input type="text" name="texttelefono" placeholder="Telefono"  class="form-control" value="<?php if ($_POST) {
                    echo $_POST['texttelefono'];
                } ?>" required>
            </div>
        </section>
        <br>
        <section class="row">
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Dirección 1: *</label>
                <input type="text" name="textdireccion1" class="form-control"  placeholder="Direccion de domicilio 1"
                       value="<?php if ($_POST) {
                           echo $_POST['textdireccion1'];
                       } ?>" required>
            </div>
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Dirección 2: *</label>
                <input type="text" name="textdireccion2" class="form-control"  placeholder="Direccion de domicilio 2"
                       value="<?php if ($_POST) {
                           echo $_POST['textdireccion2'];
                       } ?>">
            </div>
        </section>
        <br>
        <div class="modal-footer">
            <input type="submit" value="Nuevo Cliente" class="btn white-text blue-grey btn-primary"/>
        </div>
    </form>
</div>

<?php include "header/footer.php" ?>
