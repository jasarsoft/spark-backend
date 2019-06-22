const fetch = require("node-fetch");

const companies = require("./companies");

fetch(`https://output.jsbin.com/figukid/8.json`)
  .then(res => res.json())
  .then(data => {
    //companies.ispisPodataka(data);
    //companies.minmax(data);
    //companies.godineFirme(data);
    //companies.najblizaFirmaMostaru(data)
    companies.create_folder(data);
    
  });
