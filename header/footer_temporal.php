<br>
<br>

<div class="footer-basic">
    <footer class="center-block center">
        <p class="copyright"><p>Derechos Reservado</p>
        <p class="copyright"><p>Creado por Ing. Emilio Gaitan <i class="green-text"><a href="https://contabilidad.orthodentalnic.com/derechos_resevado/propieedad_intelectual.pdf">end-user license agreement (EULA)</a></i> </p>
        <script>
            var fecha = new Date();
            var ano = fecha.getFullYear();
        </script>
        ©
        <script>document.write(ano); </script>
        </p>
    </footer>
</div>
</div>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

<script src="../assets/animate/dist/wow.js"></script>
<script>
    wow = new WOW(
        {
            animateClass: 'animated',
            offset:       100,
            callback:     function(box) {
                console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
            }
        }
    );
    wow.init();
    document.getElementById('moar').onclick = function() {
        var section = document.createElement('section');
        section.className = 'section--purple wow fadeInDown';
        this.parentNode.insertBefore(section, this);
    };
</script>
<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
<!--<script src="assets/js/jquery.min.js"></script>-->
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/js/chart.min.js"></script>
<script src="../assets/js/bs-init.js"></script>
<script src="../assets/js/jquery.easing.js"></script>
<script src="../assets/js/theme.js"></script>
</body>

</html>
