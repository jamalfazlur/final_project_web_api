-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.13 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for semalamsuntuk
CREATE DATABASE IF NOT EXISTS `semalamsuntuk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `semalamsuntuk`;

-- Dumping structure for table semalamsuntuk.buku
CREATE TABLE IF NOT EXISTS `buku` (
  `isbn` varchar(13) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `deskripsi` mediumtext,
  `gambar` varchar(100) DEFAULT NULL,
  `penulis` varchar(45) NOT NULL,
  `penerbit` varchar(45) NOT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table semalamsuntuk.buku: ~10 rows (approximately)
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT IGNORE INTO `buku` (`isbn`, `judul`, `harga`, `berat`, `jumlah_halaman`, `deskripsi`, `gambar`, `penulis`, `penerbit`, `input_date`) VALUES
	('234567891', 'PHP Laravel Handbook', 120000, 200, 250, 'Tes Belajar JS', '/images/book/PRD1551026082830.png', 'Rahman', 'Purwadhika', NULL),
	('9769797945770', 'This Is Why I Need You', 101000, 550, 601, 'Brian Khrisna, atau yang juga dikenal dengan panggilan "Mbeeer", seorang penyuka tulisan dan puisi yang bertempat tinggal di Bandung. Tulisan pendek, quote, dan puisi adalah beberapa jenis tulisan yang kerap dihasilkannya dan diupload di akun tumblrnya, mbeeer.tumblr.com. Sebagian besar tema tulisannya adalah tentang asmara, jatuh cinta, semangat mempertahankan hubungan, putus cinta, kegalauan, sakit hati, kehilangan, dan bangkit dari rasa kehilangan, yang ditulisnya dengan cara yang menarik dan menggunakan pilihan kata yang tepat sasaran, yaitu ke dalam hati pembacanya. Gaya tulisannya tidak melulu menggunakan pilihan kata yang puitis, namun juga humoris. Karena menurutnya, membuat wanita tertawa adalah titik tertinggi dari keromantisan itu sendiri.', '/images/book/PRD1551023804028.jpg', 'Brian Khrisna', 'MediaKita', NULL),
	('9786022202049', 'Kami (Bukan) Sarjana Kertas', 88000, 300, 372, 'Tiap kita punya musuh besar.\n\nIa hadir lebih menakutkan dari kegelapan. \nMenyengat lebih panas dari Aldebaran.\nLebih berbahaya dari bisa King Cobra yang melumpuhkan.\nLebih dingin daripada kutub Bumi yang membekukan.\n\nDi mana musuh itu berada? Dalam jiwa kita sendiri.\nCara menaklukkannya? Engkau sendiri yang tahu, Kawan.', '/images/book/PRD1550853914099.jpg', 'J. S. Khairen', 'Bukune', NULL),
	('9786022915249', 'Orang-Orang Biasa ', 76000, 300, 312, 'Mata Inspektur semakin sendu menatap papan tulis itu. Keadaan yang tenteram ini perlahan-lahan akan membuat polisi di dalam dirinya terlena, lalu terbaring, lalu pingsan, lalu mati. Inspektur sungguh khawatir. Wahai kaum maling, ke manakah gerangan kalian? 	Untuk pertama kalinya, Andrea Hirata menulis novel dalam genre kejahatan. Dalam novel istimewa ini, pembaca akan berjumpa tokoh-tokoh unik dengan pikiran menakjubkan. Dari mereka, kita akan belajar betapa mudahnya bahagia karena hal-hal sederhana. ', '/images/book/PRD1550887775179.jpg', 'Andrea Hirata', 'Bentang Pustaka', NULL),
	('9786024125189', 'Filosofi Teras: Filsafat Yunani-Romawi Kuno Untuk Mental Tangguh Masa Kini', 78000, 350, 0, 'Lebih dari 2.000 tahun lalu, sebuah mazhab filsafat menemukan akar masalah dan juga solusi dari banyak emosi negatif. Stoisisme, atau Filosofi Teras, adalah filsafat Yunani-Romawi kuno yang bisa membantu kita mengatasi emosi negatif dan menghasilkan mental yang tangguh dalam menghadapi naik-turunnya kehidupan.<br /> Jauh dari kesan filsafat sebagai topik berat dan mengawang-awang Filosofi Teras justru bersifat praktis dan relevan dengan kehidupan Generasi Mileniat dan Gen-Z masa kini.', '/images/book/filosofi_teras.jpg', 'Henry Manampiring', 'Kompas', '2019-02-13 16:57:53'),
	('9786024526986', 'Sebuah Seni untuk Bersikap Bodo Amat', 53000, 350, 256, 'Selama beberapa tahun belakangan, Mark Manson melalui blognya yang sangat populer telah membantu mengoreksi harapan-harapan delusional kita, baik mengenai diri kita sendiri maupun dunia. Ia kini menuangkan buah pikirnya yang keren itu di dalam buku hebat ini.\nDalam hidup ini, kita hanya punya kepedulian dalam jumlah yang terbatas. Makanya, Anda harus bijaksana dalam menentukan kepedulian Anda. Manson menciptakan momen perbincangan yang serius dan mendalam, dibungkus dengan cerita-cerita yang menghibur dan \'kekinian\', serta humor yang cadas. Buku ini merupakan tamparan di wajah yang menyegarkan untuk kita semua, supaya kita bisa mulai menjalani kehidupan yang lebih memuaskan, dan apa adanya. ', '/images/book/Sebuah_Seni_Mark.jpg', 'Mark Manson', 'Gramedia Pustaka Utama', '2019-02-11 20:11:54'),
	('9786024553920', 'Bicara Itu Ada Seninya', 53000, 350, 256, 'TAHUKAH ANDA BAHWA BERBICARA ITU ADA SENINYA? Ketika komunikasi menjadi hal yang penting untuk bersaing, pakar komunikasi Oh Su Hyang mengeluarkan buku yang sangat berarti. Selain berisi tentang pengalaman peningkatan diri, buku ini juga memuat berbagai konten mengenai teknik komunikasi, persuasi, dan negosiasi.\n\nLalu bagaimana cara berbicara yang baik? Apakah berbicara dengan artikulasi yang jelas? Atau berbicara tanpa mengambil tarikan napas? Tidak! Sebuah ucapan yang bisa disebut baik adalah yang bisa menggetarkan hati. Ucapan seorang juara memiliki daya tarik tersendiri. Ucapan pemandu acara memiliki kemampuan menghidupkan suasana dan kekuatan kalimatnya yang terus terang. Anda harus pandai berbicara untuk menunjukkan diri Anda kepada lawan bicara dalam kehidupan sosial. Orang yang berbicara dengan mahir akan menjadi lebih maju daripada yang lainnya.', '/images/book/bicara_itu_ada_seninya.jpg', 'Oh Su Hyang', 'Bhuana Ilmu Populer', '2019-02-12 00:26:24'),
	('9786026714466', 'Kekasih Impian', 48000, 250, 176, 'Awalnya aku hanya menyukai satu unggahan foto di akun Instagram-mu. Dan kini aku menyukai semua tentangmu', '/images/book/kekasih_impian.jpg', 'Wardah Maulina', 'Falcon Publishing', '2019-02-11 20:35:02'),
	('9786026716392', 'ATHLAS', 72000, 400, 444, 'Percaya, deh, ini orang yang pengin banget kamu temuin sekarang juga. Dia cowok kocak, cool, ganteng, humble ke semua orang, selalu ceria di depan teman-temannya,  apa lagi, ya? Apa pun deh yang paling gemay dan bikin pengin cubit pipi ada di sosok Athlas.\n\nAthlas bukan sejenis peta. Dia adalah makhluk campuran Nakula dan Aluna. Isn�t that amazing? Nakula yang pintar dan pujaan semua cewek, berkolaborasi dengan Aluna yang bawel, mandiri, dan peduli pada sesama. Jadilah sosok Athlas!', '/images/book/PRD1550859443189.jpg', 'Eko Ivano Winata', 'Pastel Books', NULL),
	('9789797945251', 'Garis Waktu : Sebuah Perjalanan Menghapus Luka ', 46500, 200, 216, 'Pada sebuah garis waktu yang merangkak maju, akan ada saatnya kau bertemu dengan satu orang yang mengubah hidupmu untuk selamanya. Kemudian, satu  orang tersebut akan menjadi bagian terbesar dalam agendamu. Dan hatimu takkan memberikan pilihan apa pun kecuali jatuh cinta, biarpun logika terus berkata bahwa risiko dari jatuh cinta adalah terjerembab di dasar nestapa', '/images/book/garis_waktu_fiersa.jpg', 'Fiersa Besar', 'MediaKita', '2019-02-11 23:42:26'),
	('9789799731234', 'Bumi Manusia', 105000, 500, 0, 'Roman Tetralogi. <br />Buru mengambil latar belakang dan cikal bakal nation \r\nIndonesia di awal abad ke-20. Dengan membacanya waktu kita dibalikkan \r\nsedemikian rupa dan hidup di era membibitnya pergerakan nasional \r\nmula-mula, juga pertautan rasa, kegamangan jiwa, percintaan, dan \r\npertarungan kekuatan anonim para srikandi yang mengawal penyemaian \r\nbangunan nasional yang kemudian kelak melahirkan Indonesia modern.', '/images/book/bumi_manusia.jpeg', 'Pramoedya Ananta Toer', 'Lentera Dipantara', '2019-02-13 17:01:19');
/*!40000 ALTER TABLE `buku` ENABLE KEYS */;

-- Dumping structure for table semalamsuntuk.detil_transaksi
CREATE TABLE IF NOT EXISTS `detil_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table semalamsuntuk.detil_transaksi: ~14 rows (approximately)
/*!40000 ALTER TABLE `detil_transaksi` DISABLE KEYS */;
INSERT IGNORE INTO `detil_transaksi` (`id_transaksi`, `username`, `isbn`, `judul`, `harga`, `jumlah_beli`, `total_harga`) VALUES
	(1, 'jamal', '9786024125189', 'Filosofi Teras: Filsafat Yunani-Romawi Kuno Untuk Mental Tangguh Masa Kini', 78000, 1, 78000),
	(1, 'jamal', '9789797945251', 'Garis Waktu : Sebuah Perjalanan Menghapus Luka ', 46500, 2, 93000),
	(3, 'jamal', '9786026714466', 'Kekasih Impian', 48000, 1, 48000),
	(3, 'jamal', '9789797945251', 'Garis Waktu : Sebuah Perjalanan Menghapus Luka ', 46500, 1, 46500),
	(4, 'jamal', '9786024526986', 'Sebuah Seni untuk Bersikap Bodo Amat', 53000, 1, 53000),
	(4, 'jamal', '9786026714466', 'Kekasih Impian', 48000, 2, 96000),
	(5, 'jamal', '9786024526986', 'Sebuah Seni untuk Bersikap Bodo Amat', 53000, 2, 106000),
	(6, 'jamal', '9789797945251', 'Garis Waktu : Sebuah Perjalanan Menghapus Luka ', 46500, 1, 46500),
	(6, 'jamal', '9786024553920', 'Bicara Itu Ada Seninya', 53000, 1, 53000),
	(7, 'wedya', '9786026716392', 'ATHLAS', 72000, 1, 72000),
	(7, 'wedya', '9786022915249', 'Orang-Orang Biasa ', 76000, 1, 76000),
	(8, 'wedya', '9789799731234', 'Bumi Manusia', 105000, 1, 105000),
	(8, 'wedya', '9786024526986', 'Sebuah Seni untuk Bersikap Bodo Amat', 53000, 2, 106000),
	(9, 'wedya', '9769797945770', 'This Is Why I Need You', 101000, 1, 101000);
/*!40000 ALTER TABLE `detil_transaksi` ENABLE KEYS */;

-- Dumping structure for table semalamsuntuk.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` varchar(5) NOT NULL,
  `nama` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table semalamsuntuk.kategori: ~47 rows (approximately)
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT IGNORE INTO `kategori` (`id`, `nama`) VALUES
	('CT001', 'Anak-Anak'),
	('CT002', 'Arsitektur & Design Interior'),
	('CT003', 'Bahasa & Kamus'),
	('CT004', 'Biografi'),
	('CT005', 'Bisnis, Manajemen & Keuangan'),
	('CT006', 'Buku Impor'),
	('CT007', 'Buku Saku'),
	('CT008', 'Current Affairs & Reportage'),
	('CT009', 'Design'),
	('CT010', 'Ensiklopedia'),
	('CT011', 'Fashion & Beauty'),
	('CT012', 'Fiksi'),
	('CT013', 'Filsafat'),
	('CT014', 'Fotografi'),
	('CT015', 'Hobi & Interest'),
	('CT016', 'Hospitality'),
	('CT017', 'Humanitas'),
	('CT018', 'Inspirasional & Spiritualitas'),
	('CT019', 'Just for Fun'),
	('CT020', 'Katalog'),
	('CT021', 'Kesehatan'),
	('CT022', 'Kisah Nyata'),
	('CT023', 'Komik'),
	('CT024', 'Komputer'),
	('CT025', 'Kuliner'),
	('CT026', 'Life Style'),
	('CT027', 'Majalah'),
	('CT028', 'Menulis & Jurnalisme'),
	('CT029', 'Musik & Perfilman'),
	('CT030', 'Non Fiksi'),
	('CT031', 'Non-Profit and Philantrophy'),
	('CT032', 'Orang Tua & Keluarga'),
	('CT033', 'Pengembangan Diri & Motivasi'),
	('CT034', 'Pertanian & Perkebunan'),
	('CT035', 'Peternakan & Perikanan'),
	('CT036', 'Politik & Hukum'),
	('CT037', 'Psikologi'),
	('CT038', 'Puisi & Sastra'),
	('CT039', 'Referensi'),
	('CT040', 'Relationship & Weddings'),
	('CT041', 'Religius'),
	('CT042', 'Sains & Teknologi'),
	('CT043', 'Sejarah'),
	('CT044', 'Seni & Budaya'),
	('CT045', 'Textbooks'),
	('CT046', 'Travel'),
	('CT047', 'Umum');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;

-- Dumping structure for table semalamsuntuk.keranjang
CREATE TABLE IF NOT EXISTS `keranjang` (
  `username` varchar(45) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_berat` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table semalamsuntuk.keranjang: ~0 rows (approximately)
/*!40000 ALTER TABLE `keranjang` DISABLE KEYS */;
/*!40000 ALTER TABLE `keranjang` ENABLE KEYS */;

-- Dumping structure for table semalamsuntuk.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `username` varchar(50) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `waktu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table semalamsuntuk.payment: ~6 rows (approximately)
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT IGNORE INTO `payment` (`username`, `id_transaksi`, `waktu`, `image`) VALUES
	('jamal', 5, '2019-02-21 01:06:47', '/images/transaction//PAY1550686007550.jpg'),
	('jamal', 2, '2019-02-21 01:07:38', '/images/transaction//PAY1550686058237.png'),
	('jamal', 3, '2019-02-22 22:16:02', '/images/transaction//PAY1550848562365.png'),
	('jamal', 4, '2019-02-22 22:18:30', '/images/transaction//PAY1550848710708.png'),
	('wedya', 7, '2019-02-23 23:13:23', '/images/transaction//PAY1550938403658.jpg'),
	('wedya', 8, '2019-02-23 23:16:07', '/images/transaction//PAY1550938567548.jpg');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

-- Dumping structure for table semalamsuntuk.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `waktu` datetime NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `total_berat` int(11) NOT NULL,
  `is_finished` varchar(3) NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table semalamsuntuk.transaksi: ~9 rows (approximately)
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT IGNORE INTO `transaksi` (`id_transaksi`, `username`, `waktu`, `total_bayar`, `total_berat`, `is_finished`) VALUES
	(1, 'jamal', '2019-02-19 20:44:36', 171000, 750, 'yes'),
	(3, 'jamal', '2019-02-19 20:58:23', 94500, 450, 'no'),
	(4, 'jamal', '2019-02-20 20:01:07', 149000, 850, 'no'),
	(5, 'jamal', '2019-02-20 20:30:09', 106000, 700, 'yes'),
	(6, 'jamal', '2019-02-22 22:17:53', 99500, 550, 'no'),
	(7, 'wedya', '2019-02-23 23:09:12', 148000, 700, 'yes'),
	(8, 'wedya', '2019-02-23 23:15:21', 211000, 1200, 'yes'),
	(9, 'wedya', '2019-02-23 23:16:35', 101000, 550, 'no');
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;

-- Dumping structure for table semalamsuntuk.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) NOT NULL,
  `role` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table semalamsuntuk.users: ~9 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `username`, `password`, `email`, `phone`, `role`, `status`, `lastlogin`) VALUES
	(1, 'jamal', 'd1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11', 'others.jamal@gmail.com', '0885778444888', 'User', 'Verified', '2019-02-24 11:56:07'),
	(2, 'rahman', 'd1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11', 'rahman.jamal@gmail.com', '0885778444888', 'User', 'Verified', NULL),
	(3, 'fazlur', 'd1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11', 'others.jamal@gmail.com', '085778444999', 'User', 'Verified', '2019-02-06 21:39:27'),
	(4, 'farah', 'd1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11', 'fazlur.jamal@gmail.com', '1234', 'User', 'Verified', '2019-02-06 23:27:55'),
	(9, 'wedya', 'd1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11', 'others.jamal@gmail.com', '085778444888', 'User', 'Verified', '2019-02-24 11:43:08'),
	(10, 'meru', 'd1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11', 'fazlur.jamal@gmail.com', '12345', 'User', 'Unverified', '2019-02-14 12:54:20'),
	(11, 'jagoanneon', '01239bb6fdefaeeecff8e6aac8a8a4dd4e03f09817fa6444cc22ef7db81ba9e4', 'fazlur.jamal@gmail.com', '08999934354', 'User', 'Verified', '2019-02-16 16:37:50'),
	(12, 'baldy', 'f7203b045d5b4079d0c9b76bb1b2f9b395336a93fbffd86ed78189d39bff17b3', 'others.jamal@gmail.com', '0819152335783', 'User', 'Unverified', '2019-02-16 16:44:21'),
	(13, 'bodhi', 'd1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11', 'others.jamal@gmail.com', '1234567890', 'User', 'Unverified', '2019-02-16 16:48:22'),
	(14, 'admin1', 'd1f6a1074838becdc9231fc69a1a0247dd1d64a46ba7ba7d629f404f0201df11', 'fazlur.jamal@gmail.com', '085778444888', 'Admin', 'Verified', '2019-02-24 12:53:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
