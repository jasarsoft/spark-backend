function Osoba(ime, godine){
    this.ime = ime;
    this.godine = godine;
  }
  
  
  Osoba.prototype.budjenje = function(){
    return '8:00';
  }
  Osoba.prototype.Ime = function(){
    return this.ime;
  }
  
  var o = new Osoba('Edin', 14);
  console.log(o.budjenje());
  
  function Student(ime, godine){
    this.ime = ime;
    this.godine = godine;
    this.budjenje = function(){
      return '10:00';
    }
  }
  
  var s = new Student('Neko', 15);
  console.log(s.budjenje());
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  function Osoba(ime, godine){
    this.ime = ime;
    this.godine = godine;
  }
  
  
  Osoba.prototype.budjenje = function(){
    return '8:00';
  }
  Osoba.prototype.printIme = function(){
    return this.ime;
  }
  
  var o = new Osoba('Edin', 14);
  console.log(o.budjenje());
  
  function Student(ime, godine){
    Osoba.call(this, ime, godine);
    this.budjenje = function(){
      return '10:00';
    }
  }
  
  Student.prototype = Object.create(Osoba.prototype);
  Student.prototype.constructor = Student;
  
  var s = new Student('Neko', 15);
  console.log(s.budjenje());
  
  