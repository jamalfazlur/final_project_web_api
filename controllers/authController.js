const conn = require('../database');

module.exports = {
    register: (req,res) => {
        
    },
    signin: (req,res) => {
        var { username, password } = req.body.params;
        var sql = `SELECT * FROM users WHERE username = '${username}' AND password = '${password}';`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(req.body)
            res.send(result);
        })
    }
}