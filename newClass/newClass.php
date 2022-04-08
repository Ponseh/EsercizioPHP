<?php
    require_once('..\database\database.php');

    $stmt = $conn->prepare('INSERT INTO tclassi(nomeclasse, speclasse, piano, ala) VALUES (?, ?, ?, ?)');
    $stmt->bind_param("ssis", $_POST['Nome_Classe'], $_POST['Specializzazione_Classe'], $_POST['Piano'], $_POST['Ala']);
    $stmt->execute();

    $stmt->close();
    
    header('Location: ..\index.html');
?>
