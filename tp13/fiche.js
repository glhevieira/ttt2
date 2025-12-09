
function  multiplication()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = document.getElementById("t3").value;
    var d = Number(b) * Number(c);
    document.getElementById("t4").value = c;
}
function reset() {
  document.getElementById("t1").value = "";
  document.getElementById("t2").value = "";
  document.getElementById("t3").value = "";
  document.getElementById("resultat").value = "";
}