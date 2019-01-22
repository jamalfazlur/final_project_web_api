const mysql = require('mysql');

const conn = mysql.createConnection({
    host: 'localhost',
    // host: 'db4free.net',
    user: 'jamalnew',
    password: 'bismillah114',
    database: 'semalamsuntuk',
    port: 3306
});

module.exports = conn;