function Auto(naziv, boja, kilometraza, potrosnja){
    this.naziv = naziv;
    this.boja = boja;
    this.kilometraza = kilometraza;
    this.potrosnja = potrosnja;  
  }
  
  Auto.prototype.vozi = function(){
    this.kilometraza += 5;
  }
  
  Auto.prototype.setGorivo = function(gorivo){
    this.gorivo = gorivo;
  }
  Auto.prototype.getGorivo = function(){
    return this.gorivo;
  }
  Auto.prototype.setPotrosnja = function(value){
    this.potrosnja = value;
  }
  
  
  Auto.prototype.smanji = function(){
    this.gorivo = this.gorivo - this.potrosnja;
  }
  
  var auto1 = new Auto("BMW", "Crna", 1000, 10);
  var auto2 = new Auto("Audi", "Bijela", 500, 5);
  //console.log(auto1, auto2);
  auto1.vozi(); auto1.vozi(); auto1.vozi();
  auto2.vozi(); auto2.vozi(); auto2.vozi();
  //console.log(auto1, auto2);
  auto1.setGorivo(100);
  auto2.setGorivo(100);
  auto1.setPotrosnja(8)
  auto2.setPotrosnja(7);
  auto1.smanji();
  auto2.smanji();
  console.log(auto1.getGorivo());
  console.log(auto2.getGorivo());
  //console.log(auto1);
  
  
  
  
  
  
  
  