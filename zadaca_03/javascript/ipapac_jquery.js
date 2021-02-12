$(document).ready(function LoadPage() {
    var naslov = $(document).find("title").text();

    switch (naslov) {
        case "Popis":
            LoadAutocomplete("../json/search.json");
            Popis();
            break;

        case "Registracija":
            LoadAutocomplete("../json/search.json");
            Registracija();
            break;

        case "Početna stranica": case "Navigacijski dijagrami": case "ERA dijagram":
            LoadAutocomplete("json/search.json");
            break;

        case "Multimedija": case "Prijava": case "Dodavanje novog sadržaja":
            LoadAutocomplete("../json/search.json");
            break;
    }


    // jQuery za popis.html
    function Popis() {
        var korisniciBody = document.querySelector("#popis-korisnika tbody");
        $.ajax({
            url: "https://barka.foi.hr/WebDiP/2019/materijali/zadace/dz3/userNameSurname.php?all",
            type: "GET",
            dataType: "xml",

            success: function (xml) {
                $(xml).find("user").each(function CreateRow() {
                    var name = document.createElement("td");
                    name.textContent = $(this).find("name").text();

                    var surname = document.createElement("td");
                    surname.textContent = $(this).find("surname").text();

                    var email = document.createElement("td");
                    var emailLink = document.createElement("a");
                    email.appendChild(emailLink);
                    emailLink.textContent = $(this).find("email").text();
                    emailLink.setAttribute("href", "#");

                    var image = document.createElement("td");
                    var imageTag = document.createElement("img");
                    image.appendChild(imageTag);
                    imageTag.setAttribute("src", "../" + $(this).find("image").text());
                    imageTag.setAttribute("alt", "Slika ne postoji!");

                    // Dodavanje ćelija u redak
                    var newRow = document.createElement("tr");
                    newRow.appendChild(name);
                    newRow.appendChild(surname);
                    newRow.appendChild(email);
                    newRow.appendChild(image);

                    // Dodavanje retka u tablicu
                    korisniciBody.appendChild(newRow);
                });

                var poveznice = korisniciBody.getElementsByTagName("tr");
                // Prolazimo kroz svaki redak u tablici
                $(poveznice).each(function OnClick() {
                    // Spremanje podataka u varijable za kolačiće
                    var findName = this.cells[0].innerHTML;
                    var findSurname = this.cells[1].innerHTML;
                    var findEmail = $(this).find("a").text();
                    var findImage = $(this).find("img").attr("src");

                    // Klikom na email šalje se jQuery zahtjev
                    $(this).find("a").click(function SendRequest() {
                        $.ajax({
                            url: "https://barka.foi.hr/WebDiP/2019/materijali/zadace/dz3/userNameSurname.php?name=" + findName + "&surname=" + findSurname,
                            type: "GET",
                            dataType: "xml",

                            success: function (xml) {
                                var username = $(xml).find("username").text();
                                var code = $(xml).find("code").text();

                                if (username == 0) {
                                    alert("Korisnik ne postoji!");
                                }

                                else if (username !== 0 && code === "") {
                                    alert("Aktivacijski kod za korisnika " + username + " ne postoji!");
                                }

                                else {
                                    //Spremanje podataka o korisniku u kolačiće
                                    document.cookie = "name=" + findName + "; path=/";
                                    document.cookie = "surname=" + findSurname + "; path=/";
                                    document.cookie = "username=" + username + "; path=/";
                                    document.cookie = "code=" + code + "; path=/";
                                    document.cookie = "email=" + findEmail + "; path=/";
                                    document.cookie = "image=" + findImage + "; path=/";
                                    window.open("../obrasci/registracija.html", "_self");
                                }
                            }
                        });
                    });
                });

                $("#popis-korisnika").DataTable();
            }
        });
    }

    // jQuery za registracija.html
    function Registracija() {
        // Čitanje iz kolačića
        start = "name=";
        pozicija = document.cookie.indexOf("name=");
        var fname = document.getElementById("fname");
        fname.value = document.cookie.substring(
            pozicija + start.length, document.cookie.indexOf(";", pozicija)
        );

        start = "surname=";
        pozicija = document.cookie.indexOf("surname=");
        var lname = document.getElementById("lname");
        lname.value = document.cookie.substring(
            pozicija + start.length, document.cookie.indexOf(";", pozicija)
        );

        start = "username=";
        pozicija = document.cookie.indexOf("username=");
        var username = document.getElementById("username");
        username.value = document.cookie.substring(
            pozicija + start.length, document.cookie.indexOf(";", pozicija)
        );

        start = "email=";
        pozicija = document.cookie.indexOf("email=");
        var email = document.getElementById("email");
        email.value = document.cookie.substring(
            pozicija + start.length, document.cookie.indexOf(";", pozicija)
        );

        // Provjeravanje korisnika u JSON datoteci
        var password = document.getElementById("password");
        var fnameCorrect = false;
        var lnameCorrect = false;
        var usernameCorrect = false;
        var emailCorrect = false;
        var passCorrect = false;

        $(password).keydown(function PasswordKey() {
            $.getJSON("../json/users.json", function LoadUsers(users) {
                $(users).each(function CheckUser() {
                    if (fname.value === this.name) {
                        fnameCorrect = true;
                    }

                    if (lname.value === this.surname) {
                        lnameCorrect = true;
                    }

                    if (username.value === this.username) {
                        usernameCorrect = true;
                    }

                    if (email.value === this.email) {
                        emailCorrect = true;
                    }

                    if (fnameCorrect && lnameCorrect && usernameCorrect && emailCorrect) {
                        if (password.value === this.password) {
                            passCorrect = true;
                        }
                        return false; // izađi iz petlje kad se pronađe korisnik
                    }
                });
            });
        });

        // Varijable za provjeravanje ispravnosti polja za unos
        var potvrdi = document.getElementById("potvrdi");
        var rePassword = document.getElementById("rpassword");
        var birthday = document.getElementById("birthyear");
        var mobile = document.getElementById("kontakt");
        var url = document.getElementById("link");

        // RegExp za telefon i url
        var plus = /^\+[0-9]{0,13}$/im;
        var zeros = /^00[0-9]{0,12}$/im;

        var first = /^https:\/\//im;
        var second = /^http:\/\//im;
        var third = /^https:\/\/\./im;
        var fourth = /^http:\/\/\./im
        var fifth = /\.\./im;
        var sixth = /\.hr$/im;

        // Provjeri polja prije slanja obrasca
        $(potvrdi).click(function OnSubmit() {
            if (!fnameCorrect) {
                fname.style = "border: solid 1.5px red;";
                password.value = "";
                rePassword.value = "";
                event.preventDefault();
            }

            if (!lnameCorrect) {
                lname.style = "border: solid 1.5px red;";
                password.value = "";
                rePassword.value = "";
                event.preventDefault();
            }

            if (!usernameCorrect) {
                username.style = "border: solid 1.5px red;";
                password.value = "";
                rePassword.value = "";
                event.preventDefault();
            }

            if (!emailCorrect) {
                email.style = "border: solid 1.5px red;";
                password.value = "";
                rePassword.value = "";
                event.preventDefault();
            }

            if (birthday.value === "" || birthday.value < 1990 || birthday.value > 2020) {
                birthday.style = "border: solid 1.5px red;";
                event.preventDefault();
            }

            if (!passCorrect) {
                password.style = "border: solid 1.5px red;";
                password.value = "";
                rePassword.value = "";
                event.preventDefault();
            }

            if (password.value !== rePassword.value) {
                password.style = "border: solid 1.5px red;";
                rePassword.style = "border: solid 1.5px red;";
                password.value = "";
                rePassword.value = "";
                event.preventDefault();
            }

            if (!((plus.test(mobile.value) || zeros.test(mobile.value)))) {
                mobile.style = "border: solid 1.5px red;";
                event.preventDefault();
            }

            if (!((first.test(url.value) || second.test(url.value))
                && !third.test(url.value) && !fourth.test(url.value)
                && !fifth.test(url.value) && sixth.test(url.value))) {
                url.style = "border: solid 1.5px red;";
                event.preventDefault();
            }
        });

        $(document).submit(function DeleteCookies() {
            document.cookie = "name= ; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            document.cookie = "surname= ; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            document.cookie = "username= ; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            document.cookie = "email= ; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            document.cookie = "code= ; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            document.cookie = "image= ; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
        })

        // Ažuriraj obrub poljima prilikom ponovnog unosa
        $(fname).keydown(function StyleName() {
            fname.style = "border: auto;";
        });

        $(lname).keydown(function StyleSurname() {
            lname.style = "border: auto;";
        });

        $(username).keydown(function StyleUsername() {
            username.style = "border: auto;";
        });

        $(email).keydown(function StyleEmail() {
            email.style = "border: auto;";
        });

        $(password).keydown(function StylePassword() {
            password.style = "border: auto;";
            rePassword.style = "border: auto;";
        });

        $(birthday).keydown(function StyleBirthday() {
            birthday.style = "border: auto;";
        });

        $(mobile).keydown(function StyleMobile() {
            mobile.style = "border: auto;";
        });

        $(url).keydown(function StyleUrl() {
            url.style = "border: auto;";
        });
    }

    // jQuery UI Autocomplete
    function LoadAutocomplete(file) {
        var search = new Array();
        $.post(file, function LoadSearch(data) {
            $(data).each(function (val) {
                search.push(data[val]);
            });
        });

        $("#search").autocomplete({
            source: search
        });
    }
})