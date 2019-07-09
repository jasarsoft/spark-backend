const fse = require('fs-extra');
const readline = require('readline');


module.exports = {
    //Zadatak 1
    //Dohvatiti podatke sa urla: http://output.jsbin.com/yoluyoqowa.json. Kreirati modul i unutar njega funkciju koja ce vratiti sve igre. 
    //Ispisati poziv funkcije. - 20 bodova
    gameNames(data){
        games = [];
        data.forEach(element => {
            //
            games.push(element.name);
        });

        return games;
    },

    //Zadatak 2
    //Pronaci igru:
    //  Sa najmanjim ratingom
    //  Sa najvecim ratingom
    //  Ispisati prosjecni rating. - 15 bodova
    maxMinAvg(data){
        let minVal = data[0],
            maxVal = data[0],
            total = 0;

    data.map(g => {
      if (minVal.rating > g.rating) {
        minVal = g;
      }

      if (maxVal.rating < g.rating) {
        maxVal = g;
      }

      total += g.rating;
    }, 0);

    console.log(`Rating avarage: ${total / data.length}`);
    console.log(`Rating min: ${minVal.name}`);
    console.log(`Rating max: ${maxVal.name}`);
    },


    //zadatak 3
    //Kreirati folder, i unutar njega file. 
    //Pitati za naziv file-a i unutar njega ispisati JSON sa sve platforme i 
    //igre koje su na toj platformi. - 25 bodova
    outputFile:function(data){
      const dir = 'output';
      
        
      const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
      });
      
      
      fse.ensureDir(dir, err => {
        if (err){
          throw err  
        }
        
        rl.question('File name: ', (answer) => {
          let platform = {
            ps : [],
            xbox : [],
            windows : [],
            osx : [],
            linux : []
          }
          // data.forEach(element => {
          //   element.platforms.forEach(p =>{
               
          //   }
          // }


          fse.writeFile(dir + '/'+ answer + '.json', JSON.stringify(data), (err) => {
            if (err) throw err;
            console.log('The file has been saved!');
          });
        
          rl.close();
        })


          
      });
    },

    //zadatak 4
    //Izracunati koliko je dana proslo od release date-a igre do danasnjeg dana - 20 bodova
    releaseYear(data) {
      let sum = 0;
  
      data.map(g => {
        const now = new Date();
        const released = new Date(g.released);

        const diffTime = Math.abs(now.getTime() - released.getTime());
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 

        console.log(`Days of ${g.name}: ${diffDays}`);
      });
    },

    //zadatak 5
    //Pitati korisnika za unos grada. Izracunati udaljenost od Mostara do tog grada. 
    //Ako korisnik unese grad Mostar, ponoviti pitanje i upozoriti ga da ne moze koristiti grad Mostar. 
    //Koristiti https://www.distance24.org/route.json API - 20 bodova
    cityDistance(data){
      const geo = require('geolib');
      const fetch = require("node-fetch");
      const mostar = {latitude: 43.343033, longitude: 17.807894};
      
      const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
      });

      rl.prompt();
      rl.question('City name: ', (answer) => {
        
        if ('mostar' === answer.toLowerCase()){
          console.log("Ne mozete unijeti Mostar, unesite ponovo grad.");
          //odustao sam od uslova al trebao bi pono questions izvest
        } else {
          valueCity = false;
          fetch(`https://www.distance24.org/route.json?stops=Mostar|${answer}`)
            .then(res => res.json())
            .then(data => {
                console.log(`Mostar to ${answer}: ${data.distance} km`);
            });
        }        
        rl.close();
        });
    }
}