const conn = require('../database');

module.exports = { 

    addtocart: (req,res) => {
        var { username, isbn, judul, harga, berat, jumlah_beli, total_berat, total_harga} = req.body;

        var newBarang = { username, isbn, judul, harga, berat, jumlah_beli, total_berat, total_harga };

        var sql = `INSERT INTO keranjang SET ? ;`;
        conn.query(sql, newBarang, (err, result) => {
            if(err) throw err;
            res.send(result);
        })
    },

    getlistcart: (req, res) => {
        var sql = `SELECT K.username, K.isbn, K.judul, K.harga, K.jumlah_beli, K.total_harga, K.berat, K.total_berat, B.gambar 
                    FROM keranjang K
                    JOIN buku B 
                    ON K.isbn = B.isbn
                    WHERE username='${req.body.username}';`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result)
            res.send(result);
        })
    },
    editlistcart: (req, res) => {
        var { username, isbn, jumlah_beli, total_berat, total_harga } = req.body;

        var sql = `UPDATE keranjang SET jumlah_beli = ${jumlah_beli}, total_berat = ${total_berat}, total_harga = ${total_harga}
                    WHERE username = '${username}' AND isbn = '${isbn}';`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result)
            res.send(result);
        })
    },
    deleteitemcart: (req,res) => {
        var { username, isbn } = req.body;
        
        var sql = `DELETE FROM keranjang WHERE username = '${username}' AND isbn = '${isbn}';`;
        
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result)
            res.send(result);
        })
    }
}
