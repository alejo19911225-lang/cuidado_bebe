<?php
// index.php - página principal de prueba
include "conexion.php";
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>Cuidado Bebé - Demo</title>
  <link rel="stylesheet" href="estilos.css">
</head>
<body>
  <div class="container">
    <h1>Demo - Usuarios registrados</h1>
    <p>Esta página muestra los registros de la tabla <code>usuario</code>.</p>

    <?php
    $sql = "SELECT id_usuario, nombre, telefono, correo FROM usuario";
    if ($resultado = $conexion->query($sql)) {
        if ($resultado->num_rows > 0) {
            echo '<table class="tabla"><thead><tr><th>ID</th><th>Nombre</th><th>Teléfono</th><th>Correo</th></tr></thead><tbody>';
            while ($fila = $resultado->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . htmlspecialchars($fila['id_usuario']) . "</td>";
                echo "<td>" . htmlspecialchars($fila['nombre']) . "</td>";
                echo "<td>" . htmlspecialchars($fila['telefono']) . "</td>";
                echo "<td>" . htmlspecialchars($fila['correo']) . "</td>";
                echo "</tr>";
            }
            echo "</tbody></table>";
        } else {
            echo "<p>No hay usuarios registrados.</p>";
        }
        $resultado->free();
    } else {
        echo "<p class='error'>Error en la consulta: " . htmlspecialchars($conexion->error) . "</p>";
    }

    // Ejemplo: botón para ejecutar una consulta EXPLAIN (no ejecuta EXPLAIN por seguridad aquí)
    ?>
    <div class="nota">
      <p><strong>Nota:</strong> Para ver el plan de ejecución (EXPLAIN), usa phpMyAdmin o ejecuta en consola:</p>
      <pre>EXPLAIN SELECT * FROM lectura_signos WHERE id_bebe = 2 AND fecha &gt; '2025-01-01';</pre>
    </div>

  </div>
</body>
</html>
