<?php include "header/header.php";
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
    $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));
    $apellido = strtoupper(filter_var($_POST['textapellido'], FILTER_SANITIZE_STRING));
    $cedula = $_POST['textcedula'];
    $direccion1 = filter_var($_POST['textdireccion1'], FILTER_SANITIZE_STRING);
    $direccion2 = filter_var($_POST['textdireccion2'], FILTER_SANITIZE_STRING);
    $telefono = strtoupper(filter_var($_POST['texttelefono'], FILTER_SANITIZE_STRING));
    $recues = datos_clientes::datos_clientes_generales_actualizar($indcliente,$nombre,$apellido,$cedula, $direccion1, $direccion2, $telefono, $sucursale, $mysqli);
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
                <label for="" class="control-label">Nombres o Empresa: *</label>
                <input type="text" name="textnombre" class="form-control"
                       value="<?php echo $datos['nombre']; ?>" placeholder="Nombres" required>
            </div>
            <div class="control-pares col-md-5">
                <label for="" class="control-label">Apellidos o No RUC: *</label>
                <input type="text" name="textapellido"  class="form-control"
                       value="<?php echo $datos['apellido']; ?>" placeholder="Apellidos" required>
            </div>
        </section>
        <br>
        <section class="row">
            <div class="control-pares col-md-3">
                <label>Seleccionar Sucursal: *</label>
                <select name="textsucursal" disabled class="form-control">
                    <option class="form-control" value="<?php
                    if($datos['indsucursal']=="Managua"){echo "Managua";}
                    if($datos['indsucursal']=="Masaya"){echo "2";}
                    if($datos['indsucursal']=="Chontales"){echo "3";}
                    if($datos['indsucursal']=="Esteli"){echo "6";}
                    if($datos['indsucursal']=="Leon"){echo "5";}
                    if($datos['indsucursal']=="Matagalpa"){echo "9";}
                    if($datos['indsucursal']=="Chinandega"){echo "4";}
                    if($datos['indsucursal']=="Managua Bolonia"){echo "7";}
                    if($datos['indsucursal']=="Managua Villa Fontana"){echo "8";}
                    if($datos['indsucursal']=="Clinica Dansing"){echo "10";}
                    ?>" selected hidden><?php
                    if($datos['indsucursal']=="1"){echo "Managua";}
                    if($datos['indsucursal']=="2"){echo "Masaya";}
                    if($datos['indsucursal']=="3"){echo "Chontales";}
                    if($datos['indsucursal']=="6"){echo "Esteli";}
                    if($datos['indsucursal']=="5"){echo "Leon";}
                    if($datos['indsucursal']=="9"){echo "Matagalpa";}
                    if($datos['indsucursal']=="4"){echo "Chinandega";}
                    if($datos['indsucursal']=="7"){echo "Managua Bolonia";}
                    if($datos['indsucursal']=="8"){echo "Managua Villa Fontana";}
                    if($datos['indsucursal']=="10"){echo "Clinica Dansing";}
                    ?></option>
                    <option class="form-control" value="1">Managua</option>
                    <option class="form-control" value="2">Masaya</option>
                    <option class="form-control" value="3">Chontales</option>
                    <option class="form-control" value="6">Esteli</option>
                    <option class="form-control" value="5">Leon</option>
                    <option class="form-control" value="9">Matagalpa</option>
                    <option class="form-control" value="4">Chinandega</option>
                    <option class="form-control" value="7">Managua Bolonia</option>
                    <option class="form-control" value="8">Managua Villa Fontana</option>
                    <option class="form-control" value="10">Clinica Dansing</option>
                </select>
            </div>
            <div class="control-pares col-md-3">
                <label for="" class="control-label">Cedula Identidad: *</label>
                <input type="text" name="textcedula" class="form-control"
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
            <a href="#" onclick="
                    var i='<?php echo $indcliente; ?>';
                    verficar_eliminar(i);" class="btn white-text red btn-primary">Eliminar usuario</a>
            <input type="submit" value="Actualizar Datos" class="btn white-text blue-grey btn-primary"/>
        </div>
    </form>
</div>

<script>
    function verficar_eliminar(codigo) {
        swal({
            title: "Eliminiar?",
            text: "Seguro de eliminiar cliente",
            icon: "success",
            buttons: true,

        })
            .then((willDelete) => {
                if (willDelete) {
                    location.href = "temporal/eliminar ?indcliente=" + codigo;
                } else {
                    location.href = "factura_dia.php";
                }
            });
    }
</script>
<?php include "header/footer.php" ?>
