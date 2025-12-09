function calcul_moyenne(){
    var n1 = prompt("Donner la premiere note :");
    var n2 = prompt("Donner la deuxieme note :");
    var n3 = prompt("Donner la troisieme note :");

    var somme = Number(n1) + Number(n2) + Number(n3);

    document.write("Voici la somme : " + somme + "<br>");
    var moyenne = somme/3;

    document.write("Voici la moyenne : " + moyenne + "<br>");
    if (moyenne < 10){
        document.write("Vous n'êtes pas admis");
    }
    else {
        document.write("Vous êtes admis");
    }
}




function test_age() {
    let age = prompt("Quelle st votre age ?");
    if (age < 18) {
        document.write("Vous êtes mineur");
        document.bgColor="red"
    }
    else{
                document.write("Vous êtes majeur");
        document.bgColor="green"
    }
}






function simple_affichage() {
    let name = prompt("Donner votre nom");
    let prenom = prompt("Donner votre prénom");

    document.write('<div style=" margin:auto; width:300px; border:2px solid blue;">');
    document.write("Bonjour" + prenom + " " + name);
    document.write("</div>");

}



