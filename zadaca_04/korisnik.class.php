<?php
include ('../vanjske_biblioteke/baza.class.php');
class Korisnik{
    private $baza;

    function __construct() {
        $this->baza = new Baza();
        $this->baza->spojiDB();
    }

    function __destruct() {
        $this->baza->zatvoriDB();
    }

    function KorisnickoImePostoji($korime){
        $upit = "SELECT `korisnik_id`, `korisnicko_ime` FROM `DZ4_Korisnik` WHERE `korisnicko_ime` = '$korime'";
        $rezultat = $this->baza->selectDB($upit)->fetch_array();

        return $rezultat;
    }

    function EmailPostoji($email){
        $upit = "SELECT `korisnik_id`, `email` FROM `DZ4_Korisnik` WHERE `email` = '$email'";
        $rezultat = $this->baza->selectDB($upit)->fetch_array();

        return $rezultat;
    }

    function DohvatiKorisnika($korime, $email){
        $upit = "SELECT * FROM `DZ4_Korisnik` WHERE `email` = '$email' AND `korisnicko_ime` = '$korime'";
        return $this->baza->selectDB($upit);
    }

    function UnesiKorisnika($korisnik){
        $ime = $korisnik['ime'];
        $prezime = $korisnik['prezime'];
        $godina = $korisnik['godina'];
        $lozinka = $korisnik['lozinka'];
        $sol = '465165jdnso51655';
        $lozinka_sha = sha1($sol . $korisnik['lozinka']);

        if(!empty($korisnik['id'])){
            $id = $korisnik['id'];

            $upit = "UPDATE `DZ4_Korisnik` SET `ime`='$ime',`prezime`='$prezime',`godina_rodenja`={$godina},
            `lozinka`='$lozinka',`lozinka_sha1`='$lozinka_sha' WHERE `korisnik_id`=$id";

            $this->baza->updateDB($upit);
        }
        else{
            $email = $korisnik['email'];
            $korime = $korisnik['korisnicko_ime'];

            $upit = "INSERT INTO `DZ4_Korisnik` (`ime`, `prezime`, `godina_rodenja`, `email`, `korisnicko_ime`, `lozinka`, 
            `lozinka_sha1`, `uloga`) VALUES ('$ime', '$prezime', {$godina}, '$email', '$korime', '$lozinka', '$lozinka_sha', 3)";

            $this->baza->updateDB($upit);
        }
    }
}
?>
