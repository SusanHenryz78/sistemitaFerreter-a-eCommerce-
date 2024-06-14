<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_producto'])) {
    $id_producto = intval($_POST['id_producto']);

    if (!isset($_SESSION['carrito'])) {
        $_SESSION['carrito'] = array();
    }

    if (!isset($_SESSION['carrito'][$id_producto])) {
        $_SESSION['carrito'][$id_producto] = 1; // Agrega el producto con cantidad 1
    } else {
        $_SESSION['carrito'][$id_producto]++; // Incrementa la cantidad si ya está en el carrito
    }
}

header('Location: index.php');
exit();
?>