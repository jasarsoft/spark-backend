var Person = function(name) {
  this.name = name;
  var age;
  
  this.setName = function(name) {
    this.name = name;
  }
  
  this.getName = function() {
    if (age >= 18) {
      return this.name;
    }
  }
  
  this.setAge = function(ageParam) {
    age = ageParam;
  }
  
  this.getAge = function() {
    return age;
  }
}

var a = new Person('Gopal');
a.setName('Jayanti');
a.setAge(360);
console.log('Private age:', a.age);
console.log('Name:', a.getName());
console.log('Age:', a.getAge());

// Dodavanje dinamičkog svojstva klasi 
// Decorator pattern

function deco(baseItem, propName, propValue) {
  baseItem[propName] = propValue;
}

deco(a, 'surname', 'Swami');

console.log(a.surname);

