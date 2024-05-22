<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "ingatlan";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Sikertelen kapcsolódás: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $kategoria = isset($_POST['kategoria']) ? $_POST['kategoria'] : '';
    $hirdetesDatuma = date("Y-m-d");
    $leiras = isset($_POST['leiras']) ? $_POST['leiras'] : '';
    $tehermentes = isset($_POST['tehermentes']) ? 1 : 0;
    $kepUrl = isset($_POST['kepUrl']) ? $_POST['kepUrl'] : '';
    $kategoriaEllenorzes = "SELECT id FROM kategoriak WHERE id = $kategoria";
    $result = $conn->query($kategoriaEllenorzes);
    if ($result->num_rows == 0) {
        die("Hiba történt: Érvénytelen kategória.");
    }

    $sql = "INSERT INTO ingatlanok (kategoria, leiras, hirdetesDatuma, tehermentes, kepUrl)
    VALUES ('$kategoria', '$leiras', '$hirdetesDatuma', '$tehermentes', '$kepUrl')";

    if ($conn->query($sql) === TRUE) {
        echo "Az új hirdetés sikeresen hozzá lett adva.";
    } else {
        echo "Hiba történt: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>
