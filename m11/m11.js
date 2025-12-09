// Guilherme VIEIRA ABREU



function ajouterLigne() {
    // 1. Cloner la ligne modèle
    var modele = document.getElementById("modeleLigne");
    var newLi = modele.cloneNode(true);
    
    // 2. Enlever l'id pour éviter les doublons d'ID dans le DOM
    newLi.id = ""; 
    
    // 3. Réinitialiser les valeurs des inputs de la nouvelle ligne à 0 ou vide
    var inputs = newLi.getElementsByTagName('input');
    for(var i = 0; i < inputs.length; i++) {
        if(inputs[i].name === "desc") inputs[i].value = "Nouvelle ligne";
        else inputs[i].value = 0;
    }

    // 4. Insérer avant la dernière ligne 
    var lastLi = document.getElementById("lastLigne");
    var tbody = document.getElementById("table_body");
    
    // Utilisation de insertBefore 
    tbody.insertBefore(newLi, lastLi);
}


function remplir() {
    // Liste des descriptions imposée [cite: 47]
    const tabDesc = new Array("portable", "bureau", "ram 32go", "clef usb 16go", "souris ", "ecran 24 pouces");
    
    // Récupération des listes d'inputs [cite: 50]
    var listeDesc = document.getElementsByClassName("desc");
    var listeQte = document.getElementsByClassName("qte");
    var listePrix = document.getElementsByClassName("prix");

    // Boucle pour remplir chaque ligne visible
    for (var i = 0; i < listeDesc.length; i++) {
        // Description aléatoire
        var randDescIndex = Math.floor(Math.random() * tabDesc.length);
        listeDesc[i].value = tabDesc[randDescIndex];

        // Quantité aléatoire entre 1 et 10 [cite: 48, 52]
        listeQte[i].value = Math.floor(Math.random() * 10) + 1;

        // Prix aléatoire entre 1 et 100 [cite: 49]
        listePrix[i].value = Math.floor(Math.random() * 100) + 1;
    }
    
    // Optionnel : Lancer le calcul automatiquement après remplissage
    calculate();
}





function calculate() {
    // 1. Récupérer les listes d'inputs
    var listePrix = document.getElementsByClassName("prix");
    var listeQte = document.getElementsByClassName("qte");
    var listeTtl = document.getElementsByClassName("totalLigne"); // [cite: 53]

    var sousTotal = 0;







    // 2. Boucle pour calculer ligne par ligne et faire la somme [cite: 54]
    for (var i = 0; i < listePrix.length; i++) {
        // Utilisation de parseFloat pour gérer les décimales, ou parseInt selon consigne stricte [cite: 55]
        // Ici on utilise parseFloat pour être logique avec des prix, mais parseInt est mentionné dans le cours.
        var p = parseFloat(listePrix[i].value) || 0;
        var q = parseFloat(listeQte[i].value) || 0;
        
        var totalLigne = p * q;
        
        // Affichage du total de la ligne (2 décimales)
        listeTtl[i].value = totalLigne.toFixed(2);
        
        // Ajout au sous-total global
        sousTotal += totalLigne;
    }




    // 3. Mise à jour du champ Sous-Total [cite: 20]
    document.getElementById("sousTotal").value = sousTotal.toFixed(2);





    // 4. Récupération des paramètres comptables (Remise, Taxe, Expédition) [cite: 24]
    var remiseTaux = parseFloat(document.getElementById("remise").value) || 0;
    var taxTaux = parseFloat(document.getElementById("tauxImpot").value) || 0;
    var fraisPort = parseFloat(document.getElementById("fraisExp").value) || 0;

    // 5. Calculs finaux selon les formules [cite: 21, 22, 23]
    
    // Sous-Total moins remise = Sous-Total – (Sous-Total * Remise)
    var montantRemise = sousTotal * remiseTaux;
    var sousTotalRemise = sousTotal - montantRemise;
    document.getElementById("sousTotalRemise").value = sousTotalRemise.toFixed(2);







    // Taxe Totale = Sous-Total * Taux d’imposition [cite: 22]
    // Note: La consigne dit Sous-Total * Taux, mais logiquement la taxe s'applique souvent après remise. 
    // Cependant, respectons la consigne littérale : Taxe = Sous-Total * Taux
    var montantTaxe = sousTotal * taxTaux;
    document.getElementById("taxeTotale").value = montantTaxe.toFixed(2);





    // Solde = Sous-Total moins remise + Taxe Totale + Frais d’expédition [cite: 23]
    var soldeFinal = sousTotalRemise + montantTaxe + fraisPort;








    // Affichage du solde final
    document.getElementById("soldeDu").value = soldeFinal.toFixed(2) + "€";
}