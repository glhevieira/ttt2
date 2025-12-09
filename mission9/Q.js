// Nom & prénom : [VIEIRA ABREU Guilherme]

// Réponses correctes 
const bonnesReponses = {
    q1: ["HTML"],
    q2: ["HTML", "JS"],
    q3: ["CSS"],
    q4: ["JS"],
    q5: ["Chrome", "Firefox"],
    q6: ["C"],
    q7: ["PHP"],
    q8: ["img"],
    q9: ["Version"],
    q10: ["Windows", "Linux"]
};

//  Correction

function testqcm() {
    let score = 0;

    for (let q in bonnesReponses) {
        let correct = bonnesReponses[q];
        let selected = [...document.querySelectorAll(`input[name="${q}"]:checked`)].map(x => x.value);

        if (arraysEqual(correct.sort(), selected.sort())) {
            score++;
        }
    }

    document.getElementById("resultat").textContent =
        "Score : " + score + " / 10";
}

function arraysEqual(a, b) {
    return JSON.stringify(a) === JSON.stringify(b);
}

//  Corrigé
function ouvrirCorrige() {
    const win = window.open("corrige.html", "corrige", "width=500,height=500");
    if (!win) alert("Active les popups pour afficher le corrigé !");
}