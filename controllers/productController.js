const conn = require('../database');
var fs = require('fs');
var { uploader } = require('../helpers/uploader');

module.exports = {
    searchproduct: (req,res) => {
        var { keyword = ""} = req.body;

        var splitString = (strSearch) => {
            var result = strSearch.split(' ');
            return result;
        }
        var resKeyword = splitString(keyword).join('|');
        console.log(resKeyword);
        if(resKeyword == "") {resKeyword = "|"}

        var sql = `SELECT * FROM buku WHERE isbn = '${resKeyword}' 
                    OR ( judul REGEXP '${resKeyword}' 
                    OR penulis REGEXP '${resKeyword}')`;
        conn.query(sql, (err, result) => {
            if(err) throw err;
            console.log(result)
            res.send(result);
        })
    },
    getproduct: (req,res) => {

        
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
    // =============================================================================
    editproduct : (req,res) => {
        var noIsbn = req.params.isbn;
        var sql = `SELECT * FROM buku WHERE isbn = '${noIsbn}';`;
        conn.query(sql, (err, results) => {
            if(err) throw err;
    
            if(results.length > 0) {
                const path = '/images/book'; //file save path
                const upload = uploader(path, 'PRD').fields([{ name: 'gambar'}]); //uploader(path, 'default prefix')
    
                upload(req, res, (err) => {
                    if(err){
                        return res.status(500).json({ message: 'Upload book picture failed !', error: err.message });
                    }
    
                    const { gambar } = req.files;
                    // console.log(image)
                    const imagePath = gambar ? path + '/' + gambar[0].filename : null;
                    const data = JSON.parse(req.body.data);
                    data.gambar = imagePath;
    
                    try {
                        if(imagePath) {
                            sql = `UPDATE buku SET ? WHERE isbn = '${noIsbn}';`
                            conn.query(sql,data, (err1,results1) => {
                                if(err1) {
                                    fs.unlinkSync('./public' + imagePath);
                                    return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                                }
                                fs.unlinkSync('./public' + results[0].gambar);
                                sql = `SELECT * FROM buku;`;
                                conn.query(sql, (err2,results2) => {
                                    if(err2) {
                                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                                    }
    
                                    res.send(results2);
                                })
                            })
                        }
                        else {
                            sql = `UPDATE buku SET judul='${data.judul}', 
                                                harga=${parseInt(data.harga)}, 
                                                berat=${parseInt(data.berat)}, jumlah_halaman=${parseInt(data.jumlah_halaman)},
                                                deskripsi='${data.deskripsi}', penulis='${data.penulis}',
                                                penerbit='${data.penerbit}'   WHERE isbn = '${noIsbn}';`
                            console.log(sql)
                            conn.query(sql, (err1,results1) => {
                                if(err1) {
                                    return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                                }
                                sql = `SELECT * FROM buku;`;
                                conn.query(sql, (err2,results2) => {
                                    if(err2) {
                                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                                    }
    
                                    res.send(results2);
                                })
                            })
                        }
                    }
                    catch(err){
                        console.log(err.message)
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                })
            }
        })
    },
    // =============================================================================
    deleteproduct: (req,res) => {
        
        var isbn = req.params.isbn;
        var sql = `SELECT * FROM buku WHERE isbn = '${isbn}';`;
        conn.query(sql, (err, results) => {
            if(err) {
                return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
            }
            
            if(results.length > 0) {
                sql = `DELETE FROM buku WHERE isbn = '${isbn}';`
                conn.query(sql, (err1,results1) => {
                    if(err1) {
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                    }
    
                    fs.unlinkSync('./public' + results[0].gambar);
                    sql = `SELECT * FROM buku;`;
                    conn.query(sql, (err2,results2) => {
                        if(err2) {
                            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err2.message });
                        }
    
                        res.send(results2);
                    })
                })
            }
        })  
    }
}