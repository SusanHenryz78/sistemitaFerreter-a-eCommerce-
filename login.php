<?php
session_start();
require 'includes/db.php';
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <?php include 'includes/header.php'; ?>

    <h1>Iniciar Sesión</h1>
    <form action="login.php" method="post">
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>
        <label for="password">Contraseña:</label>
        <input type="password" name="password" id="password" required>
        <input type="submit" value="Iniciar Sesión">
    </form>

    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = $_POST['email'];
        $password = $_POST['password'];

        $query = $conn->prepare("SELECT * FROM clientes WHERE Email = :email");
        $query->bindParam(':email', $email);
        $query->execute();
        $user = $query->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['Password'])) {
            $_SESSION['user_id'] = $user['ID_Clientes'];
            header('Location: index.php');
            exit;
        } else {
            echo '<p>Correo o contraseña incorrectos</p>';
        }
    }
    ?>
</body>
</html>