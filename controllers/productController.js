const conn = require('../database');

module.exports = {
    getproduct: (req,res) => {
        var sql = `SELECT * FROM product;`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            res.send(result);
        })
    },
    addproduct: (req,res) => {

    },
    deleteproduct: (req,res) => {
        
    }
}