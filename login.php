<div style='background-image: url("assets/img/img23.png");
background-size: cover;
background-position: center;
height: 100vh;
width: 100%;'>
    <style>
        #esconder_menu{
            display: none;
        }
        #footer{
            display: none;
        }
    </style>
<?php
include "header/header.php";
if ($_POST) {
    $pass = filter_var($_POST['textpass'], FILTER_SANITIZE_STRING);
    $user = filter_var($_POST['textuser'], FILTER_SANITIZE_STRING);
    //session_start();
    $resul = datos_clientes::login_empleado($user, $pass, $mysqli);
    $resul_ind_empleado = datos_clientes::ind_empleado($user, $pass, $mysqli);
    if ($resul == "indsucursal") {
        echo '<script>
 swal({
   title: "Error ?",
   text: "Este Usuario No Existe",
   icon: "error",
   buttons: false,

 })
 .then((willDelete) => {
   if (willDelete) {
     
   }else {
      
   }
 });
 </script>';

    } else {
        if ($user == "root") {

        } else {
            $_SESSION["root"] = "true";
        }
        $_SESSION['sucursal'] = $resul;
        $_SESSION["Key"] = "";
        $_SESSION["RAX"] = "";
        $_SESSION["indempleado"] = $resul_ind_empleado;
        datos_clientes::historial_acceso("Login", $resul, $resul_ind_empleado, $mysqli);



        echo '<script>location.href="factura_dia";</script>';
        }

}
?>
<!--<div class="container z-depth-1">-->
<!--    <br>-->
<!--    <section class="container white rounded z-depth-1" style="padding: 2em">-->
<!--        <form action="--><?php //echo htmlspecialchars($_SERVER["PHP_SELF"]); ?><!--" method="post">-->
<!--            <section class="row">-->
<!--                <div class="control-pares col-md-5">-->
<!--                    <label for="" class="control-label">Usuario:</label>-->
<!--                    <input type="text" name="textuser" class="form-control" placeholder="Usuario" required>-->
<!--                </div>-->
<!--                <div class="control-pares col-md-5">-->
<!--                    <label for="" class="control-label">Contraseña:</label>-->
<!--                    <input type="password" name="textpass" class="form-control" placeholder="Contraseña" required>-->
<!--                </div>-->
<!--            </section>-->
<!--            <div class="modal-footer">-->
<!--                <input type="submit" value="Ingresar" class="btn white-text blue-grey btn-primary"/>-->
<!--            </div>-->
<!--        </form>-->
<!--    </section>-->
<!--</div>-->

    <style>
        .main-content{
            width: 50%;
            border-radius: 20px;
            box-shadow: 0 5px 5px rgba(0,0,0,.4);
            margin: 5em auto;
            display: flex;
        }
        .company__info{
            background-color: #008080;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: #fff;
        }
        .fa-android{
            font-size:3em;
        }
        @media screen and (max-width: 640px) {
            .main-content{width: 90%;}
            .company__info{
                display: none;
            }
            .login_form{
                border-top-left-radius:20px;
                border-bottom-left-radius:20px;
            }
        }
        @media screen and (min-width: 642px) and (max-width:800px){
            .main-content{width: 70%;}
        }
        .row > h2{
            color:#008080;
        }
        .login_form{
            background-color: #fff;
            border-top-right-radius:20px;
            border-bottom-right-radius:20px;
            border-top:1px solid #ccc;
            border-right:1px solid #ccc;
        }
        form{
            padding: 0 2em;
        }
        .form__input{
            width: 100%;
            border:0px solid transparent;
            border-radius: 0;
            border-bottom: 1px solid #aaa;
            padding: 1em .5em .5em;
            padding-left: 2em;
            outline:none;
            margin:1.5em auto;
            transition: all .5s ease;
        }
        .form__input:focus{
            border-bottom-color: #008080;
            box-shadow: 0 0 5px rgba(0,80,80,.4);
            border-radius: 4px;
        }
        .btn{
            transition: all .5s ease;
            width: 70%;
            border-radius: 30px;
            color:#008080;
            font-weight: 600;
            background-color: #fff;
            border: 1px solid #008080;
            margin-top: 1.5em;
            margin-bottom: 1em;
        }
        .btn:hover, .btn:focus{
            background-color: #008080;
            color:#fff;
        }
    </style>


    <!-- Main Content -->
    <div class="container-fluid" style="margin-top: 5em;">
        <div class="row main-content bg-success text-center">
            <div class="col-md-4 text-center company__info center-block">
                <h4 class="company_title center-align"><img src="093b747.png"  class="responsive-img" width="60%" alt=""></h4>
            </div>
            <div class="col-md-8 col-xs-12 col-sm-12 login_form ">
                <div class="container-fluid">
                    <div>
                        <br>
                        <h2>SISTEMA DE FACTURACIÒN</h2>
                        <hr>
                    </div>
                    <div>
                        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" class="form-group">
                            <div class="col-md-10">
                                <input  type="text" name="textuser" id="textuser" class="form__input" placeholder="USUARIO">
                            </div>
                            <div class="col-md-10">
                                <!-- <span class="fa fa-lock"></span> -->
                                <input type="password" name="textpass" id="textuserpass" class="form__input" placeholder="CONTRASEÑA">
                            </div>
                            <div>
                                <input type="submit" value="INGRESAR" class="btn">
                            </div>
                        </form>
                        <p class="center-align">Este sistema es creado Ing. Emilio Gaitán</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php include "header/footer.php" ?>
</div>