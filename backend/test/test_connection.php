<?php

// Mostrar el directorio donde está este archivo
echo "Directorio actual: " . __DIR__ . "<br>";

// Construir la ruta hacia database.php
$path = __DIR__ . '/../config/database.php';
echo "Intentando cargar: $path<br>";

// Verificar si existe
if (!file_exists($path)) {
    die("❌ ERROR: No se encuentra database.php en esa ruta");
}

// Cargar archivo
require_once $path;
echo "✔ Archivo database.php cargado correctamente<br>";

// Probar la clase
try {
    $db = new Database();
    $conn = $db->connect();
    echo "✔ Conexión OK";
} catch (Exception $e) {
    echo "✖ Error: " . $e->getMessage();
}
