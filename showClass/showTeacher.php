<?php
    require_once('..\database\database.php');

    $stmt = $conn->prepare('SELECT nomeins, cognomeins, numore FROM tinsegnanti, rinsegnain, tclassi WHERE idinsegnante=codinsegnante AND idclasse=codclasse AND nomeclasse=?');
    $stmt->bind_param("s", $_GET['nomeClasse']);
    $stmt->execute();
    $result = $stmt->get_result();

    $arrayRes = array();

    if (!($result->num_rows === 0)) {
        $i=0;
        while($row = $result->fetch_assoc()) {
            $arrayRes[$i] = $row;
            $i++;
        }
    }

    foreach ($arrayRes as $key => $value) {
        echo "professore {$value['nomeins']} {$value['cognomeins']} insegna {$value['numore']} ore";
        echo "<br>";
    }

    echo "<br>";
    echo "<a href=\"..\index.html\">Torna alla home</a>";

    $stmt->close();
?>
