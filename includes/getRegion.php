<?php 


$servidor="localhost";
$usuario="root";
$clave="";
$baseDedatos="votaciones";

$enlace = mysqli_connect($servidor, $usuario, $clave, $baseDedatos);
if (!$enlace) {
    echo"Error en la conexion con el servidor";
}



$consulta="SELECT * FROM Region";
$ejecutarConsulta = mysqli_query($enlace, $consulta);



    while($fila = mysqli_fetch_array($ejecutarConsulta)){
        echo" <option value='".$fila['idRegion']."'>".$fila['Region']."</option>";
            
    }
?>