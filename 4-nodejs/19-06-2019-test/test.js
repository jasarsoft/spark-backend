// Ime i prezime:
// Napomene: Vrijeme trajanja testa je 1 sat i 45 minuta. Prolaz je 50%. Dopušteno je korištenje 
// interneta i materijala s predavanja, ali nije dopušten nikakav oblik varanja, 
// uključujući prepisivanje od drugih.


// Zadatak 1. (5 bodova)
// Napraviti funkciju za asinkroni dohvat podataka. Funkcija ima 2 parametra "url" i 
// "callback". Dohvatiti JSON sa linka https://api.myjson.com/bins/1fqs01 i pozvati callback
// (funkcija za obradu podataka).
function getData(url, callback){
	var xhttp = new XMLHttpRequest();
  
 xhttp.onreadystatechange = function(){
 	if(xhttp.readyState == 4 && xhttp.status == 200){
    callback(JSON.parse(xhttp.response));
  } 	
 }
 xhttp.open("GET", url, true);
 xhttp.send();
}
function openFunction(data){
	//printGame(data);
  reviewSet(data);
}

// Zadatak 2. (5 bodova)
// Napišite funkciju koja će proći kroz igre i ispisati ime igre i vrijeme izlaska 
// ( u obliku: ime igre - vrijeme izlaska)
function printGame(data){
	Object.keys(data).forEach(function(elem){
  	var game = data[elem];
  	console.log(game.name + " - " + game.additional.release_date);
  });
}

// Zadatak 3. (20 bodova)
// a. Napisati funkciju koja će proći kroz sve igre i ispisati one koje još nisu izašle (10 bodova)
// b. Izračunati koliko je još dana preostalo do izlaska igara koje nisu izašle (10 bodova)


// Zadatak 4. (10 bodova)
// Napisati funkciju koja će primati po jedan objekat "game" te ispisati ime, broj platformi na kojima igra izlazi,
// te nazive tih platformi. Objekte igara proslijeđivati iz glavnog programa (funkcija za obradu podataka).

// 5. Zadatak (20 bodova)
// a. Napisati funkciju koja je će proći kroz sve igre, za svaku igru ispisati koliko ukupno ima review-ova, 
// te u postotku koliko pozitivnih a koliko negativnih (15 bodova)
// b. Ispisati igru koja je po review-ovima najbolje ocjenjena po postotku (5 bodova)
function reviewSet(data){
	var postotak_Pozitive = 0,
  		postotak_Negative = 0,
      bestRate = -Infinity,
      nazivGame;
  
	Object.keys(data).forEach(function(el){
   	var game = data[el];	
    var sum_reviews = game.reviews.positive + game.reviews.negative;

  	if(game.reviews.positive > 0 && game.reviews.negative > 0){
    	postotak_Pozitive = parseFloat(game.reviews.positive/sum_reviews) * 100;
      postotak_Negative = parseFloat(game.reviews.negative/sum_reviews) * 100;
    }
    if(postotak_Pozitive > bestRate){
    	bestRate = postotak_Pozitive;
      nazivGame = game.name;
    }
    console.log(game.name + " : "+ sum_reviews +" reviews.");
    console.log("Pozitivni: "+ postotak_Pozitive.toFixed(2)+" %");
    console.log("Negativni: "+ postotak_Negative.toFixed(2)+" %");
  });
  console.log(nazivGame + " ima najbolji rejting: "+ bestRate);
}

// 6. Zadatak (20 bodova)
// Napisati funkciju koja će izračunati koliko koja platforma ima igara koje će izaći na njoj.
// Ispisati platforme sortirane od najmanje zastupljenije do najzastupljenije






getData("https://api.myjson.com/bins/1fqs01", openFunction);
