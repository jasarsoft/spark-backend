var fs = require("fs-extra");
 
var dir = "/media/jasarsoft/Archive/GitHub/spark-backend/4-nodejs/17-06-2019/zadatak03/edin";
var file = "/media/jasarsoft/Archive/GitHub/spark-backend/4-nodejs/17-06-2019/zadatak03/edin/tekst.txt";
 
fs.ensureDir(dir, err => {
    if(err) {
        console.log("An error happened");
        return;
    }
    fs.outputFile(file, 'hello!', err => {
        if(err) {
            console.log("An error happened");
            return;
        }        
        fs.readFile(file, 'utf8', (err, data) => {
          if (err) {
            console.log(err)
            return;
          }
          console.log(data);
        })
      })
  })