<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ÁLB Ingatlanügynökség</title>
    <link rel="stylesheet" href="dist/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="container">
        <nav class="navbar navbar-expand-md navbar-light d-none d-md-block">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarRealEstateAgency">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="index.html">Kezdőlap</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Ingatlan kínálat</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="newad.html">Hirdetés feladása</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <h2 class="mb-4 text-center">Aktuális ajánlataink</h2>
        <div class="row">
            <?php
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "ingatlan";

            $conn = new mysqli($servername, $username, $password, $dbname);

            if ($conn->connect_error) {
                die("Nem sikerült csatlakozni az adatbázishoz: " . $conn->connect_error);
            }

            $sql = "SELECT ingatlanok.id, kategoriak.nev AS kategoria_nev, leiras, hirdetesDatuma, kepUrl 
            FROM ingatlanok
            INNER JOIN kategoriak ON ingatlanok.kategoria = kategoriak.id;";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo '
                        <div class="col-12 offset-md-1 col-md-10 offset-lg-0 col-lg-6">
                            <div class="card border-light mb-3">
                                <div class="card-header bg-secondary">
                                    <span class="fw-bold">'.$row["kategoria_nev"].'</span>
                                    <span class="float-end">'.$row["hirdetesDatuma"].'</span>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">'.$row["leiras"].'</p>
                                </div>
                                <img class="card-img-bottom p-2" alt="" src="'.$row["kepUrl"].'">
                                <div class="card-footer text-center">
                                    <a class="btn btn-primary px-4" href="mailto:sales@alb.example.com?subject=Érdeklődés RefNo: '.$row["id"].'&body=Kérnék egy részletes tájékoztatót!">
                                        Érdekel
                                    </a>
                                </div>
                            </div>
                        </div>
                    ';
                }
            } else {
                echo "Nincs elérhető ingatlan.";
            }
            $conn->close();
            ?>
        </div>
    </div>
    <script src="dist/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
