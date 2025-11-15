INSTRUCCIONES DE INSTALACIÓN

1) Extrae la carpeta 'cuidado_bebe_web' dentro de:
   C:\xampp\htdocs\   (en Windows con XAMPP)
   o /opt/lampp/htdocs/  (en Linux con XAMPP)

2) Asegúrate que MySQL y Apache estén corriendo (XAMPP Control Panel).

3) Abre en tu navegador:
   http://localhost/cuidado_bebe_web/

4) Si tu base de datos tiene otro usuario/contraseña, edita conexion.php y ajusta $user y $pass.

5) Archivos incluidos:
   - conexion.php  : Conexión a la base de datos
   - index.php      : Página de demostración que lista usuarios
   - estilos.css    : Estilos simples

6) Para pruebas adicionales:
   - Usa phpMyAdmin para ejecutar las consultas y EXPLAIN.
