<?php
    session_start();
    require_once('database.php');

    $stmt = $conn->prepare('DELETE FROM tinsegnanti WHERE cognomeins=? AND nomeins=?');
    $stmt->bind_param("ss", $_SESSION['Cognome_Insegnante'], $_SESSION['Nome_Insegnante']);
    $stmt->execute();

    header('Location: index.html');
?>
