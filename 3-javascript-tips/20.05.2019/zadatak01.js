primjer1

function CD(title, artist){
  this.title = title;
  this.artist = artist;
}

CD.prototype.setDuration = function(duration){
  this.duration = duration;
}

CD.prototype.getDuration = function(){
  return this.duration;
}

var top2cd = new CD('if I Can\'t Have You', 'Shawn Mandes');
top2cd.setDuration('1:09');
console.log(top2cd.getDuration());
//console.log(top2cd);

var top3BillboardCD = new CD('ME!', 'Taylor Swift');
top3BillboardCD.setDuration('2:09');
console.log(top3BillboardCD.getDuration());


primjer2

function CD(title, artist){
  this.title = title;
  this.artist = artist;
}

CD.prototype.setDuration = function(duration){
  this.duration = duration;
}

CD.prototype.getDuration = function(){
  return this.duration;
}

var cd = new CD('Emira', 'Bob');
CD.prototype.price = 10;
console.log(cd.price);
cd.price = 15;
console.log(cd.price);


function CD(title, artist){
  this.title = title;
  this.artist = artist;
}

CD.prototype.setDuration = function(duration){
  this.duration = duration;
}

CD.prototype.getDuration = function(){
  return this.duration;
}

var cd = new CD('Emira', 'Bob');
CD.prototype.price = 10;
console.log(cd.price);
cd.price = 15;
console.log(cd.price);

var drugiCD = new CD('New', 'aaa');
console.log(drugiCD);

