var moment = require("moment");
 
var a = moment().endOf('year');
var b = moment().today;
 
console.log(a.diff(b, 'days'));