
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Formulario de Matricula</title>
<script text="text/javascript">

 function enviar (destino)
 {
    document.matricula.action = destino;
    document.matricula.submit ();
 }

</script>

</head>

<body>

<?php 
  require 'conexion.php';
  $sql = "select  al.idboleta as idboleta,al.nombres as  nombres,
  al.apellidos as apellidos, al.email as email,
  cr.nombre as carreras_idcarreras,
  tr.nombre as turnos_idturnos,
  co.nombre as concepto
  
  from    alumnos al 
      inner join recibo r on     al.idboleta = r.recibo_idrecibo
      inner join conceptos co on  r.conceptos_idconceptos  = co.idconceptos
      join carreras cr on al.carreras_idcarreras = cr.idcarreras
      join  turnos tr  on al.turnos_idturnos = tr.idturnos order by al.idboleta";
  $resultado = mysqli_query($conectar, $sql );

?>



<div class="group">
  <form name = "matricula" method="POST">
  <h2><em>Formulario de Matricula</em></h2>
  
     
      <label for="apellido">Apellido <span><em>(requerido)</em></span></label>
      <input type="text" name="apellido" class="form-input" required/>             
      <label for="nombre">Nombre <span><em>(requerido)</em></span></label>
      <input type="text" name="nombre" class="form-input" required/>   
      <label for="email">Email <span><em>(requerido)</em></span></label>
      <input type="email" name="email" class="form-input" />
    

      <label for="combo1">Carrera</label> 
      <select name="combo1"  id = "combo1" required>
    <!-- Opciones de la lista -->
    <?php

$consulta = "select  * from  carreras";

$query = mysqli_query($conectar, $consulta);
    
while ($sistemas = mysqli_fetch_row($query)){
?><option value = "<?php echo $sistemas[0] ?>"><?php echo  $sistemas[1]?></option>

<?php }
    ?>
   
  </select>

  <label for="combo2">Turno</label> 
      <select name="combo2"  id = "combo2" required>
    
      <?php

$consulta = "select * from turnos";

$query = mysqli_query($conectar, $consulta);
    
while ($sistemas = mysqli_fetch_row($query)){
?><option value = "<?php echo $sistemas[0] ?>"><?php echo  $sistemas[1]?></option>

<?php }
    ?>
    
  </select>

  <label for="combo3">Concepto</label> 
      <select name="combo3"  id = "combo3" required>
      <?php

$consulta = "select * from conceptos";

$query = mysqli_query($conectar, $consulta);
    
while ($sistemas = mysqli_fetch_row($query)){
?><option value = "<?php echo $sistemas[0] ?>"><?php echo  $sistemas[1]?></option>

<?php }
    ?>
    
  </select>
  

      <input name="guardar" type="button" value="Guardar" onClick="enviar('guardar.php')" />
      
    </p>
  </form>
</div>



<div class="group">
  <form name = "vista" method="POST">
  

  <table>
  <thead>
    <tr>
      <th>N° boleta</th>
      <th>Nombre</th>
      <th>Apellidos</th>
      <th>email</th>
      <th>Carrera</th>
      <th>Turno</th>
      <th>Concepto</th>
    </tr>
  </thead>
  <tbody>
  <?php
  while ($filas = mysqli_fetch_assoc($resultado)){
  ?>
    <tr>
      <td><?php echo $filas['idboleta']?></td>
      <td><?php echo $filas['nombres']?></td>
      <td><?php echo $filas['apellidos']?></td>
      <td><?php echo $filas['email']?></td>
      <td><?php echo $filas['carreras_idcarreras']?></td>
      <td><?php echo $filas['turnos_idturnos']?></td>
      <td><?php echo $filas['concepto']?></td>
      <td> <a href="">Editar</a>
            <a href="">Borrar</a>
      </td>
      

    </tr>

    <?php } ?>
  </tbody>
  
</table>
  </form>
</div>
</body>
</html>