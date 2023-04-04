function validar() {
    var nombre, alias, email, rut, id_region, id_comuna, candidato, expresion;
    nombre = document.getElementById("nombre").value;
    alias = document.getElementById("alias").value;
    rut = document.getElementById("rut").value;
    email = document.getElementById("email").value;
    id_region = document.getElementById("id_region").value;
    id_comuna = document.getElementById("id_comuna").value;
    candidato = document.getElementById("candidato").value;
    var marcats = 0;
    var checks = document.getElementsByClassName("check");
    expresion = /\w+@\w+\.+[a-z]/;
    letras_espacio = /^[ a-zA-ZñÑáéíóúÁÉÍÓÚ].{7,30}$/;

    if (nombre === "") {
        alert("El campo nombre está vacío");
        return false;
    }
    else if (!letras_espacio.test(nombre)) {
        alert("Haz coincidir el formato del nombre");
        return false;
    }
    if (alias === "") {
        alert("El campo alias está vacío");
        return false;
    }
    else if (!/^(?=.*\d)(?=.*[a-z]).{5,18}$/.test(alias)) {
        alert("Haz coincidir el formato del alias debe tener mas de 5 caracteres además de números y letras");
        return false;
    }
    if (rut === "") {
        alert("El campo rut está vacío");
        return false;
    }
    else if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test(rut)) {
        alert("Por favor siga el formato 11111111-1");
        return false;
    }
    if (Fn.validaRut(rut)){
	} else {
        alert("El rut no es valido");
        return false;
	}
    if (email === "") {
        alert("El campo email está vacío");
        return false;
    }
    else if (!expresion.test(email)) {
        alert("El campo email no es valido");
        return false;
    }
    if (id_region === "0") {
        alert("Por favor seleccione una region");
        return false;
    }
    if (id_comuna === "0") {
        alert("Por favor seleccione una comuna");
        return false;
    }
    if (candidato === "0") {
        alert("Por favor seleccione el candidato de su preferencia");
        return false;
    }

    }


//Funciones inputs
function Solo_Texto(e) {
    var code;
    if (!e) var e = window.event;
    if (e.keyCode) code = e.keyCode;
    else if (e.which) code = e.which;
    var character = String.fromCharCode(code);
    var AllowRegex = /^[\ba-zA-Z\s-]$/;
    if (AllowRegex.test(character)) return true;
    return false;
}
function Ktext(string) {
    var out = '';
    var filtro = '-kK1234567890';
    for (var i = 0; i < string.length; i++)
        if (filtro.indexOf(string.charAt(i)) != -1)
            out += string.charAt(i);
    return out;
}
function NumText(string) {
    var out = '';
    var filtro = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz1234567890';
    for (var i = 0; i < string.length; i++)
        if (filtro.indexOf(string.charAt(i)) != -1)
            out += string.charAt(i);
    return out;
}

// recuperacion id region
function muestraselect(str) {
    var conexion;
    if (str == "") {
        document.getElementById("txtHint").innerHTML = "";
        return;
    }
    if (window.XMLHttpRequest) {
        conexion = new XMLHttpRequest();
    }
    conexion.onreadystatechange = function () {
        if (conexion.readyState == 4 && conexion.status == 200) {
            document.getElementById("id_comuna").innerHTML = conexion.responseText;
        }
    }
    conexion.open("GET", "includes/getComuna.php?r=" + str, true);
    conexion.send();
}


// VAIDACIÓN DEL RUT
var Fn = {
	validaRut : function (rutCompleto) {
		rutCompleto = rutCompleto.replace("‐","-");
		if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( rutCompleto ))
			return false;
		var tmp 	= rutCompleto.split('-');
		var digv	= tmp[1]; 
		var rut 	= tmp[0];
		if ( digv == 'K' ) digv = 'k' ;
		
		return (Fn.dv(rut) == digv );
	},
	dv : function(T){
		var M=0,S=1;
		for(;T;T=Math.floor(T/10))
			S=(S+T%10*(9-M++%6))%11;
		return S?S-1:'k';
	}
}




