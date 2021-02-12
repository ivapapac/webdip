// Funkcija pri pokretanju stranice
addEventListener("load", function LoadPage() {
    const nazad = document.getElementById("nazad");

    // Ispis prethodne stranice
    if (document.referrer.includes("index.html")) {
        nazad.innerHTML = "Početna";
    }

    if (document.referrer.includes("registracija.html")) {
        nazad.innerHTML = "Registracija";
    }

    if (document.referrer.includes("prijava.html")) {
        nazad.innerHTML = "Prijava";
    }

    if (document.referrer.includes("multimedija.html")) {
        nazad.innerHTML = "Multimedija";
    }

    if (document.referrer.includes("popis.html")) {
        nazad.innerHTML = "Popis";
    }

    if (document.referrer.includes("era.html")) {
        nazad.innerHTML = "ERA";
    }

    if (document.referrer.includes("navigacijski.html")) {
        nazad.innerHTML = "Navigacijski dijagrami";
    }

    // Učitavanje prethodne stranice
    nazad.addEventListener("click", function GoBack() {
        window.history.back();
    })

    const potvrdi = document.getElementById("potvrdi");
    potvrdi.disabled = true;
    const url = document.getElementById("link-kupnja");
    const mobile = document.getElementById("kontakt");
    
    // Pokretanje funkcije EnableSubmit() prilikom promjena u formi
    const obrazac = document.getElementById("obrazac");
    obrazac.addEventListener("change", function EnableSubmit() {
        var enableUrl = false;
        var enableMobile = false;
        potvrdi.disabled = true;
        
        if ((url.value.indexOf("http://") === 0 || url.value.indexOf("https://") === 0)
            && !url.value.includes("https://.") && !url.value.includes("http://.")
            && !url.value.includes("..") && url.value.indexOf(".hr") === url.value.length - 3) {
            enableUrl = true;
        }

        if ((mobile.value[0] == "+" || (mobile.value[0] == 0 && mobile.value[1] == 0))
            && mobile.value.length <= 14) {
            for (i = 1; i < mobile.value.length; i++) {
                for (j = 0; j < 10; j++) {
                    if (mobile.value[i] == j) {
                        enableMobile = true;
                        break;
                    }
                    else if (mobile.value[i] != j && j == 9) {
                        enableMobile = false;
                    }
                }

                if (!enableMobile) {
                    break;
                }
            }
        }

        if (enableUrl && enableMobile) {
            potvrdi.disabled = false;
        }
    })

    var selectedColor = document.getElementById("boja");
    selectedColor.value = "#FFFFFF";

    // Promjena boje pozadine stranice (color)
    selectedColor.addEventListener("input", function ChangeColor() {
        document.body.style.backgroundColor = selectedColor.value;
    })
    
    var checkedColors = document.getElementById("check-boje");

    // Promjena boje pozadine stranice (checkbox)
    checkedColors.addEventListener("input", function ChangeCheckedColors() {
        var r = document.getElementById("crvena").checked;
        var g = document.getElementById("zelena").checked;
        var b = document.getElementById("plava").checked;

        if (r) {
            document.body.style.backgroundColor = "#FF0000";
            selectedColor.value = "#FF0000";
            selectedColor.disabled = true;
        }

        if (g) {
            document.body.style.backgroundColor = "#00FF00";
            selectedColor.value = "#00FF00";
            selectedColor.disabled = true;
        }

        if (b) {
            document.body.style.backgroundColor = "#0000FF";
            selectedColor.value = "#0000FF";
            selectedColor.disabled = true;
        }

        if (r && g) {
            document.body.style.backgroundColor = "#FFFF00";
            selectedColor.value = "#FFFF00";
        }

        if (r && b) {
            document.body.style.backgroundColor = "#FF00FF";
            selectedColor.value = "#FF00FF";
        }

        if (g && b) {
            document.body.style.backgroundColor = "#00FFFF";
            selectedColor.value = "#00FFFF";
        }

        if (r && g && b) {
            document.body.style.backgroundColor = "#000000";
            selectedColor.value = "#000000";
        }

        if (!r && !g && !b) {
            document.body.style.backgroundColor = "#FFFFFF";
            selectedColor.value = "#FFFFFF";
            selectedColor.disabled = false;
        }
    })
})
