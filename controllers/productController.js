const conn = require('../database');

module.exports = {
    getproduct: (req,res) => {
        var {isbn, keyword} = req.body;

        var splitString = (strSearch) => {
            var result = strSearch.split(' ');
            return result;
        }
        var resKeyword = splitString(keyword).join('|');
        console.log(resKeyword);

        var sql = `SELECT isbn, judul, PN.nama AS penulis, PB.nama AS kategori, harga, berat, jumlah_halaman, deskripsi, gambar 
                    FROM buku B
                    JOIN penulis PN ON B.id_penulis = PN.id
                    JOIN penerbit PB ON B.id_penerbit = PB.id
                    WHERE isbn LIKE '%${isbn}%' 
                    AND ((B.judul REGEXP '${resKeyword}') OR (PN.nama REGEXP '${resKeyword}'));`;

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