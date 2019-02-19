const conn = require('../database');
const transporter = require('../helpers/emailSender');

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
    // =========================================================================================================================
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
    // =========================================================================================================================
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
    // =========================================================================================================================
    deleteitemcart: (req,res) => {
        var { username, isbn } = req.body;
        
        var sql = `DELETE FROM keranjang WHERE username = '${username}' AND isbn = '${isbn}';`;
        
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result)
            res.send(result);
        })
    },
    // =========================================================================================================================
    addtransaction: (req, res) => {
        var { username, total_bayar, total_berat, email } = req.body;

        var sql = `INSERT INTO transaksi SET ?;`;
        var newTransaction = {
            username,
            waktu : new Date(),
            total_bayar, 
            total_berat,
            is_finished: "no"
        }
        conn.query(sql, newTransaction, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result.insertId)

            var mailOptions = {
                from: 'BukuJamal <fazlur.jamal@gmail.com>',
                to : email,
                subject : 'Payment Order',
                html: `<h3>Terimakasih Sudah Berbelanja!</h3>
                        <p>Silahkan lakukan pembayaran untuk melanjutkan proses pemesanan yang sudah
                        anda lakukan, sebagai berikut: </p>
                        <p>Total Pembayaran: Rp. ${total_bayar.toLocaleString()}</p>
                        <p>Transfer Ke: (BNI) 12345678123</p>
                        <h4>Setelah melakukan transfer, harap <b>upload bukti pembayaran</b> di Halaman :</h4> 
                        <a href="http://localhost:3000/confirmpayment">Konfirmasi Pembayaran</a>`
            }

            transporter.sendMail(mailOptions, (err2, res2) => {
                if(err2){
                    console.log(err2);
                    // res.send({status: 'Error!', message: 'Error sending message'})
                    throw res2;
                } else {
                    console.log('Success!')
                    // res.send({username, email, role: 'User', status: 'Unverified', token:''})
                    res.send(result);
                }
            })
            //res.send(result);
        })
    },
    // =========================================================================================================================
    adddetailtransaction: (req, res) => {
        
        var { id_transaksi, username, isbn, judul, harga, jumlah_beli, total_harga } = req.body;

        var newDetail = {
            id_transaksi,
            username,
            isbn,
            judul,
            harga,
            jumlah_beli,
            total_harga
        }

        var sql = `INSERT INTO detil_transaksi SET ?;`;

        conn.query(sql, newDetail, (err, result) => {
            if(err) throw err;
            // console.log(sql);
            // console.log(result);
            res.send(result);
        })
    },
    // =========================================================================================================================
    clearcart: (req, res) => {
        var sql = `DELETE FROM keranjang WHERE username = '${req.body.username}';`;

        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result)
            res.send(result);
        })
    },
    countcart: (req, res) => {
        var sql = `SELECT COUNT(*) AS count FROM keranjang WHERE username='${req.body.username}';`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result[0].count)
            res.send(result[0]);
        })
    }
}
