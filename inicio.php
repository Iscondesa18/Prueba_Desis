<?php
include "includes/conexion_bd.php";
include "includes/registrarVotacion.php";

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/validaciones.js">  </script>

    <title>Votaciones</title>

</head>

<body>
    <h1>Formulario de votación:</h1>
    
    <div style="border-style: inset;">
        <form action="" method="post" onsubmit="return validar();">
            <table>
                <tr>
                    <td>Nombre y apellido:</td>
                    <td><input class="inputs" type="text"id="nombre" name="nombre"onkeypress="return Solo_Texto(event);"></td>
                </tr>
                <tr>
                    <td>Alias:</td>
                    <td><input class="inputs" type="text"id="alias"  name="alias" onkeyup="this.value=NumText(this.value)"></td>
                </tr>
                
                <tr>
                    <td>RUT:</td>
                    <td><input class="inputs" type="text"id="rut"    name="rut"   maxlength="10"  onkeyup="this.value=Ktext(this.value)"></td>
                </tr>
                
                <tr>
                    <td>Email:</td>
                    <td> <input class="inputs" type="text"id="email"  name="email"></td>
                </tr>
                <tr>
                    <td>Región:</td>
                    <td><select class="inputs" id="id_region"  name="id_region" required= required onclick="muestraselect(this.value)" >
                        <option value="0">Seleccione la region:</option>
                        <?php include "includes/getRegion.php";?>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td>Comuna:</td>
                    <td><select class="inputs" id="id_comuna"  name="id_comuna" required= required  >
                        <option value="0">Seleccione la Comuna:</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Candidato:</td>
                    <td><select class="inputs"  id="candidato" name="candidato" required= required  >
                        <option value="0">Seleccione el candidato:</option>
                        <?php
                        $query = $conexion -> query ("SELECT * FROM candidato");
                        while ($valores = mysqli_fetch_array($query)) {    
                        echo '<option value="'.$valores['IdCandidato'].'">'.$valores['NombreCandidato'].'</option>';
                        }
                        ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Como se enteró de nosotros: </td>
                    <td>
                        <input class="check" name="checkbox[]" id="checkbox" value="Web" type="checkbox">Web 
                        <input class="check" name="checkbox[]" id="checkbox" value="TV" type="checkbox">TV 
                        <input class="check" name="checkbox[]" id="checkbox" value="Redes" type="checkbox">Redes sociales 
                        <input class="check" name="checkbox[]" id="checkbox" value="Amigo" type="checkbox">Amigo 
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="registrarVoto" value="Votar""></td>
                </tr>
            </table>    
        </form>
    </div>

</body>

</html>
    
<script>
var marcats = 0;
var checks = document.getElementsByClassName("check");
for (let check of checks) {
    check.addEventListener("click", function () {
        if (this.checked) {
            marcats++;
        } else {
            if (marcats != 2) {
                marcats--;
            } else {
                alert("Debe escojer al menos 2 opciones");
                this.checked = true;
            }
        }
    })}

</script>