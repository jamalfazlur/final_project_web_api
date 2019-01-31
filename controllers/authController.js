var Crypto = require('crypto');
const conn = require('../database');

module.exports = {
    register: (req,res) => {
        
    },
    signin: (req,res) => {

        var { username, password } = req.body;
    
        const hashPassword = Crypto.createHmac('sha256', "abcd123")
        .update(`${password}`).digest('hex');

        var sql = `SELECT * FROM users WHERE username = '${username}' AND password = '${hashPassword}';`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            //console.log(`Hash: ${hash}, Hash2: ${hash2}`)
            console.log(req.body)
            res.send(result);
        })
    }
}