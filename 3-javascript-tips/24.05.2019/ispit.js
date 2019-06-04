// https://jsbin.com/xeyudubiji/1/edit?js,console

// Ime i prezime: Edin Ja�arevi�

/* Zadatak 2. Koriste�i odgovaraju�i design pattern, 
   simulirajte blagajnu trgovine,
   tako da �ete svakom kupcu izra�unati koliko treba platiti. 
   Kupce i sadr�aj njihovih ko�arice pove�ite ID-jem kupca. 
   Pretpostavite da mo�e biti vi�e kupaca 
   koji mogu imati vi�e predmeta u ko�arici. (20 bodova) */

var Cashier = (function () {
  // private
  var kupci = ["marko", "ivan", "ana"];
  var kupacId = [2, 3, 4];
  var cart = {
      2: {
        mlijeko: { price: 2,    quantity: 3 },
        kruh:    { price: 1.4,  quantity: 2 },
        lizalo:  { price: 0.25, quantity: 15 }
      },
      3: {
        mlijeko: { price: 2,    quantity: 1 },
        kruh:    { price: 1.5,  quantity: 3 },
        lizalo:  { price: 0.25, quantity: 4 }
      },
      4: {
        zvake: { price: 1, quantity: 2 },
        sok:   { price: 3, quantity: 1 }
      }
    };

  function Pay(kupacId) {
    // implement pay method
    var sum = 0;

    for(var i in cart){
      if (i == kupacId){
        for(var o in cart[i]){
            sum = sum + (cart[i][o].price * cart[i][o].quantity);
        }
        break;
      }
    }
    return sum
  }
  
  function Kupac(kupacId){
    return kupci[kupacId];
  }
  
  return {
    // 
    pay: Pay,
    kupac: Kupac
  };  
  
}());

// Isprobati sa console.log();
console.log(Cashier.kupac(2), Cashier.pay(2));

// Zadatak 2. Refaktorirajte, optimizirajte 
// i prepravite sljede�i kod (40 bodova):
var Vehicle = (function (name, type, color, weight) {
    let namePrivate = name;
    let typePrivate = type;
    let colorPrivate = color;
    let weightPrivate = weight;
  
    function changeVehicleName (name) {
      namePrivate = name;
    }
  
    function changeVehicleType(type) {
      typePrivate = type;
    }
    function changeVehicleColor (color) {
      colorPrivate = color;
    }
    function changeVehicleWeight (weight) {
      weightPrivate = weight;
    }
    
    return {
      changeName:changeVehicleName,
      changeType:changeVehicleType,
      changeWeight:changeVehicleWeight,
      changeColor: changeVehicleColor      
    };
})();


var Car1 = Object.create(Vehicle);
Car1.changeType("Racing");
Car1.changeName("Audi");
Car1.changeColor("Blue");
Car1.changeWeight("1600kg");
console.log(Car1);
Car1.changeColor("Red");
console.log(Car1);
console.log(Car1.colorPrivate);



var Calculator = (function () {
    function sum (a, b) {
      return a + b;
    }
    
    function substract (a, b) {
      return a - b;
    }
    
    function divide (a, b) {
      return b !== 0 ? a/b : "Cannot divide with zero";
    }
    return {
      sum: sum,
      substract: substract,
      divide: divide
    };
})();

var calc = Object.create(Calculator);
console.log(calc.divide(7, 0));
console.log(calc.sum(7, 15));
console.log(calc.divide(16, 4));



function findSingleChar (searchChar, text) {
  
  for (var i in text) {
    if (text[i] === searchChar) {
      return true;
    }
  }
  
  return false;
}

console.log(findSingleChar('o', 'Hello world!'));



// Zadatak 3. Koriste�i odgovaraju�i design pattern, napravite metodu koja �e primati broj, 
// a pozivom javne metode pozvati odgovaraju�u privatnu metodu koja �e negativnom broju promijeniti predznak, 
// broj pove�ati za 7 ako je paran, smanjiti za 1 ako je neparan i nakon toga pomno�iti sa 7. (20 bodova)

function Broj (){
  this.metoda = function(broj){
    return even(apsulutno(broj)) * 7;    
  }
  
  var apsulutno = function(broj){
    return broj < 0 ? -(broj) : broj;
  }
  
  var even = function(broj){
    return broj % 2 === 0 ? (broj + 7) : (broj - 1);
  }
}
var b = new Broj();
console.log(b.metoda(1));
console.log(b.metoda(-2));



