<?php include "header/header.php";
if ($_POST){
    $pass=filter_var($_POST['textpass'], FILTER_SANITIZE_STRING);
    $user=filter_var($_POST['textuser'], FILTER_SANITIZE_STRING);

        //session_start();
        $resul=datos_clientes::login_empleado($user,$pass, $mysqli);
        if ($resul=="indsucursal"){
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

        }else{
            $_SESSION['sucursal']=$resul;
          echo '<script>location.href="factura_dia";</script>';
        }

    }
?>

<div class="container">
    <section class="container white rounded" style="padding: 1em">
        <form action="login.php" method="post">
            <section class="row">
                <div class="control-pares col-md-5">
                    <label for="" class="control-label">Usuario:</label>
                    <input type="text" name="textuser" class="form-control" placeholder="Usuario" required>
                </div>
                <div class="control-pares col-md-5">
                    <label for="" class="control-label">Contraseña:</label>
                    <input type="text" name="textpass" class="form-control" placeholder="Contraseña" required>
                </div>
            </section>
            <div class="modal-footer">
                <input type="submit" value="Ingresar" class="btn blue-grey btn-primary"/>
            </div>
        </form>
    </section>
</div>
<?php include "header/footer.php" ?>
