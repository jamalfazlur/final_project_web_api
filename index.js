const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');
var fs = require('fs');
// var { uploader } = require('./helpers/uploader')

var port = process.env.PORT || 1997;

const conn = mysql.createConnection({
    host: 'localhost',
    user: 'jamalnew',
    password: 'bismillah114',
    database: 'semalamsuntuk',
    port: 3306
});

var app = express({defaultErrorHandler:false});

app.use(cors())
app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())
app.use(express.static('public'))

app.get('/', (req,res) => {
    res.send('<h1>Selamat Datang di API!</h1>')
})

app.get('/users', (req,res) => {
    var sql = 'SELECT * from users;';
    conn.query(sql, (err, results) => {
        if(err) throw err;
        // console.log(results);
        
        res.send(results);
    })   
})

app.listen(port, () => console.log('API Aktif di port ' + port))