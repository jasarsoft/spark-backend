var allowedPeople = ['Mary', 'John', 'Sandy', 'Frank'];
var peopleToCheck = ['Harry', 'Rick', 'Sandy'];

function isAllowedEntrance(param){
  //write implementation - for each person trying to enter
  //write console.log with message is thate person allowed to enter or not
 
  for (var i = 0; i < param.length; i++){
    let exist = false;
    for (var j = 0; j < allowedPeople.length; j++){
      if (param[j] == allowedPeople[i]){
        exist = true;
        break;
      }
    }
    
    console.log(param[i] + (exist ? ' - YES' : ' - NO'));
  }
}

isAllowedEntrance(peopleToCheck);

























var allowedPeople = ['Mary', 'John', 'Sandy', 'Frank'];
var peopleToCheck = ['Harry', 'Rick', 'Sandy'];

function isAllowedEntrance(param){
  //write implementation - for each person trying to enter
  //write console.log with message is thate person allowed to enter or not
 
  var arrayLen = param.length;
  for (var i = 0; i < arrayLen; i++){
    
    (allowedPeople.indexOf(param[i]) > -1) ? console.log(param[i] + ' allowed access') : console.log(param[i] + ' access denied');
  }
}

isAllowedEntrance(peopleToCheck);


