/*
napravite klasu Osoba tako da ima ime, godine
proširite mu metodu u kojoj ispisuje uobičajeno vrijeme buđenja - 8:00
proširite mu metodu u kojoj ispisuje svoje ime
instancirajte jednu osobu i ispišite joj vrijeme buđenja
napravite klasu student tako da ima ime, godine i da može ispisati vrijeme buđenja
neka vrijeme buđenja kod studenta bude 10:00
instancirajte studenta i ispišite mu vrijeme buđenja i ime
*/

function Osoba(ime, godine) {
  this.ime = ime;
  this.godine = godine;
  this.wakeUpTime = '08:00';
}

Osoba.prototype.printName = function() {console.log(this.ime);}

Osoba.prototype.printWakeUpTime = function() {console.log(this.wakeUpTime);}

function Student(ime, godine) {
  Osoba.call(this, ime, godine);
  
  this.wakeUpTime = '10:00';
}

Student.prototype = Object.create(Osoba.prototype);
Student.prototype.constructor = Student;

var osoba = new Osoba('Bruce', 40);

osoba.printWakeUpTime();

var student = new Student('John', 22);

student.printName();
student.printWakeUpTime();

