<?php include "header/header.php";
if ($_POST){
    $pass=$_POST['textpass'];
    $user=$_POST['textuser'];

    if($pass=="orthodental2018" && $user=="orthodental2018"){
        session_start();
        $_SESSION['user']=$user;
        echo '<script>location.href="index.php";</script>';
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
