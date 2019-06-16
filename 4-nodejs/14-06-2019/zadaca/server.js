const o = require('./osoba.js');

o.osoba.ime = 'Edin';
o.osoba.prezime = 'Jasarevic';
o.osoba.datumRodjenja = 'December 17, 1995';
o.osoba.grad = 'Zenica';
console.log(o.osoba.ime);
console.log(o.osoba.prezime);
console.log(o.osoba.datumRodjenja);
console.log(o.osoba.grad);
console.log(o.osoba.godinaStarosti());