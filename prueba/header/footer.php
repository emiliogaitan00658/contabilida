<br>
<br>

<div class="footer-basic">
    <footer class="center-block center">
        <p class="copyright"><p>Derechos Reservado ORTHODENTAL S.A </p>
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


<script src="assets/animate/dist/wow.js"></script>
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
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/jquery.easing.js"></script>
<script src="assets/js/theme.js"></script>
</body>

</html>
