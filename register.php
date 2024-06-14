<?php
session_start();
require 'includes/db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $stmt = $conn->prepare("INSERT INTO clientes (Nombre, Apellido, Direccion, Telefono, Email, Password) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->execute([$nombre, $apellido, $direccion, $telefono, $email, $password]);

    header('Location: login.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <?php include 'includes/header.php'; ?>

    <h1>Registro</h1>
    <form action="register.php" method="POST">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" required><br>
        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" required><br>
        <label for="direccion">Dirección:</label>
        <input type="text" name="direccion" required><br>
        <label for="telefono">Teléfono:</label>
        <input type="text" name="telefono" required><br>
        <label for="email">Email:</label>
        <input type="email" name="email" required><br>
        <label for="password">Contraseña:</label>
        <input type="password" name="password" required><br>
        <button type="submit">Registrarse</button>
    </form>
</body>
</html>