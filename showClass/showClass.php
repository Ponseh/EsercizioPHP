<?php
    require_once('..\database\database.php');

    $stmt = $conn->prepare('SELECT nomeclasse FROM tclassi WHERE speclasse=?');
    $stmt->bind_param("s", $_POST['Specializzazione']);
    $result = $stmt->execute();

    $arrayRes = array();

    if ($result->num_rows > 0) {
        $i=0;
        while($row = $result->fetch_assoc()) {
            $arrayRes[$i] = $row;
            $i++;
        }
    }



?>
