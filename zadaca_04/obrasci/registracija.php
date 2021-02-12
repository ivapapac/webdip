<?php
    include ('../korisnik.class.php');
    include ('../zaglavlje.php');
    include ('../podnozje.php');
    $korisnik = new Korisnik();

    if(isset($_GET['korime'])){
        $rezultat = $korisnik->KorisnickoImePostoji($_GET['korime']);

        if($rezultat != null){
            $json['id'] = $rezultat[0];
            $json['username'] = $rezultat[1];
        }

        echo json_encode($json);
        exit;
    }

    if(isset($_GET['mail'])){
       $rezultat = $korisnik->EmailPostoji($_GET['mail']);

        if($rezultat != null){
            $XMLData = <<<XML
<user>
<id>$rezultat[0]</id>
<email>$rezultat[1]</email>
</user>
XML;
        }
        else{
            $XMLData = <<<XML
<user>
<email>0</email>
</user>
XML;
        }

        $xml = new SimpleXMLElement($XMLData);
        echo $xml->asXML();
        exit;
    }

    if(isset($_GET['korisnicko_ime']) && isset($_GET['email']) && !isset($_GET['submit'])){
        $podaci = $korisnik->DohvatiKorisnika($_GET['korisnicko_ime'], $_GET['email']);
        list($id, $ime, $prezime, $godina, $email, $korime, $lozinka, $lozinka_sha, $uloga) = $podaci->fetch_array();

        $json['id'] = $id;
        $json['ime'] = $ime;
        $json['prezime'] = $prezime;
        $json['godina'] = $godina;
        $json['email'] = $email;
        $json['korime'] = $korime;
        $json['lozinka'] = $lozinka;

        echo json_encode($json);
        exit;
    }

    if(isset($_GET['submit'])){
        $greska = '';
        $css = 'class="greska"';

        foreach($_GET as $key => $value){
            if(empty($value) && $key != 'submit' && $key != 'update' && $key != 'id'){
                $greska .= 'Polje ' . $key . ' ne smije biti prazno <br>';
                $smarty->assign($key, $css);
            }
            else if($key == 'korisnicko_ime'){
                $korime = $korisnik->KorisnickoImePostoji($value);

                if($korime != null){
                    $greska .= 'Korisnicko ime ' . $value . ' već postoji <br>';
                    $smarty->assign($key, $css);
                }
            }
            else if($key == 'email'){
                $email = $korisnik->EmailPostoji($value);

                if($email != null){
                    $greska .= 'Email ' . $value . ' već postoji <br>';
                    $smarty->assign($key, $css);
                }
            }
            else if($key == 'godina'){
                if($value < 1900 || $value > 2020){
                    $greska .= 'Godina rođenja mora biti u rasponu od 1900 do 2020 <br>';
                    $smarty->assign($key, $css);
                }
            }
            else if($key == 'lozinka'){
                if($value != $_GET['potvrdi_lozinku']){
                    $greska .= 'Lozinka i potvrda lozinke moraju biti jednake <br>';
                    $smarty->assign($key, $css);
                    $smarty->assign('potvrdi_lozinku', $css);
                }
            }
        }

        if(empty($greska)){
            $korisnik->UnesiKorisnika($_GET);
            if(count($_GET) > 7){
                $smarty->assign('poruka', 'Uspješna registracija');
            }
            else{
                $smarty->assign('poruka', 'Uspješno ažuriranje');
            }
        }
        else{
            $smarty->assign('greska', $greska);
        }
    }

    $smarty->display('../templates/zaglavlje.tpl');
    $smarty->display('../templates/registracija.tpl');
    $smarty->display('../templates/podnozje.tpl');
?>