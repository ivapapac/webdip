<?php
include('vanjske_biblioteke/baza.class.php');
class Proizvod {
     private $baza;

     function __construct() {
        $this->baza = new Baza();
        $this->baza->spojiDB();
    }

    function __destruct() {
        $this->baza->zatvoriDB();
    }

    function UnesiProizvod($uri){
        $naziv = $_POST['naziv'];
        $boja = $_POST['boja'];
        $kvaliteta = $_POST['kvaliteta'];
        $prostorija = $_POST['prostorija'];
        $polje_vrsta = $_POST['vrsta'];
        $slika = $_FILES['slika']['name'];
        $poveznica = $_POST['link']; 
        $dostupnost = $_POST['dostupnost'];
        $polje_cijena = $_POST['cijena']; 
        $kontakt = $_POST['kontakt'];
        $dostava = $_POST['dostava'];

        $vrsta = '';
        foreach ($polje_vrsta as $key => $value) {
            $vrsta .= $value . '\n';
        }

        $cijena = '';
        foreach ($polje_cijena as $key => $value) {
            $cijena .= $value . '\n';
        }

        if(preg_match('/\?id=/i', $uri)){
            $id = (int)substr($uri, strpos($uri, '=') + 1, strlen($uri));

            $upit = "UPDATE `DZ4_Proizvod` SET `naziv`='$naziv',`boja`='$boja',`kvaliteta`=$kvaliteta,
            `prostorija`='$prostorija',`vrsta`='$vrsta',`slika`='$slika',`poveznica`='$poveznica',
            `dostupno_do`='$dostupnost',`cijena`='$cijena',`kontakt`='$kontakt',`dostava`='$dostava'
            WHERE `proizvod_id`=$id;";

            $this->baza->updateDB($upit, '../ostalo/popis.php');
        }
        else {
            $upit = "INSERT INTO `DZ4_Proizvod`(`naziv`, `boja`, `kvaliteta`, `prostorija`, `vrsta`, `slika`, 
            `poveznica`, `dostupno_do`, `cijena`, `kontakt`, `dostava`) 
            VALUES ('$naziv', '$boja', $kvaliteta, '$prostorija', '$vrsta', '$slika', '$poveznica', '$dostupnost', 
            '$cijena', '$kontakt', '$dostava');";

            $this->baza->selectDB($upit);
        }
    }

    function DohvatiProizvod($id){
        $upit = "SELECT * FROM `DZ4_Proizvod` WHERE `proizvod_id` = $id";
        $proizvod = $this->baza->selectDB($upit);

        return $proizvod->fetch_array();
    }

    function DohvatiSveProizvode($keyword = ''){
        if(empty($keyword)){
            $upit = "SELECT * FROM `DZ4_Proizvod`;";

        }
        else if(is_numeric($keyword)){
           $upit = "SELECT * FROM `DZ4_Proizvod` 
                    WHERE INSTR(`naziv`, '$keyword') > 0 OR INSTR(`boja`, '$keyword') > 0
                    OR INSTR(`vrsta`, '$keyword') > 0 OR INSTR(`prostorija`, '$keyword') > 0
                    OR INSTR(`proizvod_id`, '$keyword') > 0 OR INSTR(`kvaliteta`, '$keyword') > 0
                    OR INSTR(`slika`, '$keyword') > 0 OR INSTR(`poveznica`, '$keyword') > 0
                    OR INSTR(`dostupno_do`, '$keyword') > 0 OR INSTR(`cijena`, '$keyword') > 0
                    OR INSTR(`kontakt`, '$keyword') > 0 OR INSTR(`dostava`, '$keyword') > 0;";
        }
        else{
            $upit = "SELECT * FROM `DZ4_Proizvod` 
                    WHERE INSTR(`naziv`, '$keyword') > 0 OR INSTR(`boja`, '$keyword') > 0
                    OR INSTR(`vrsta`, '$keyword') > 0 OR INSTR(`prostorija`, '$keyword') > 0
                    OR INSTR(`slika`, '$keyword') > 0 OR INSTR(`poveznica`, '$keyword') > 0
                    OR INSTR(`dostupno_do`, '$keyword') > 0 OR INSTR(`cijena`, '$keyword') > 0
                    OR INSTR(`kontakt`, '$keyword') > 0 OR INSTR(`dostava`, '$keyword') > 0;";
        }

        $rezultat = $this->baza->selectDB($upit);

        $tablica = '';
        $mobitel = '';

        while (list($id, $naziv, $boja, $kvaliteta, $vrsta, $prostorija, $slika, $poveznica, $dostupnost,
        $cijena, $kontakt, $dostava) = $rezultat->fetch_array()) {
            $tablica .= "<tr> \n
                            <td>$id</td> \n
                            <td>$naziv</td> \n
                            <td><canvas width='35' height='35' style='background-color: $boja'></canvas></td> \n
                            <td>$kvaliteta/10</td> \n
                            <td>$prostorija</td> \n
                            <td>$vrsta</td> \n
                            <td><img src='../multimedija/$slika' alt='Slika ne postoji'></td> \n
                            <td><a href='$poveznica'>Klikni ovdje</a></td> \n
                            <td>$dostupnost</td> \n
                            <td>$cijena</td> \n
                            <td>$kontakt</td> \n
                            <td>$dostava</td> \n
                            <td><a href='../obrasci/obrazac.php?id=$id'>Ažuriraj</a></td> \n
                        </tr> \n";
            
            $mobitel .= "<tbody> \n
                            <tr> \n
                                <th>ID</th> \n
                                <td>$id</td> \n
                            </tr> \n
                            <tr> \n
                                <th>Naziv</th> \n
                                <td>$naziv</td> \n
                            </tr> \n
                            <tr> \n
                                <th>Boja</th> \n
                                <td><canvas width='40' height='10' style='background-color: $boja'></canvas></td> \n
                            </tr> \n
                            <tr> \n
                                <th>Kvaliteta</th> \n
                                <td>$kvaliteta/10</td> \n
                            </tr> \n
                            <tr> \n
                                <th>Vrsta</th> \n
                                <td>$vrsta</td> \n
                            </tr> \n
                            <tr> \n
                                <th>Prostorija</th> \n
                                <td>$prostorija</td> \n
                            </tr> \n
                            <tr> \n
                                <th>Slika</th> \n
                                <td><a href='../multimedija/$slika' target='_blank'>Prikaži</a></td> \n
                            </tr> \n
                            <tr> \n
                                <th>Poveznica</th> \n
                                <td><a href='$poveznica'>Klikni ovdje</a></td> \n
                            </tr> \n
                            <tr> \n
                                <th>Dostupno do</th> \n
                                <td>$dostupnost</td> \n
                            </tr> \n
                            <tr> \n
                                <th>Cijena</th> \n
                                <td>$cijena</td> \n
                            </tr> \n
                            <tr> \n
                                <th>Kontakt</th> \n
                                <td>$kontakt</td> \n
                            </tr> \n
                            <tr> \n
                                <th>Tjedan dostave</th> \n
                                <td>$dostava</td> \n
                            </tr> \n
                            <tr> \n
                                <th>Ažuriranje</th> \n
                                <td><a href='../obrasci/obrazac.php?id=$id'>Ažuriraj</a></td> \n
                            </tr> \n
                        </tbody> \n";
        }

        $rezultat = [$tablica, $mobitel];
        return $rezultat;
    }

    function PohraniSliku($image){
        if ($image['error'] > 0) {
            switch ($image['error']) {
                case 1: return 'Veličina slike jeveća od ' . ini_get('upload_max_filesize');
                case 2: return 'Veličina slike je veća od ' . $_POST["MAX_FILE_SIZE"];
                case 3: return 'Slika je djelomično prenesena';
                case 4: return 'Slika nije prenesena';
            }
        }
        
        if (preg_match('/image/i', $image['type']) == false) {
            return 'Datoteka ' . $image['name'] . ' nije u odgovarajućem formatu';
        }
        $upfile = '../multimedija/' . $image['name'];

        if (is_uploaded_file($image['tmp_name'])) {
            if (!move_uploaded_file($image['tmp_name'], $upfile)) {
                return 'Nije moguće prenijeti datoteku na odredište';
            }
        } else {
            return 'Mogući napad prijenosom - datoteka: ' . $image['name'];
        }

        return '';
    }
}
?>