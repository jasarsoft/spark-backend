const fetch = require("node-fetch");

const games = require("./modul/games.js");

fetch(`http://output.jsbin.com/yoluyoqowa.json`)
  .then(res => res.json())
  .then(data => {
    // games.gameNames(data).forEach(element => {
    //     console.log(element);
    // });
    //games.maxMinAvg(data);
    //games.outputFile(data);
    //games.releaseYear(data);
    games.cityDistance(data);
  });