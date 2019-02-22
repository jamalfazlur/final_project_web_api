const conn = require('../database');
var fs = require('fs');
var { uploader } = require('../helpers/uploader');

module.exports = {
    getproduct: (req,res) => {
        // var {isbn = "", keyword = ""} = req.body;

        // var splitString = (strSearch) => {
        //     var result = strSearch.split(' ');
        //     return result;
        // }
        // var resKeyword = splitString(keyword).join('|');
        // console.log(resKeyword);
        // if(resKeyword == "") {resKeyword = "|"}

        // var sql = `SELECT isbn, judul, PN.nama AS penulis, PB.nama AS kategori, harga, berat, jumlah_halaman, deskripsi, gambar 
        //             FROM buku B
        //             JOIN penulis PN ON B.id_penulis = PN.id
        //             JOIN penerbit PB ON B.id_penerbit = PB.id
        //             WHERE isbn LIKE '%${isbn}%' 
        //             AND ((B.judul REGEXP '${resKeyword}') OR (PN.nama REGEXP '${resKeyword}'));`;
        
        var sql = `SELECT * FROM buku;`;

        conn.query(sql, (err, result) => {
            if(err) throw err;
            res.send(result);
        })
    },
    getproductdetail : (req,res) => {
        var sql = `SELECT * FROM buku WHERE isbn='${req.params.isbn}';`;

        conn.query(sql, (err, result) => {
            if(err) throw err;
            //console.log(result)
            res.send(result);
        })
    },
    addproduct: (req,res) => {
        try {
            const path = '/images/book'; //file save path
            const upload = uploader(path, 'PRD').fields([{ name: 'gambar'}]); //uploader(path, 'default prefix')
    
            upload(req, res, (err) => {
                if(err){
                    return res.status(500).json({ message: 'Upload picture failed !', error: err.message });
                }
    
                const { gambar } = req.files;
                console.log(gambar)
                const imagePath = gambar ? path + '/' + gambar[0].filename : null;
                console.log(imagePath)
    
                console.log(req.body.data)
                req.body.data.input_date = new Date();
                const data = JSON.parse(req.body.data);
                console.log(data)
                data.gambar = imagePath;                
                
                var sql = 'INSERT INTO buku SET ?';
                conn.query(sql, data, (err, results) => {
                    console.log(data)
                    if(err) {
                        console.log(err.message)
                        fs.unlinkSync('./public' + imagePath);
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                   
                    console.log(results);
                    sql = 'SELECT * from buku;';
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
    deleteproduct: (req,res) => {
        
    }
}