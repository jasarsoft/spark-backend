const mysql = require('./../database/mysql.js');

const express     = require('express')
const app         = express();
const port        = 3000

app.listen(port,() => {
    console.log('server is up on ' + port);
    mysql.connectDB();
})