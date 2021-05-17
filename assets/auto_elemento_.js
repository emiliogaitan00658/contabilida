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
    var precio = document.myapp.textprecio1.value;
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
    descuento1();
    total_general_subtotal();
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
    total_general_subtotal();
}

////222222
function suma2() {
    var cantidad = document.myapp.textcantidad2.value;
    var precio = document.myapp.textprecio2.value;
    var codigo = document.myapp.textcodigo2.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal2.value = dosdecimales(total);
            total_general_contable();
            descuento2();
        } else {
            document.myapp.textvalor2.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor2.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
    descuento2();
    total_general_subtotal();
}

function descuento2() {
    var total_sub = document.myapp.texttotal2.value;
    var descuento = document.myapp.textdescuento2.value;
    var codigo = document.myapp.textcodigo2.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm2 = dosdecimales(total);
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
    total_general_subtotal();
}

///3333

function suma3() {
    var cantidad = document.myapp.textcantidad3.value;
    var precio = document.myapp.textprecio3.value;
    var codigo = document.myapp.textcodigo3.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal3.value = dosdecimales(total);
            total_general_contable();
            descuento3();
        } else {
            document.myapp.textvalor3.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor3.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
    descuento3();
    total_general_subtotal();
}

function descuento3() {
    var total_sub = document.myapp.texttotal3.value;
    var descuento = document.myapp.textdescuento3.value;
    var codigo = document.myapp.textcodigo3.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm3 = dosdecimales(total);
            sumar_totoales_producto(codigo,descuento,total);
            sumar_totaldescuento_t(codigo);
            descuento_fun(codigo, descuento)
        } else {
            //document.myapp.textotal33.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {

    }
    total_general_subtotal();
}
////////4444
function suma4() {
    var cantidad = document.myapp.textcantidad4.value;
    var precio = document.myapp.textprecio4.value;
    var codigo = document.myapp.textcodigo4.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal4.value = dosdecimales(total);
            total_general_contable();
            descuento4();
        } else {
            document.myapp.textvalor4.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor4.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
    descuento4();
    total_general_subtotal();
}

function descuento4() {
    var total_sub = document.myapp.texttotal4.value;
    var descuento = document.myapp.textdescuento4.value;
    var codigo = document.myapp.textcodigo4.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm4 = dosdecimales(total);
            sumar_totoales_producto(codigo,descuento,total);
            sumar_totaldescuento_t(codigo);
            descuento_fun(codigo, descuento)
        } else {
            //document.myapp.textotal33.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {

    }
    total_general_subtotal();
}
////5
function suma5() {
    var cantidad = document.myapp.textcantidad5.value;
    var precio = document.myapp.textprecio5.value;
    var codigo = document.myapp.textcodigo5.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal5.value = dosdecimales(total);
            total_general_contable();
            descuento5();
        } else {
            document.myapp.textvalor5.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor5.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
    descuento5();
    total_general_subtotal();
}

function descuento5() {
    var total_sub = document.myapp.texttotal5.value;
    var descuento = document.myapp.textdescuento5.value;
    var codigo = document.myapp.textcodigo5.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm5 = dosdecimales(total);
            sumar_totoales_producto(codigo,descuento,total);
            sumar_totaldescuento_t(codigo);
            descuento_fun(codigo, descuento)
        } else {
            //document.myapp.textotal33.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {

    }
    total_general_subtotal();
}
/////6666666
function suma6() {
    var cantidad = document.myapp.textcantidad6.value;
    var precio = document.myapp.textprecio6.value;
    var codigo = document.myapp.textcodigo6.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal6.value = dosdecimales(total);
            total_general_contable();
            descuento6();
        } else {
            document.myapp.textvalor6.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor6.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
    descuento6();
    total_general_subtotal();
}

function descuento6() {
    var total_sub = document.myapp.texttotal6.value;
    var descuento = document.myapp.textdescuento6.value;
    var codigo = document.myapp.textcodigo6.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm6 = dosdecimales(total);
            sumar_totoales_producto(codigo,descuento,total);
            sumar_totaldescuento_t(codigo);
            descuento_fun(codigo, descuento)
        } else {
            //document.myapp.textotal33.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {

    }
    total_general_subtotal();
}
///77777777
function suma7() {
    var cantidad = document.myapp.textcantidad7.value;
    var precio = document.myapp.textprecio7.value;
    var codigo = document.myapp.textcodigo7.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal7.value = dosdecimales(total);
            total_general_contable();
            descuento7();
        } else {
            document.myapp.textvalor7.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor7.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
    descuento7();
    total_general_subtotal();
}

function descuento7() {
    var total_sub = document.myapp.texttotal7.value;
    var descuento = document.myapp.textdescuento7.value;
    var codigo = document.myapp.textcodigo7.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm7 = dosdecimales(total);
            sumar_totoales_producto(codigo,descuento,total);
            sumar_totaldescuento_t(codigo);
            descuento_fun(codigo, descuento)
        } else {
            //document.myapp.textotal33.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {

    }
    total_general_subtotal();
}

////888888888888888888883
function suma8() {
    var cantidad = document.myapp.textcantidad8.value;
    var precio = document.myapp.textprecio8.value;
    var codigo = document.myapp.textcodigo8.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal8.value = dosdecimales(total);
            total_general_contable();
            descuento8();
        } else {
            document.myapp.textvalor8.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor8.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
    descuento8();
    total_general_subtotal();
}

function descuento8() {
    var total_sub = document.myapp.texttotal8.value;
    var descuento = document.myapp.textdescuento8.value;
    var codigo = document.myapp.textcodigo8.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm8 = dosdecimales(total);
            sumar_totoales_producto(codigo,descuento,total);
            sumar_totaldescuento_t(codigo);
            descuento_fun(codigo, descuento)
        } else {
            //document.myapp.textotal33.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {

    }
    total_general_subtotal();
}
////////////////99999

function suma9() {
    var cantidad = document.myapp.textcantidad9.value;
    var precio = document.myapp.textprecio9.value;
    var codigo = document.myapp.textcodigo9.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal9.value = dosdecimales(total);
            total_general_contable();
            descuento9();
        } else {
            document.myapp.textvalor9.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor9.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
    descuento9();
    total_general_subtotal();
}

function descuento9() {
    var total_sub = document.myapp.texttotal9.value;
    var descuento = document.myapp.textdescuento9.value;
    var codigo = document.myapp.textcodigo9.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm9 = dosdecimales(total);
            sumar_totoales_producto(codigo,descuento,total);
            sumar_totaldescuento_t(codigo);
            descuento_fun(codigo, descuento)
        } else {
            //document.myapp.textotal33.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {

    }
    total_general_subtotal();
}
///10
function suma10() {
    var cantidad = document.myapp.textcantidad10.value;
    var precio = document.myapp.textprecio10.value;
    var codigo = document.myapp.textcodigo10.value;
    var total;
    try {
        if (parseInt(cantidad)) {
            total = cantidad * precio;
            document.myapp.texttotal10.value = dosdecimales(total);
            total_general_contable();
            descuento6();
        } else {
            document.myapp.textvalor10.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {
        document.myapp.textvalor10.value = "";
    }
    enviar(cantidad, codigo, precio);
    total_general_contable();
    descuento10();
    total_general_subtotal();
}

function descuento10() {
    var total_sub = document.myapp.texttotal10.value;
    var descuento = document.myapp.textdescuento10.value;
    var codigo = document.myapp.textcodigo10.value;
    try {
        if (parseInt(total_sub)) {
            var total_descuento = total_sub * (descuento / 100);
            var total = total_sub - total_descuento;
            nm10 = dosdecimales(total);
            sumar_totoales_producto(codigo,descuento,total);
            sumar_totaldescuento_t(codigo);
            descuento_fun(codigo, descuento)
        } else {
            //document.myapp.textotal33.value = "";
        }

        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    } catch (e) {

    }
    total_general_subtotal();
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
            document.myapp.textotal33.value = dosdecimales(xhr.responseText);
            total_general_subtotal()
        }
        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    }
}
function total_general_subtotal() {
    var enviar = "total";
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "temporal/get2_total_factura_subtotal.php");
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.send(enviar);

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var c = parseFloat(xhr.responseText);
            textsubtotal.value = xhr.responseText;
        }
        function dosdecimales(x) {
            return Number.parseFloat(x).toFixed(2);
        }
    }
}

///////////////////////////////////////////////////////////////////////////
