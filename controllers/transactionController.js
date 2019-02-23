const conn = require('../database');
const transporter = require('../helpers/emailSender');
var fs = require('fs');
var { uploader } = require('../helpers/uploader');

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
                        <a href="http://localhost:3000/confirmpayment?username=${username}&idtransaksi=${result.insertId}">Konfirmasi Pembayaran</a>`
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
    // =========================================================================================================================
    countcart: (req, res) => {
        var sql = `SELECT COUNT(*) AS count FROM keranjang WHERE username='${req.body.username}';`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result[0].count)
            res.send(result[0]);
        })
    },
    confirmpayment: (req,res) => {
        try {
            const path = '/images/transaction'; //file save path
            const upload = uploader(path, 'PAY').fields([{ name: 'image'}]); //uploader(path, 'default prefix')
    
            upload(req, res, (err) => {
                if(err){
                    return res.status(500).json({ message: 'Upload picture failed !', error: err.message });
                }
    
                const { image } = req.files;
                console.log(image)
                const imagePath = image ? path + '/' + image[0].filename : null;
                console.log(imagePath)
    
                console.log(req.body.data)
                req.body.data.waktu = new Date();
                const data = JSON.parse(req.body.data);
                console.log(data)
                data.image = imagePath;                
                
                var sql = 'INSERT INTO payment SET ?';
                conn.query(sql, data, (err, results) => {
                    console.log(data)
                    if(err) {
                        console.log(err.message)
                        fs.unlinkSync('./public' + imagePath);
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                   
                    console.log(results);
                    sql = 'SELECT * from payment;';
                    conn.query(sql, (err, results) => {
                        if(err) {
                            console.log(err.message);
                            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                        }
                        console.log(results);
                        
                        res.send(results);
                    })   
                })    
            })
        } catch(err) {
            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
        }
    },
    // untuk user - di halaman konfirmasi pembayaran / upload bukti
    getlistpayment: (req, res) => {
        var sql = `SELECT 
                        TR.id_transaksi, TR.username, TR.waktu AS waktu_transaksi, 
                        TR.total_bayar, TR.total_berat, TR.is_finished, PY.waktu AS waktu_konfirmasi, PY.image 
                    FROM transaksi TR
                    LEFT JOIN payment PY
                    ON TR.id_transaksi = PY.id_transaksi
                    WHERE TR.username = '${req.body.username}' 
                    AND TR.is_finished = 'no'
                    AND PY.image IS NULL 
                    ORDER BY waktu_konfirmasi;`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result)
            res.send(result);
        })
    },
    // untuk admin: get list -> Data order untuk diverifikasi
    getlisttoverify: (req, res) => {
        var sql = `SELECT 
                        TR.id_transaksi, TR.username, TR.waktu AS waktu_transaksi, TR.total_bayar, TR.total_berat, TR.is_finished, 
                        PY.waktu AS waktu_konfirmasi, PY.image
                    FROM transaksi TR
                    LEFT JOIN  payment PY
                    ON PY.id_transaksi = TR.id_transaksi
                    WHERE PY.image IS NOT NULL 
                    AND TR.is_finished = 'no'
                    ORDER BY waktu_konfirmasi`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result)
            res.send(result);
        })
    },
    // approve payment dari buyer
    approvepayment: (req, res) => {
        var sql = `UPDATE transaksi SET is_finished = 'yes' WHERE id_transaksi = ${req.body.id_transaksi};`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(sql);
            console.log(result)
            res.send(result);
        })
    }
}
