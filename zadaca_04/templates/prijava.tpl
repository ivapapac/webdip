    <div class='prijava'>
        <p>
            {if isset($poruka)}{$poruka}{/if}
            {if isset($greska)}{$greska}{/if}
        </p>
        <form novalidate class='prijava-obrazac' method='GET' action='prijava.php'>
            <label for='username'>Korisničko ime</label>
            <input type='text' id='username' maxlength='15' name='korisnicko_ime' required
            {if isset($korisnicko_ime)}{$korisnicko_ime}{/if}
            {if isset($smarty.get.korisnicko_ime)}value='{$smarty.get.korisnicko_ime}'{/if}><br>
            <label for='password'>Lozinka</label>
            <input type='password' id='password' name='lozinka' required {if isset($lozinka)}{$lozinka}{/if}><br>
            <div class='gumbi'>
                <button type='submit' name='submit' class='potvrdi-btn'>POTVRDI</button>
                <button type='reset' class='odustani-btn'>ODUSTANI</button>
            </div>
        </form>
    </div>

    <div class='korisnici'>
        Admin: ipapac lozinka <br>
        Moderator: pperic 1234 <br>
        Registrirani korisnik: aanic 1111 <br>
    </div>

