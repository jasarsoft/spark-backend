var mysql = require('mysql');

// var con = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "",
//   database : 'basic_forum'
// });

// const connection = con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
// });

//module.exports = connection;

var pool      =    mysql.createPool({
  connectionLimit : 100, //important
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'basic_forum',
  debug    :  false
});

exports.connectDB = function(req, res) {
  pool.getConnection(function(err, connection){
    if (err) {
      res.json({"code": 100, "status": "Error in connection database"});
    } else {
      console.log('connection id: ' + connection.threadId);
    }
  })
}

exports.selectCommentByUser = function(user_id){
  let select = 'SELECT * FROM ?? WHERE ?? = ?';
  let query = mysql.format(select, ["comments", "user_id", user_id]);
  pool.query(query, (error, data) => {
    if (error) {
      console.error(error);
    } else {
      console.log(data);
      return data;
    }
  });
}

exports.addComment = function(data) {
  let insert = 'INSERT INTO ?? (??, ??, ??) VALUES (?, ?, ?)';
  let query = mysql.format(insert, ["comments", "content", "topic_id", "user_id", data.content, data.topic_id, data.user_id]);
  pool.query(query, (error, response) => {
    if (error) {
      console.error(error);
      return;
    }

    console.log(response.insertId);
  });
}

exports.updateComment = function(data) {
  let update = 'UPDATE ?? SET ?? = ? WHERE ?? = ? && ?? = ?';
  let query = mysql.format(update, ["comments", "content", data.content, "topic_id", data.topic_id, "user_id", data.user_id]);

  pool.query(query, (error, response) => {
    if (error) {
      console.error(error);
    } else {
      console.log(response.affectedRows);
    }
  });
}