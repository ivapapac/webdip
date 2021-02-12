<?php
    include ('../zaglavlje.php');
    include ('../podnozje.php');
    include('../vanjske_biblioteke/baza.class.php');

    $baza = new Baza();

    if(isset($_GET['submit'])){
        $korisnicko_ime = $_GET['korisnicko_ime'];
        $sol = '465165jdnso51655';
        $lozinka = sha1($sol . $_GET['lozinka']);
        $greska = '';
        $css = 'class="greska"';

        foreach ($_GET as $key => $value) {
            if (empty($value) && $key !== 'submit'){
                $greska .= 'Polje ' . $key . ' ne smije biti prazno <br>';
                $smarty->assign($key, $css);
            }
        }

        if(empty($greska)){
            $baza->spojiDB();

            $upit = "SELECT `korisnicko_ime`, `uloga` FROM `DZ4_Korisnik`
                    WHERE `korisnicko_ime` = '$korisnicko_ime' AND `lozinka_sha1` = '$lozinka'";

            $rezultat = $baza->selectDB($upit)->fetch_array();

            if(isset($rezultat) && empty($_SESSION)){
                Sesija::kreirajKorisnika($korisnicko_ime, $rezultat[1]);
                header('Location: ../ostalo/popis.php');
            }
            else if(!empty($_SESSION)){
                $smarty->assign('poruka', 'Već ste prijavljeni!');
            }
            else{
                $smarty->assign('poruka', 'Neuspješna prijava, pokušajte ponovo!');
            }

            $baza->zatvoriDB();
        }
        else{
            $kolacic = $_COOKIE['korime'];
            $smarty->assign('greska', $greska);
        }
    }

    $smarty->display('../templates/zaglavlje.tpl');
    $smarty->display('../templates/prijava.tpl');
    $smarty->display('../templates/podnozje.tpl');
?>
