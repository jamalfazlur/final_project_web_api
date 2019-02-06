create database semalamsuntuk;
use semalamsuntuk;

insert into users (username, password, email, phone) values ('rahman','1234','rahman.jamal@gmail.com','0885778444888');
select * from users;

update users set password='d1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11' where username = 'rahman';

insert into product values (null, 'Negeri Para Bedebah', 'Tere Liye', 'Gramedia Pustaka', 2014, 'Kisah Fiksi Politik', null);

-- BUKU / PRODUK
DROP TABLE buku;

CREATE TABLE IF NOT EXISTS buku (
	isbn VARCHAR(13) NOT NULL,
    judul VARCHAR(45) NOT NULL,
    harga INT NOT NULL,
    berat INT NOT NULL,
    jumlah_halaman INT NOT NULL,
    deskripsi MEDIUMTEXT,
    gambar VARCHAR(100),
    id_penulis VARCHAR(5) NOT NULL,
    id_penerbit VARCHAR(5) NOT NULL,
    input_date DATETIME,
    PRIMARY KEY(isbn)
);
-- DESC buku;
INSERT INTO buku VALUES (
'9786024526999', 
'hahaha', 
53000, 
300,
256,
'Selama beberapa tahun belakangan, Mark Manson melalui blognya yang sangat populer telah membantu mengoreksi harapan-harapan delusional kita, baik mengenai diri kita sendiri maupun dunia. Ia kini menuangkan buah pikirnya yang keren itu di dalam buku hebat ini.
Dalam hidup ini, kita hanya punya kepedulian dalam jumlah yang terbatas. Makanya, Anda harus bijaksana dalam menentukan kepedulian Anda. Manson menciptakan momen perbincangan yang serius dan mendalam, dibungkus dengan cerita-cerita yang menghibur dan \'kekinian\', serta humor yang cadas. Buku ini merupakan tamparan di wajah yang menyegarkan untuk kita semua, supaya kita bisa mulai menjalani kehidupan yang lebih memuaskan, dan apa adanya. ',
 null, 
 (SELECT id FROM penulis WHERE nama LIKE '%bodo%'),
 (SELECT id FROM penerbit WHERE nama LIKE '%gramedia%'),
 NOW()
);

SELECT isbn, judul, PN.nama AS penulis, PB.nama AS kategori, harga, berat, jumlah_halaman, deskripsi, gambar 
FROM buku B
JOIN penulis PN ON B.id_penulis = PN.id
JOIN penerbit PB ON B.id_penerbit = PB.id
WHERE isbn LIKE '%%' 
AND ((B.judul REGEXP '|') OR (PN.nama REGEXP '|'))
; 

select * from buku;

UPDATE buku SET deskripsi = 'Buku ini merupakan tamparan di wajah yang menyegarkan untuk kita semua, supaya kita bisa mulai menjalani kehidupan yang lebih memuaskan, dan apa adanya.'
WHERE isbn = '9786024526986';

SELECT * FROM buku;
-- ############ PENULIS ############

-- DROP TABLE IF EXISTS penulis;
CREATE TABLE IF NOT EXISTS penulis (
	id VARCHAR(5) NOT NULL,
    nama VARCHAR(45),
    PRIMARY KEY(id)
);

INSERT INTO penulis VALUES
('PN002', 'Bodo Sagala');

SELECT * FROM PENULIS;

-- ############ PENERBIT ############

-- DROP TABLE IF EXISTS penerbit;
CREATE TABLE IF NOT EXISTS penerbit (
	id VARCHAR(5) NOT NULL,
    nama VARCHAR(45),
    PRIMARY KEY(id)
);

SELECT * FROM penerbit
WHERE nama LIKE '%gramedia%'
;




-- DROP TABLE kategori;
-- ############ KATEGORI ############
CREATE TABLE IF NOT EXISTS kategori (
	id VARCHAR(5) NOT NULL,
    nama VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);


SELECT * FROM kategori
WHERE nama LIKE '%pengembangan%'
;

-- CART

-- HISTORY_BELANJA


-- NOTES !!
-- di Product: -> tambah tanggal input produk, stock, apa lagi?