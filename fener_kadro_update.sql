-- Fenerbahçe oyuncularını oyuncular tablosundan sil
DELETE FROM `oyuncular` WHERE `oyuncu_takim` = 90;

-- Fenerbahçe'yi futbol_kadrom tablosundan sil
DELETE FROM `futbol_kadrom` WHERE `takim_id` = 90;

-- Yeni Fenerbahçe kadro tablosunu oluştur
CREATE TABLE IF NOT EXISTS `fener_kadro` (
  `oyuncu_id` int NOT NULL AUTO_INCREMENT,
  `isim` varchar(40) COLLATE utf8mb4_turkish_ci NOT NULL,
  `oynadigi_takim` varchar(30) COLLATE utf8mb4_turkish_ci NOT NULL,
  `uyruk` varchar(30) COLLATE utf8mb4_turkish_ci NOT NULL,
  `yas` smallint NOT NULL,
  `piyasa_degeri` varchar(10) COLLATE utf8mb4_turkish_ci NOT NULL,
  `boy` decimal(3,2) NOT NULL,
  `kilo` smallint NOT NULL,
  `mac_basi_puan` decimal(3,1) NOT NULL,
  `pozisyon` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `scout_yorum` varchar(200) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`oyuncu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Fenerbahçe 2024 kadrosunu ekle
INSERT INTO `fener_kadro` (`isim`, `oynadigi_takim`, `uyruk`, `yas`, `piyasa_degeri`, `boy`, `kilo`, `mac_basi_puan`, `pozisyon`, `scout_yorum`) VALUES
('Dominik Livakovic', 'Fenerbahçe', 'Hırvatistan', 29, '€20M', 1.88, 83, 7.8, 'Kaleci', 'Tecrübeli ve güvenilir kaleci, refleksleri ve kurtarışları üst düzey.'),
('İrfan Can Eğribayat', 'Fenerbahçe', 'Türkiye', 25, '€5M', 1.90, 84, 7.2, 'Kaleci', 'Gelişime açık, potansiyeli yüksek genç kaleci.'),
('Alexander Djiku', 'Fenerbahçe', 'Gana', 29, '€15M', 1.82, 74, 7.7, 'Defans', 'Güçlü defansif özellikleri olan, oyun kurmada etkili stoper.'),
('Serdar Aziz', 'Fenerbahçe', 'Türkiye', 33, '€8M', 1.83, 79, 7.5, 'Defans', 'Tecrübeli, hava toplarında etkili ve lider özellikli stoper.'),
('Rodrigo Becão', 'Fenerbahçe', 'Brezilya', 28, '€12M', 1.91, 86, 7.6, 'Defans', 'Fiziksel gücü yüksek, markaj ve hava toplarında başarılı stoper.'),
('Jayden Oosterwolde', 'Fenerbahçe', 'Hollanda', 22, '€18M', 1.88, 80, 7.7, 'Defans', 'Hızlı, atletik ve ofansif katkısı yüksek modern sol bek.'),
('Ferdi Kadıoğlu', 'Fenerbahçe', 'Türkiye', 24, '€25M', 1.76, 69, 7.9, 'Defans', 'Çok yönlü, teknik kapasitesi ve ofansif katkısı yüksek sağ bek.'),
('İsmail Yüksek', 'Fenerbahçe', 'Türkiye', 24, '€15M', 1.83, 76, 7.7, 'Orta Saha', 'Dinamik, mücadeleci ve oyun okuma yeteneği yüksek defansif orta saha.'),
('Fred', 'Fenerbahçe', 'Brezilya', 30, '€20M', 1.69, 64, 7.8, 'Orta Saha', 'Tecrübeli, yüksek çalışma temposu ve pas yeteneğiyle öne çıkan orta saha.'),
('İrfan Can Kahveci', 'Fenerbahçe', 'Türkiye', 28, '€15M', 1.76, 70, 7.7, 'Orta Saha', 'Teknik kapasitesi ve uzaktan şut yeteneği yüksek, yaratıcı orta saha.'),
('Sebastian Szymański', 'Fenerbahçe', 'Polonya', 24, '€25M', 1.74, 64, 8.0, 'Orta Saha', 'Yaratıcı, üretken ve gol katkısı yüksek ofansif orta saha.'),
('Dusan Tadic', 'Fenerbahçe', 'Sırbistan', 35, '€15M', 1.81, 76, 7.9, 'Orta Saha', 'Tecrübeli, lider özellikli ve asist katkısı yüksek sol kanat.'),
('Joshua King', 'Fenerbahçe', 'Norveç', 31, '€10M', 1.87, 84, 7.6, 'Forvet', 'Fiziksel gücü ve hızıyla öne çıkan, çok yönlü forvet.'),
('Edin Dzeko', 'Fenerbahçe', 'Bosna Hersek', 37, '€12M', 1.93, 85, 7.8, 'Forvet', 'Tecrübeli, hava toplarında etkili ve gol yollarında başarılı forvet.'),
('Michy Batshuayi', 'Fenerbahçe', 'Belçika', 30, '€15M', 1.85, 78, 7.7, 'Forvet', 'Hareketli, bitiricilik özelliği yüksek ve hızlı forvet.'),
('Cengiz Ünder', 'Fenerbahçe', 'Türkiye', 26, '€18M', 1.73, 66, 7.8, 'Orta Saha', 'Hızlı, teknik kapasitesi yüksek ve etkili şut yeteneğine sahip sağ kanat.'),
('Mert Hakan Yandaş', 'Fenerbahçe', 'Türkiye', 29, '€8M', 1.78, 70, 7.6, 'Orta Saha', 'Mücadeleci, orta sahada box-to-box oynayabilen dinamik oyuncu.'),
('Çağlar Söyüncü', 'Fenerbahçe', 'Türkiye', 27, '€22M', 1.87, 82, 7.7, 'Defans', 'Hızlı, güçlü ve top çıkarmada başarılı modern stoper.'),
('Bright Osayi-Samuel', 'Fenerbahçe', 'Nijerya', 26, '€15M', 1.76, 70, 7.7, 'Defans', 'Hızlı, atletik ve ofansif katkısı yüksek sağ bek/kanat.'),
('Miguel Crespo', 'Fenerbahçe', 'Portekiz', 27, '€10M', 1.78, 72, 7.5, 'Orta Saha', 'Çok yönlü, taktik disiplini yüksek orta saha oyuncusu.'),
('Lincoln Henrique', 'Fenerbahçe', 'Brezilya', 24, '€12M', 1.77, 68, 7.6, 'Orta Saha', 'Teknik kapasitesi yüksek, yaratıcı ofansif orta saha.');
