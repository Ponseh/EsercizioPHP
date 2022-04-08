<?php
    session_start();
    require_once('..\database\database.php');

    //Elimino le associazioni nella tabella rinsegnain
    $stmt = $conn->prepare('DELETE FROM rinsegnain where codinsegnante IN (SELECT idinsegnante FROM tinsegnanti where cognomeins=? and nomeins=?)');
    $stmt->bind_param("ss", $_SESSION['Cognome_Insegnante'], $_SESSION['Nome_Insegnante']);
    $stmt->execute();

    //Elimino l'insegnante dal database
    $stmt = $conn->prepare('DELETE FROM tinsegnanti WHERE cognomeins=? AND nomeins=?');
    $stmt->bind_param("ss", $_SESSION['Cognome_Insegnante'], $_SESSION['Nome_Insegnante']);
    $stmt->execute();

    $stmt->close();

    header('Location: ..\index.html');
?>
