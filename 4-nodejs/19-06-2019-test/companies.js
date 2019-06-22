/* Dohvatite podatke o kompanijama sa linka https://output.jsbin.com/figukid/8.json.
  Kreirajte modul u kojem će se nalaziti funkcije zadužene za rad sa dobijenim
podacima. Napišite funkciju za ispis dobijenih podataka (unutar modula) */

const fs = require("fs");

module.exports = {
  ispisPodataka(companies) {
    console.log(companies);
  },

  /* 

    Napišite funkciju koja će pronaći i ispisati:

    Naziv kompanije sa najmanjom vrijednošću, 

    Naziv kompanije sa najvećom vrijednošću

    Prosječnu vrijednost 

*/
  minmax(companies) {
    let min = companies[0],
      max = companies[0],
      total = 0;

    companies.map(c => {
      if (min.value > c.value) {
        min = c;
      }

      if (max.value < c.value) {
        max = c;
      }

      total += c.value;
    }, 0);

    console.log(total / companies.length, 'Lowest value company ' + min.name, ' Highest value company' +  max.name);
  },
/* Napišite funkciju koja će izračunati koliko godina svaka firma postoji, i taj podatak dodati u
objekte kao "age". Izračunati prosječnu starost firmi.*/
  godineFirme(companies) {
    let total = 0;

    companies.map(c => {
      const registered = new Date(c.registered);
      const now = new Date();

      const diffMS = now.getTime() - registered.getTime();
      const age = Math.floor(diffMS / (1000 * 60 * 60 * 24 * 365));
      c.age = age;

      total += age;
    }, 0);

    console.log(total / companies.length);
  },
  /*Kreirajte folder companies i unutar kreiranog foldera kreirajte
file u koji ćete upisati podatke o firmama grupiranim po državi (u objektu kreirati niz kompanija po državi). Preko terminala tražiti unos naziva file-a*/
  create_folder:function(data){
    const fse = require('fs-extra');
    const readline = require('readline');
    const dir = 'companies';
  
    const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
    });
  
  
  fse.ensureDir(dir, err => {
    console.log(err);
  
    rl.question('Enter file a name: ', (answer) => {
      
    
    fse.writeFile('companies/'+ answer, JSON.stringify(data), (err) => {
      if (err) throw err;
      console.log('The file has been saved!');
  });
  
   rl.close();
  });
  
  })
  },
  

/* Napišite funkciju koja ce izračunati koja firma se nalazi najbliže Mostaru i ispišite podatke
o toj firmi*/
najblizaFirmaMostaru(firma){
  const geo = require('geolib');
  let najbliza = firma[0];
  let prvaDist = geo.getDistance(
      {latitude: 43.343033, longitude: 17.807894}, 
      {latitude: firma[0].latitude, longitude: firma[0].longitude}
  );
  
  firma.map(singleOne => {
      let tempDist = geo.getDistance(
          {latitude: 43.343033, longitude: 17.807894}, 
          {latitude: singleOne.latitude, longitude: singleOne.longitude}
      );
      if(tempDist < prvaDist){
          najbliza = singleOne;
          prvaDist = tempDist;
      }
  });

  console.log(`Najbliza kompanija Mostaru je: ${najbliza.name}`);
}
}
