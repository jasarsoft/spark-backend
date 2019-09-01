const mysql = require('./database/mysql.js');

const express     = require('express')
const app         = express();
const port        = 3000

app.listen(port,() => {
    console.log('server is up on ' + port);
    // mysql.connectDB();
    
    // mysql.addComment({
    //     'content': 'Ovo je komentar 1',
    //     'topic_id': '1',
    //     'user_id': '2'
    // });

    // mysql.selectCommentByUser(2);

    // mysql.updateComment({
    //     'content': 'Ovo je izmjenjen komentar',
    //     'topic_id': '1',
    //     'user_id': '2'
    // });

    mysql.deleteComment({
        'topic_id': '1',
        'user_id': '2'
    });
});