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
            total_harga: req.body.total_harga
        }
        var sql = `INSERT INTO keranjang SET ? ;`;
        conn.query(sql, newBarang, (err, result) => {
            if(err) throw err;
            res.send(result);
        })
    },
    getlistcart: (req, res) => {
        var sql = `SELECT K.username, K.isbn, K.judul, K.harga, K.jumlah_beli, K.total_harga, B.gambar FROM keranjang K
                    JOIN buku B 
                    ON K.isbn = B.isbn
                    WHERE username='${req.body.username}';`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result)
            res.send(result);
        })
    }
}
