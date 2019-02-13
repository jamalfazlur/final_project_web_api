const conn = require('../database');

module.exports = { 
    addtocart: (req,res) => {
        var newBarang = {
            username: req.body.username,
            isbn: req.body.isbn,
            judul: req.body.judul,
            harga: req.body.harga,
            berat: req.body.berat,
            jumlah_beli: req.body.jumlah_beli,
            totalharga: req.body.totalharga
        }
        var sql = `INSERT INTO keranjang SET ? ;`;
        conn.query(sql, newBarang, (err, result) => {
            if(err) throw err;
            res.send(result);
        })
    }
}