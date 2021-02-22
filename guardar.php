<?php
 require 'conexion.php';
  
 $nombre  = $_POST['nombre'];
 $apellido  = $_POST['apellido'];
 $email = $_POST['email'];
 $carrera = $_POST ['combo1'];
 $turno = $_POST ['combo2'];
 $concepto = $_POST ['combo3'];
$insertar1 = "INSERT INTO alumnos VALUES ('','$nombre','$apellido','$email','$carrera','$turno') ";

$query1 = mysqli_query($conectar, $insertar1);



/* $sacar = "SELECT idboleta  from  alumnos where email = 'asdaa@gms.com'"; */

$sacar = "SELECT idboleta  from  alumnos where email = '$email'";
$query3 = mysqli_query($conectar, $sacar);

if ($query3){

    while ($v1 = mysqli_fetch_row($query3)){
        $valor1 =  $v1[0];
    }
    mysqli_free_result($query3);
}

$insertar2 = "INSERT INTO recibo VALUES ('$valor1','$concepto') ";

$query2 = mysqli_query($conectar, $insertar2);

   



if ($query1 & $query2){
    header("Location: index.php");
} else {
    echo 'incorrecto';
}



?>