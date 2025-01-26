-- Önce mevcut tabloyu sil
DROP TABLE IF EXISTS `fener_kadro`;

-- Fenerbahçe 2024 kadro tablosunu oluştur
CREATE TABLE `fener_kadro` (
  `oyuncu_id` int NOT NULL AUTO_INCREMENT,
  `isim` varchar(40) COLLATE utf8mb4_turkish_ci NOT NULL,
  `oynadigi_takim` varchar(30) COLLATE utf8mb4_turkish_ci NOT NULL DEFAULT 'Fenerbahçe',
  `uyruk` varchar(30) COLLATE utf8mb4_turkish_ci NOT NULL,
  `yas` smallint NOT NULL,
  `piyasa_degeri` varchar(10) COLLATE utf8mb4_turkish_ci NOT NULL,
  `boy` decimal(3,2) NOT NULL,
  `kilo` smallint NOT NULL,
  `mac_basi_puan` decimal(3,1) NOT NULL,
  `pozisyon` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `forma_no` smallint NOT NULL,
  `scout_yorum` varchar(200) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`oyuncu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Fenerbahçe 2024 kadrosunu ekle
INSERT INTO `fener_kadro` (`isim`, `uyruk`, `yas`, `piyasa_degeri`, `boy`, `kilo`, `mac_basi_puan`, `pozisyon`, `forma_no`, `scout_yorum`) VALUES
-- Kaleciler
('Dominik Livaković', 'Hırvatistan', 29, '€12M', 1.88, 83, 7.8, 'Kaleci', 1, 'Milli takım kalecisi, refleksleri ve kurtarışları üst düzey. Özellikle penaltılarda başarılı.'),
('İrfan Can Eğribayat', 'Türkiye', 25, '€3.5M', 1.90, 84, 7.2, 'Kaleci', 34, 'Genç ve gelişime açık kaleci. Uzun boyuyla hava toplarında etkili.'),
('Osman Ertuğrul Çetin', 'Türkiye', 21, '€500K', 1.93, 85, 6.8, 'Kaleci', 54, 'Gelecek vadeden genç kaleci. Fiziksel özellikleri üst düzey.'),

-- Defans
('Alexander Djiku', 'Gana', 29, '€10M', 1.82, 74, 7.7, 'Defans', 27, 'Güçlü ve agresif stoper. Hava toplarında ve adam markajında etkili.'),
('Jayden Oosterwolde', 'Hollanda', 22, '€12M', 1.88, 80, 7.7, 'Defans', 3, 'Modern sol bek profili. Hızlı, atletik ve ofansif katkısı yüksek.'),
('Ferdi Kadıoğlu', 'Türkiye', 24, '€18M', 1.76, 69, 7.9, 'Defans', 7, 'Çok yönlü ve teknik kapasitesi yüksek. Hem defansta hem ofrta sahada oynayabiliyor.'),
('Çağlar Söyüncü', 'Türkiye', 27, '€22M', 1.87, 82, 7.6, 'Defans', 4, 'Tecrübeli ve lider karakterli stoper. Premier League tecrübesi önemli bir artı.'),
('Rodrigo Becão', 'Brezilya', 28, '€12M', 1.91, 86, 7.6, 'Defans', 33, 'Fiziksel gücü yüksek ve hava toplarında etkili stoper.'),
('Mert Müldür', 'Türkiye', 24, '€8M', 1.83, 76, 7.4, 'Defans', 2, 'Hızlı ve ofansif özellikleri olan sağ bek.'),
('İsmail Yüksek', 'Türkiye', 24, '€12M', 1.83, 76, 7.7, 'Defans', 6, 'Hem defansta hem orta sahada oynayabilen çok yönlü oyuncu.'),

-- Orta Saha
('Fred', 'Brezilya', 30, '€15M', 1.69, 64, 7.8, 'Orta Saha', 21, 'Manchester United tecrübeli orta saha. Yüksek çalışma temposu ve pas yeteneği ile öne çıkıyor.'),
('Sebastian Szymański', 'Polonya', 24, '€25M', 1.74, 64, 8.0, 'Orta Saha', 10, 'Yaratıcı ve üretken orta saha. Asist ve gol katkısı yüksek.'),
('İrfan Can Kahveci', 'Türkiye', 28, '€12M', 1.76, 70, 7.7, 'Orta Saha', 17, 'Teknik kapasitesi yüksek, özellikle uzaktan şutlarda etkili.'),
('Dušan Tadić', 'Sırbistan', 35, '€8M', 1.81, 76, 7.9, 'Orta Saha', 11, 'Tecrübeli ve lider karakterli oyuncu. Asist krallığında iddialı.'),
('Miguel Crespo', 'Portekiz', 27, '€8M', 1.75, 70, 7.5, 'Orta Saha', 8, 'Taktik disiplini yüksek ve çok yönlü orta saha.'),
('Lincoln Henrique', 'Brezilya', 25, '€7M', 1.74, 68, 7.4, 'Orta Saha', 18, 'Teknik özellikleri ile öne çıkan yaratıcı orta saha.'),
('Mert Hakan Yandaş', 'Türkiye', 29, '€5M', 1.78, 73, 7.3, 'Orta Saha', 15, 'Takım oyununa katkı sağlayan, mücadeleci orta saha.'),

-- Forvet
('Edin Džeko', 'Bosna Hersek', 37, '€6M', 1.93, 87, 7.8, 'Forvet', 9, 'Tecrübeli ve kariyerli santrfor. Gol yollarında ve asist katkısında etkili.'),
('Sebastian Szymański', 'Polonya', 24, '€25M', 1.74, 64, 8.0, 'Forvet', 99, 'Sezonun yıldız transferi. Hem asist hem gol potansiyeli yüksek.'),
('Cengiz Ünder', 'Türkiye', 26, '€17M', 1.73, 66, 7.7, 'Forvet', 23, 'Hızlı ve teknik özellikleri ile öne çıkan kanat oyuncusu.'),
('Joshua King', 'Norveç', 31, '€7M', 1.87, 84, 7.6, 'Forvet', 29, 'Fiziksel gücü ve hızıyla öne çıkan forvet.'),
('Michy Batshuayi', 'Belçika', 30, '€10M', 1.85, 78, 7.5, 'Forvet', 19, 'Gol yollarında etkili ve tecrübeli forvet.'),
('Ryan Kent', 'İngiltere', 27, '€12M', 1.72, 65, 7.4, 'Forvet', 14, 'Hızlı ve teknik özellikleri ile öne çıkan kanat oyuncusu.'),
('İrfan Can Kahveci', 'Türkiye', 28, '€12M', 1.76, 70, 7.7, 'Forvet', 17, 'Hem orta sahada hem kanatta oynayabilen çok yönlü oyuncu.');
