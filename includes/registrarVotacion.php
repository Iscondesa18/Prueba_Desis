<?php
if(!empty($_POST["registrarVoto"])){
    if (empty($_POST["nombre"]) or empty($_POST["alias"]) or empty($_POST["rut"]) or empty($_POST["email"])or empty($_POST["id_region"])or empty($_POST["id_comuna"])or empty($_POST["candidato"])or empty($_POST["checkbox"])) {
        echo "<script> alert('Porfavor complete todos los campos');</script>";
    } else {
    $nombre=$_POST["nombre"];
    $alias=$_POST["alias"];
    $rut=$_POST["rut"];
    $email=$_POST["email"];
    $id_region=$_POST["id_region"];
    $id_comuna=$_POST["id_comuna"];
    $candidato=$_POST["candidato"];
    $donde = ' ';
    $validar="SELECT * FROM votacion where rut= '$rut'";
    $validando= $conexion->query($validar);
    if ($validando->num_rows >0) {
        echo '<div>Ya existe un voto registrado a el rut</div>';
    }else{
        if (isset($_POST['checkbox'])) {
            $donde= implode(',', $_POST['checkbox']);
        }
        $sql=$conexion->query("INSERT INTO `votacion`(`idVotacion`, `NombreApellidoVotante`, `Alias`, `Rut`, `Email`, `IdRegion`, `IdComuna`, `IdCandidato`,`ComoSeEntero`) VALUES ('','$nombre','$alias','$rut','$email','$id_region','$id_comuna','$candidato','$donde' )");
        if ($sql==1 ){ 
            echo '<div>Voto registrado correctamente</div>';
        } else {
            echo '<div class="alert alert-danger" >ERROR</div>';
        }   
    }
    }
}




?>