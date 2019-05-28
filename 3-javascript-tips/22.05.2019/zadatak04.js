// Napisati metodu za izračun zbroja vrijednosti elemenata arraya
// Napisati metodu koja će vratiti broj parnih i broj neparnih elemenata arraya
// Napisati metodu koja će vratiti prosječnu vrijednost u arrayu

var roundResults = [
    10, 22, 35, 5, 8, 1, 42, 3, 25, 4, 33, 41, 2, 
    6, 17, 22, 30, 44, 37, 9, 18, 7, 14, 31, 23, 
    11, 32, 15, 20, 13, 11,  36, 21, 16, 12];

var zbroj = function(param){
let sum = 0;
for(let i = 0; i < param.length; i++){
  sum += param[i];
}

return sum;
}
console.log('Suma: ' + zbroj(roundResults));

var parniNeparni = function(param){
let parni = 0;
let neparni = 0;
for (let i = 0; i < param.length; i++){
param[i] % 2 === 0 ? parni += 1 : neparni += 1;
}
console.log('Broj parnih: ' + parni, 'Broj neparnih: ' + neparni);
}(roundResults);


var prosjek = function(param){
let sum = zbroj(param);
return sum / param.length;
}
console.log("Prosjek: " + prosjek(roundResults));

