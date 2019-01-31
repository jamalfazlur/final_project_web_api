create database semalamsuntuk;
use semalamsuntuk;

insert into users (username, password, email, phone) values ('rahman','1234','rahman.jamal@gmail.com','0885778444888');
select * from users;

update users set password='d1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11' where username = 'jamal';

insert into product values (null, 'Negeri Para Bedebah', 'Tere Liye', 'Gramedia Pustaka', 2014, 'Kisah Fiksi Politik', null);

-- BUKU / PRODUK

CREATE TABLE IF NOT EXISTS buku (
	isbn VARCHAR(13) NOT NULL,
    judul VARCHAR(45) NOT NULL,
    harga INT NOT NULL,
    deskripsi TINYTEXT,
    gambar VARCHAR(100),
    id_penulis VARCHAR(5) NOT NULL,
    id_penerbit VARCHAR(5) NOT NULL,
    PRIMARY KEY(isbn)
);
-- DESC buku;
-- ############ PENULIS ############

-- DROP TABLE IF EXISTS penulis;
CREATE TABLE IF NOT EXISTS penulis (
	id VARCHAR(5) NOT NULL,
    nama VARCHAR(45),
    PRIMARY KEY(id)
);
-- SELECT * FROM PENULIS;

-- ############ PENERBIT ############

-- DROP TABLE IF EXISTS penerbit;
CREATE TABLE IF NOT EXISTS penerbit (
	id VARCHAR(5) NOT NULL,
    nama VARCHAR(45),
    PRIMARY KEY(id)
);
-- SELECT * FROM penerbit;

-- DROP TABLE kategori;
-- ############ KATEGORI ############
CREATE TABLE IF NOT EXISTS kategori (
	id VARCHAR(5) NOT NULL,
    nama VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);


SELECT * FROM kategori;

-- CART

-- HISTORY_BELANJA


-- NOTES !!
-- di Product: -> tambah tanggal input produk, stock, apa lagi?