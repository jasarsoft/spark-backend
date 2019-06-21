var geolib = require("geolib");
 
var distance = geolib.getDistance(
    {latitude: "43.34333", longitude: "17.80806"},
    {latitude: "43.84864", longitude: "18.35644"}
);
 
console.log(distance/1000);
