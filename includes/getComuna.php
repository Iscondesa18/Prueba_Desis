<?php 
include "conexion_bd.php";
$consulta="SELECT * FROM Comuna";
$ejecutarConsulta=mysqli_query($conexion, $consulta);



    while($fila = mysqli_fetch_array($ejecutarConsulta)){
            echo'<select class="custom-select" id="id_comuna"  name="id_comuna" required= required  >';
            while ($fila = mysqli_fetch_array($ejecutarConsulta)) {
                if ($fila['idRegion']==$_GET['r']) {
                    echo "<option value='".$fila['IdComuna']."'>".$fila['Comuna']."</option>"    ;
                }
                
            }
            echo'</select>';
            
    }

    
?>