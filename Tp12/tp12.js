function calcul_moyenne(){
    var n1 = prompt("Donner la premiere note :");
    var n2 = prompt("Donner la deuxieme note :");
    var n3 = prompt("Donner la troisieme note :");

    var somme = Number(n1) + Number(n2) + Number(n3);

    document.write("Voici la somme : " + somme + "<br>");
    var moyenne = somme/3;

    document.write("Voici la moyenne : " + moyenne + "<br>");
    if (moyenne < 10){
        document.write("Redoublant");
         }

        if (moyenne < 12){
        document.write(" Admis – Passable");
    }
      if (moyenne < 14){
        document.write("Admis – Bien");
         }
    else {
        document.write("Admis – Très bien");
    }
    document.write('<br>');
     document.write('<a href="index.html">retour</a>');
}







function test_temperature() {
    let temp = prompt("température (en °C)");
    if (temp < 10) {
        document.write("froid");
        document.bgColor="blue"
    }
    else if (temp < 25) {
        document.write("normal");
        document.bgColor="green"
    }
    else{
                document.write("chaud");
        document.bgColor="red"
    }
    document.write('<br>');
    document.write('<a href="index.html">retour</a>');
}







function comparaison_deux_nombre(){
    var n1 = prompt("Donner un nombre :");
    var n2 = prompt("Donner un nombre :");

    if (n1 > n2){
       document.write("le plus grand est " + n1 + " et le plus petit est"+ n2);
}
         else if  ( n1 < n2 ){{
        document.write("le plus grand est " + n2 + " et le plus petit est"+ n1);
        }
        }
            else{
                document.write("les deux nombres sont égaux.")
            }
            document.write('<br>');
            document.write('<a href="index.html">retour</a>');

    }

    








