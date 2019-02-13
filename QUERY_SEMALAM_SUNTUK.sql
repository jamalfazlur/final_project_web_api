create database semalamsuntuk;
use semalamsuntuk;

-- unverified;

insert into users (username, password, email, phone) values ('rahman','1234','rahman.jamal@gmail.com','0885778444888');
select * from users;

delete from users where username like '%jafara%';

Update users set status='Unverified' where id=3;

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
    penulis VARCHAR(45) NOT NULL,
    penerbit VARCHAR(45) NOT NULL,
    input_date DATETIME,
    PRIMARY KEY(isbn)
);
-- DESC buku;
INSERT INTO buku VALUES (
'9786024553920', 
'Bicara Itu Ada Seninya', 
53000, 
350,
256,
'TAHUKAH ANDA BAHWA BERBICARA ITU ADA SENINYA? Ketika komunikasi menjadi hal yang penting untuk bersaing, pakar komunikasi Oh Su Hyang mengeluarkan buku yang sangat berarti. Selain berisi tentang pengalaman peningkatan diri, buku ini juga memuat berbagai konten mengenai teknik komunikasi, persuasi, dan negosiasi.

Lalu bagaimana cara berbicara yang baik? Apakah berbicara dengan artikulasi yang jelas? Atau berbicara tanpa mengambil tarikan napas? Tidak! Sebuah ucapan yang bisa disebut baik adalah yang bisa menggetarkan hati. Ucapan seorang juara memiliki daya tarik tersendiri. Ucapan pemandu acara memiliki kemampuan menghidupkan suasana dan kekuatan kalimatnya yang terus terang. Anda harus pandai berbicara untuk menunjukkan diri Anda kepada lawan bicara dalam kehidupan sosial. Orang yang berbicara dengan mahir akan menjadi lebih maju daripada yang lainnya.',
 'bicara_itu_ada_seninya.jpg', 
 'Oh Su Hyang',
 'Bhuana Ilmu Populer',
 NOW()
);

SELECT isbn, judul, PN.nama AS penulis, PB.nama AS kategori, harga, berat, jumlah_halaman, deskripsi, gambar 
FROM buku B
JOIN penulis PN ON B.id_penulis = PN.id
JOIN penerbit PB ON B.id_penerbit = PB.id
WHERE isbn LIKE '%%' 
AND ((B.judul REGEXP '|') OR (PN.nama REGEXP '|'))
; 

SELECT * FROM buku;

update buku set gambar = 'garis_waktu_fiersa.jpg' where isbn = '9789797945251';

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

DROP TABLE IF EXISTS penerbit;
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

select * from buku order by 1 
limit 3, 1
;