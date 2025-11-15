<?php
// conexion.php - archivo de conexión a la base de datos
$host = "localhost";
$user = "root";
$pass = "";
$dbname = "cuidado_bebe_manilla";

$conexion = new mysqli($host, $user, $pass, $dbname);

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
// Opcional: establecer conjunto de caracteres
$conexion->set_charset("utf8mb4");
?>
