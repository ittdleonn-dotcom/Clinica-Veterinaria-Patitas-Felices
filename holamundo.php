<?php
include("conexion.php");

/* ======================
   ALERTAS VISUALES
======================*/
function alerta($msg){
echo "<script>alert('$msg');</script>";
}

/* ======================
   CLIENTES
======================*/
if(isset($_POST['guardar_cliente'])){
mysqli_query($conexion,"
INSERT INTO clientes(nombre,apellido,telefono,correo,direccion)
VALUES(
'{$_POST['nombre']}',
'{$_POST['apellido']}',
'{$_POST['telefono']}',
'{$_POST['correo']}',
'{$_POST['direccion']}'
)");
alerta("Cliente registrado correctamente");
}

/* ======================
   MASCOTAS
======================*/
if(isset($_POST['guardar_mascota'])){
mysqli_query($conexion,"
INSERT INTO mascotas(nombre,especie,raza,edad,id_cliente)
VALUES(
'{$_POST['nombre']}',
'{$_POST['especie']}',
'{$_POST['raza']}',
'{$_POST['edad']}',
'{$_POST['id_cliente']}'
)");
alerta("Mascota registrada");
}

/* ======================
   CONSULTA MEDICA
======================*/
if(isset($_POST['guardar_consulta'])){
mysqli_query($conexion,"
INSERT INTO consultas_medicas(id_mascota,motivo_consulta,diagnostico,tratamiento,fecha)
VALUES(
'{$_POST['id_mascota']}',
'{$_POST['motivo']}',
'{$_POST['diagnostico']}',
'{$_POST['tratamiento']}',
CURDATE()
)");
alerta("Consulta registrada");
}

/* ======================
   VENTAS
======================*/
if(isset($_POST['guardar_venta'])){
mysqli_query($conexion,"
INSERT INTO ventas(total,fecha)
VALUES('{$_POST['total']}',CURDATE())
");
alerta("Venta realizada");
}
?>
<!DOCTYPE html>
<html>
<head>

<title>Patitas Felices</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>

body{
margin:0;
font-family:Poppins;
background:#f4f9f9;
}

/* HEADER */
header{
background:#20b2aa;
color:white;
padding:15px;
text-align:center;
font-size:26px;
}

/* LAYOUT */
.container{
display:flex;
}

.menu{
width:250px;
background:#0f7c7c;
min-height:100vh;
position:fixed;
}

.menu a{
display:block;
color:white;
padding:12px;
text-decoration:none;
border-bottom:1px solid rgba(255,255,255,.2);
}

.menu a:hover{
background:#20b2aa;
}

.contenido{
margin-left:260px;
padding:20px;
}

/* FORMULARIOS */
form{
background:white;
padding:20px;
border-radius:10px;
width:400px;
margin:auto;
box-shadow:0 5px 10px rgba(0,0,0,.1);
}

input,select{
width:95%;
padding:10px;
margin:8px;
border-radius:6px;
border:1px solid #ccc;
}

/* BOTONES */
button{
padding:10px;
border:none;
border-radius:8px;
cursor:pointer;
font-weight:bold;
}

.guardar{background:#28a745;color:white;}
.eliminar{background:#dc3545;color:white;}
.editar{background:#007bff;color:white;}

/* LISTAS */
.lista{
background:white;
padding:12px;
margin:10px auto;
width:70%;
border-radius:8px;
box-shadow:0 3px 6px rgba(0,0,0,.1);
}

/* ESTADOS */
.proxima{background:#fff3cd;}
.completado{background:#d4edda;}
.vencido{background:#f8d7da;}

.cards{
display:flex;
gap:20px;
flex-wrap:wrap;
}

.card{
background:white;
padding:20px;
border-radius:12px;
width:220px;
box-shadow:0 4px 10px rgba(0,0,0,.1);
text-align:center;
font-size:18px;
}

.card h3{
font-size:28px;
color:#20b2aa;
}

</style>
</head>

<body>

<header> Clínica Veterinaria Patitas Felices</header>

<div class="container">

<div class="menu">
<a href="?form=dashboard">Dashboard</a>
<a href="?form=clientes">Clientes</a>
<a href="?form=mascotas">Mascotas</a>
<a href="?form=consultas">Consultas</a>
<a href="?form=citas">Citas</a>
<a href="?form=ventas">Ventas</a>
<a href="?form=recientes">Recientes</a>
<a href="?form=ingresos">Ingresos</a>
</div>

<div class="contenido">

<?php

$form=$_GET['form'] ?? "dashboard";

/* ================= DASHBOARD ================= */
if($form=="dashboard"){

echo "<h2>📊 Panel General</h2>";

/* CITAS HOY */
$citas=mysqli_num_rows(mysqli_query($conexion,"
SELECT * FROM citas WHERE fecha=CURDATE()
"));

/* INGRESOS HOY */
$ing=mysqli_fetch_assoc(mysqli_query($conexion,"
SELECT SUM(total) t FROM ventas WHERE fecha=CURDATE()
"));
$ingresos=$ing['t'] ?? 0;

/* VACUNAS PROXIMAS */
$vacunacion=mysqli_num_rows(mysqli_query($conexion,"
SELECT * FROM vacunacion
WHERE fecha <= DATE_ADD(CURDATE(),INTERVAL 7 DAY)
"));

/* TRATAMIENTOS ACTIVOS */
$tratamientos=mysqli_num_rows(mysqli_query($conexion,"
SELECT * FROM consultas_medicas
WHERE tratamiento!=''
"));

/* MASCOTAS SIN CONSULTA RECIENTE */
$pendientes=mysqli_num_rows(mysqli_query($conexion,"
SELECT * FROM mascotas
WHERE id_mascota NOT IN(
SELECT id_mascota FROM consultas_medicas
WHERE fecha >= DATE_SUB(CURDATE(),INTERVAL 30 DAY)
)
"));

echo "
<div class='cards'>

<div class='card'>📅 Citas hoy <h3>$citas</h3></div>

<div class='card'>💰 Ingresos del día <h3>$$ingresos</h3></div>

<div class='card'>💉 Vacunas próximas <h3>$vacunacion</h3></div>

<div class='card'>🩺 Tratamientos activos <h3>$tratamientos</h3></div>

<div class='card'>🐾 Mascotas pendientes <h3>$pendientes</h3></div>

</div>";
}



/* ================= CLIENTES ================= */
elseif($form=="clientes"){ ?>

<h2>Clientes</h2>

<form method="POST">
<input name="nombre" required placeholder="Nombre">
<input name="apellido" required placeholder="Apellido">
<input name="telefono" pattern="[0-9]+" required placeholder="Teléfono">
<input name="correo" type="email" required placeholder="Correo">
<input name="direccion" required placeholder="Dirección">
<button class="guardar" name="guardar_cliente">Guardar</button>
</form>

<?php
$res=mysqli_query($conexion,"SELECT * FROM clientes");

while($c=mysqli_fetch_assoc($res)){
echo "<div class='lista'>
{$c['nombre']} {$c['apellido']}
</div>";
}
}

/* ================= MASCOTAS ================= */
elseif($form=="mascotas"){ ?>

<h2>Mascotas</h2>

<form method="POST">

<input name="nombre" required placeholder="Nombre">

<select name="especie">
<option>Perro</option>
<option>Gato</option>
<option>Ave</option>
</select>

<input name="raza" required placeholder="Raza">
<input name="edad" required placeholder="Edad">

<select name="id_cliente">
<?php
$clientes=mysqli_query($conexion,"SELECT * FROM clientes");
while($cl=mysqli_fetch_assoc($clientes)){
echo "<option value='{$cl['id_cliente']}'>{$cl['nombre']}</option>";
}
?>
</select>

<button class="guardar" name="guardar_mascota">Guardar</button>

</form>

<?php
$res=mysqli_query($conexion,"
SELECT m.nombre,c.nombre cliente
FROM mascotas m
JOIN clientes c ON m.id_cliente=c.id_cliente
");

while($m=mysqli_fetch_assoc($res)){
echo "<div class='lista'>{$m['nombre']} - Dueño: {$m['cliente']}</div>";
}
}

/* ================= CONSULTAS ================= */
elseif($form=="consultas"){ ?>

<h2>Consultas Médicas</h2>

<form method="POST">

<select name="id_mascota">
<?php
$m=mysqli_query($conexion,"SELECT * FROM mascotas");
while($x=mysqli_fetch_assoc($m)){
echo "<option value='{$x['id_mascota']}'>{$x['nombre']}</option>";
}
?>
</select>

<input name="motivo" required placeholder="Motivo">
<input name="diagnostico" required placeholder="Diagnóstico">
<input name="tratamiento" placeholder="Tratamiento">

<button class="guardar" name="guardar_consulta">Guardar</button>

</form>

<?php
$res=mysqli_query($conexion,"
SELECT c.fecha,m.nombre,c.diagnostico
FROM consultas_medicas c
JOIN mascotas m ON c.id_mascota=m.id_mascota
ORDER BY c.fecha DESC
");

while($c=mysqli_fetch_assoc($res)){
echo "<div class='lista'>
{$c['fecha']} - {$c['nombre']} - {$c['diagnostico']}
</div>";
}
}

/* ================= CITAS ================= */
elseif($form=="citas"){ ?>

<h2>Agendar Cita</h2>

<form method="POST">

<select name="id_mascota" required>
<option value="">Seleccionar mascota</option>
<?php
$mas=mysqli_query($conexion,"SELECT * FROM mascotas");
while($m=mysqli_fetch_assoc($mas)){
echo "<option value='{$m['id_mascota']}'>{$m['nombre']}</option>";
}
?>
</select>

<input type="date" name="fecha" required>

<select name="estado">
<option value="Proxima">Próxima</option>
<option value="Completada">Completada</option>
<option value="Cancelada">Cancelada</option>
</select>

<button class="guardar" name="guardar_cita">Guardar Cita</button>

</form>

<?php

/* GUARDAR CITA */
if(isset($_POST['guardar_cita'])){
mysqli_query($conexion,"
INSERT INTO citas(id_mascota,fecha,estado)
VALUES(
'{$_POST['id_mascota']}',
'{$_POST['fecha']}',
'{$_POST['estado']}'
)");
echo "<script>alert('Cita registrada');</script>";
}

/* MOSTRAR CITAS */
$res=mysqli_query($conexion,"
SELECT c.fecha,c.estado,m.nombre
FROM citas c
JOIN mascotas m ON c.id_mascota=m.id_mascota
ORDER BY c.fecha DESC
");

while($c=mysqli_fetch_assoc($res)){

$color="";

if($c['estado']=="Proxima") $color="proxima";
if($c['estado']=="Completada") $color="completado";
if($c['estado']=="Cancelada") $color="vencido";

echo "<div class='lista $color'>
 {$c['fecha']} - {$c['nombre']} - {$c['estado']}
</div>";
}

}

/* ================= VENTAS ================= */
elseif($form=="ventas"){ ?>

<h2>Ventas</h2>

<form method="POST">
<input name="total" required placeholder="Total">
<button class="guardar" name="guardar_venta">Guardar</button>
</form>

<?php
$res=mysqli_query($conexion,"SELECT * FROM ventas ORDER BY fecha DESC");

while($v=mysqli_fetch_assoc($res)){
echo "<div class='lista'>💲 {$v['total']} - {$v['fecha']}</div>";
}
}

/* ================= INGRESOS ================= */
elseif($form=="ingresos"){

$res=mysqli_query($conexion,"
SELECT DATE(fecha) dia,SUM(total) total
FROM ventas
GROUP BY dia
");

echo "<h2>Ingresos diarios</h2>";

while($r=mysqli_fetch_assoc($res)){
echo "<div class='lista'>".$r['dia']." → $".$r['total']."</div>";
}
}

/* ================= RECIENTES ================= */
elseif($form=="recientes"){

echo "<h2>Mascotas atendidas recientemente</h2>";

$res=mysqli_query($conexion,"
SELECT c.fecha,m.nombre
FROM consultas_medicas c
JOIN mascotas m ON c.id_mascota=m.id_mascota
ORDER BY c.fecha DESC LIMIT 10
");

while($r=mysqli_fetch_assoc($res)){
echo "<div class='lista proxima'>
{$r['fecha']} - {$r['nombre']}
</div>";
}
}

?>

</div>
</div>
</body>
</html>