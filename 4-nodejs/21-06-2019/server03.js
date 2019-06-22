const http = require('http')
const fetch = require('fetch')

const server = http.createServer(function(request, response) {
  //console.dir(request.param)
  fetch('http://output.jsbin.com/pirazumuve.json')
    .then(res => res.json())
    .then(json => {
      response.writeHead(200, { 'Content-Type': 'application/json' });
      response.write(res);
      response.end();
    });
});
const port = 3000
const host = '127.0.0.1'
server.listen(port, host)
console.log(`Listening at http://${host}:${port}`)

// http.get('http://output.jsbin.com/pirazumuve.json', (resp) => {
//   let data = '';
//   //console.log(resp);
//   resp.on('data', (chunk) => {
//     data += chunk;
//   });

//   resp.on('end', () => {
//     console.loclsg(JSON.parse(data));
//   });

// }).on("error", (err) => {
//   console.log("Error: " + err.message);
// });
