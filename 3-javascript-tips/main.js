function Auto (naziv,boja,kilometraza,prosjek){
    this.naziv = naziv;
    this.boja = boja;
    this.kilometraza = kilometraza;
    this.prosjek = prosjek;
  
}

Auto.prototype.vozi = function(){
    return this.kilometraza += 5;
}

Auto.prototype.potrosnja = function(){
    return this.gorivo -= this.prosjek;
}
var first = new Auto('Peugeot','Siva',100000,5.2);
var second = new Auto('Volvo','Crna',65000,11.3);


first.gorivo= 30;
second.gorivo = 74;



console.log(first);
console.log(second);

first.vozi();
first.potrosnja();

second.vozi();
second.potrosnja();

console.log(`Gorivo ${second.gorivo}
Kilometraza: ${second.kilometraza}`);


