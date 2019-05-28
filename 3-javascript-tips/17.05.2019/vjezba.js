class Person {	
	constructor(name, age){
  	this.name = name;
    this.age = age;
  }
  
  function getName(){
    return this.name;
  }
  
  function getAge(){
  	return this.age;
  }
}

var p = new Person("Edin", 14);
console.log(p.getName());

//pravilno
function Person(name, age){
	this.name = name;
  var age = age;
  
  
}

var p = new Person("Edin", 14);
console.log(p.name);
console.log(p.age);







var testModule = (function (name, age) {
  this.name = name;
  var age = age;

  return {
		getName: function() {
    	return this.name;
    },

    delName: function () {
      this.name = "";
    }
  };

})();

var a = testModule("Edin", 14);

