<?php
include_once "../header/header_panel.php";
if ($_POST) {
    $nombre = strtoupper(filter_var($_POST['textnombre'], FILTER_SANITIZE_STRING));

    datos_clientes::registro_usuario_mysql($nombre, $apellido, $user, $pas, $sucursal, $mysqli);

    echo '<script> swal({
  title: "Usuario Registrado con exito?",
  text: "Exito",
  icon: "success",
  buttons: true,
  dangerMode: true,
})
.then((willDelete) => {
  if (willDelete) {
   location.href="crear_usuario.php";
  } else {
    location.href="crear_usuario.php";
  }
}); </script>';

}

?>
<br>
<div class="container white rounded z-depth-2" style="border-radius: 6px;">
    <div style="padding: 1em">
        <h5>Cambiar Taza de Cambio</h5>
        <p><span class="red-text"></span><i class="icon-stop red-text "></i> Solo Personal Autorizado</p>
        <p>La taza de cambio estara reflejada en cordobas</p>
        <hr>
        <br>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]) ?>"
              method="post">
            <section class="row">
                <div class="control-pares col-md-3">
                    <input type="text" name="textnombre" class="form-control center-align" placeholder="Cordobas"
                           value="<?php if ($_POST) {
                               echo $_POST["textnombre"];
                           } else {
                               echo $dolar;
                           } ?>" required>
                </div>
                <br>
                <br>
                <div class="control-pares col-md-4">
                    <input type="submit" value="Guardar" class="btn white-text blue-grey btn-primary"/>
                    <input type="button" onclick="regresar()" value="Cencelar" class="btn white-text red btn-primary"/>
                </div>
            </section>
        </form>
        <br>
        <br>
        <p>Nota: Autorizado por el personal adminstrativo de la
            plataforma.</p>
        <p>Contactar al ingeniero de la empresa</p>
        <br>
    </div>
</div>

<script>
    function regresar() {
        location.href = "../panel_control.php";
    }

</script>
<?php
include_once "../header/footer_temporal.php";
?>


