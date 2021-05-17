var nm1;
var nm2;
var nm3;
var nm4;
var nm5;
var nm6;
var nm7;
var nm8;
var nm9;
var nm10;

function suma1() {
    var cantidad = document.myapp.textcantidad1.value;
    var precio = document.myapp.texttotal1.value;
    var codigo = document.myapp.textcodigo1.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal1.value = dosdecimales(total);
            total_general_contable();
            descuento1();
        } else {
            document.myapp.textvalor1.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor1.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
}

function descuento1() {
    var total_sub = document.myapp.texttotal1.value;
    var descuento = document.myapp.textdescuento1.value;
    var codigo = document.myapp.textcodigo1.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm1 = dosdecimales(total);
            sumar_totoales_producto(codigo,descuento,total);
            sumar_totaldescuento_t(codigo);
            //document.myapp.textotal33.value = dosdecimales(total);
            descuento_fun(codigo, descuento)
        } else {
            //document.myapp.textotal33.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {

    }
}


////////////////////////////////////////////////////////////////////////////

function total_general_contable() {
    var enviar = "total";
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "temporal/get_total_factura.php");
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.send(enviar);

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var c = parseFloat(xhr.responseText);
            document.myapp.textsubtotal.value = dosdecimales(xhr.responseText);
            document.myapp.textotal33.value = dosdecimales(xhr.responseText);
        }
        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    }
}

///////////////////////////////////////////////////////////////////////////
