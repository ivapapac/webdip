$(document).ready(function (){

    var korime = document.getElementById('username');
    var email = document.getElementById('email');
    var gumb = document.getElementById('azuriraj');
    var id = document.getElementById('id');
    var ime = document.getElementById('fname');
    var prezime = document.getElementById('lname');
    var godina = document.getElementById('birthyear');
    var lozinka = document.getElementById('password');
    var potvrdi = document.getElementById('rpassword');
    var gumb2 = document.getElementById('potvrdi')

    var korime_id = -1;
    var email_id = 0;

    $(korime).keyup(function () {
        korime_id = -1;

        $.ajax({
            data: {korime: korime.value},
            method: 'GET',
            dataType: 'json',

            error: function (){
                korime.style = 'border: solid 1.5px green';
                Provjeri();
            },

            success: function (data) {
                korime.style = 'border: solid 1.5px red';
                korime_id = data.id;
                Provjeri();
            }
        })
    })

    $(email).keyup(function () {
        email_id = 0;

        $.ajax({
            data: {mail: email.value},
            type: 'GET',
            dataType: 'xml',

            success: function (xml) {
                if($(xml).find('email').text() == 0){
                    email.style = 'border: solid 1.5px green';
                    Provjeri();
                }
                else{
                    email.style = 'border: solid 1.5px red';
                    email_id = $(xml).find('id').text();
                    Provjeri();
                }
            }
        })
    })

    $(gumb).click(function () {
        $.ajax({
            url: 'http://barka.foi.hr/WebDiP/2019/zadaca_04/ipapac/obrasci/registracija.php',
            data: {korisnicko_ime: korime.value, email: email.value},
            type: 'GET',
            dataType: 'json',

            success: function (korisnik) {
                id.value = korisnik.id;
                ime.value = korisnik.ime;
                prezime.value = korisnik.prezime;
                korime.value = korisnik.korime;
                godina.value = korisnik.godina;
                email.value = korisnik.email;
                lozinka.value = korisnik.lozinka;
                potvrdi.value = korisnik.lozinka;

                email.disabled = true;
                korime.disabled = true;
                gumb2.innerHTML = 'AŽURIRAJ';

                gumb.style = 'display: none';
                korime.style = 'border: auto';
                email.style = 'border: auto';
            }
        })
    })

    function Provjeri(){
        if(korime_id == email_id){
            gumb.style = 'display: block';
        }
        else {
            gumb.style = 'display: none';
        }
    }
})