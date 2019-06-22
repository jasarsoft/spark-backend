const request = require('request');

request('http://output.jsbin.com/pirazumuve.json', { json: true }, (err, res, body) => {
  if (err) { return console.log(err); }
  console.log(body.url);
  console.log(body.explanation);
});