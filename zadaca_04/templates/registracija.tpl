<div class='registracija'>
    {if isset($poruka)}
        <p class='uspjeh2'>{$poruka}</p>
    {/if}
    {if isset($greska)}
        <p class='ispis-greske'>{$greska}</p>
    {/if}
    <form novalidate class='registracija-obrazac' method='GET' action='registracija.php'>
        <input type='hidden' id='id' name='id'>
        <label for='fname'>Ime</label>
        <input type='text' id='fname' name='ime' required {if isset($ime)}{$ime}{/if}
        {if isset($smarty.get.ime)}value='{$smarty.get.ime}'{/if}><br>
        <label for='lname'>Prezime</label>
        <input type='text' id='lname' name='prezime' required {if isset($prezime)}{$prezime}{/if}
        {if isset($smarty.get.prezime)}value='{$smarty.get.prezime}'{/if}><br>
        <label for='username'>Korisničko ime</label>
        <input type='text' id='username' maxlength='15' name='korisnicko_ime' required
        {if isset($korisnicko_ime)}{$korisnicko_ime}{/if}
        {if isset($smarty.get.korisnicko_ime)}value='{$smarty.get.korisnicko_ime}'{/if}><br>
        <label for='birthyear'>Godina rođenja</label>
        <input type='number' id='birthyear' min='1900' max='2020' value='2000' name='godina' required
        {if isset($godina)}{$godina}{/if}
        {if isset($smarty.get.godina)}value='{$smarty.get.godina}'{/if}><br>
        <label for='email'>Email</label>
        <input type='email' id='email' name='email' required {if isset($email)}{$email}{/if}
        {if isset($smarty.get.email)}value='{$smarty.get.email}'{/if}><br>
        <button type='button' id='azuriraj'>Omogući ažuriranje</button>
        <label for='password'>Lozinka</label>
        <input type='password' id='password' name='lozinka' required {if isset($lozinka)}{$lozinka}{/if}><br>
        <label for='rpassword'>Potvrdi lozinku</label>
        <input type='password' id='rpassword' name='potvrdi_lozinku' required
        {if isset($potvrdi_lozinku)}{$potvrdi_lozinku}{/if}><br>
        <button type='submit' name='submit' id='potvrdi'>DODAJ</button>
    </form>
</div>