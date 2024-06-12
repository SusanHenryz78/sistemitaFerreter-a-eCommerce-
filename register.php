<?php
include('includes/db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];

    $stmt = $conn->prepare("INSERT INTO clientes (Nombre, Apellido, Direccion, Telefono) VALUES (?, ?, ?, ?)");
    $stmt->execute([$nombre, $apellido, $direccion, $telefono]);
    header("Location: login.php");
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h2>Registro de Usuario</h2>
    <form method="post" action="register.php">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br>
        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" required><br>
        <label for="direccion">Dirección:</label>
        <input type="text" id="direccion" name="direccion" required><br>
        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono" required><br>
        <button type="submit">Registrarse</button>
    </form>
</body>
</html>