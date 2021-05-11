<div class="modal-header white rounded right">
    <h4 class="modal-title blue-grey-text unoem right"><i class="red-text"><b>No Factura:</b></i> <b><input
                type="text" class="form-control"
                value="<?php
                try {
                    if (!empty($_SESSION['sucursal'])) {
                        $indsucursal = $_SESSION['sucursal'];
                        echo datos_clientes::cambio_do($indsucursal, $mysqli);
                    }
                } catch (Exception $e) {

                }
                ?>">
        </b></h4>
</div><?php
