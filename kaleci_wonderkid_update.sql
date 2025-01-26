-- Kaleci istatistikleri tablosunu oluştur
CREATE TABLE IF NOT EXISTS `kaleci_istatistikleri` (
  `kaleci_id` int NOT NULL AUTO_INCREMENT,
  `oyuncu_id` int NOT NULL,
  `kurtaris_orani` decimal(4,1) NOT NULL,
  `gol_yememis_mac` int NOT NULL,
  `penalti_kurtarma` int NOT NULL,
  `uzun_top_isabet` decimal(4,1) NOT NULL,
  `ortalama_puan` decimal(3,1) NOT NULL,
  PRIMARY KEY (`kaleci_id`),
  KEY `oyuncu_id` (`oyuncu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Kaleci istatistiklerini ekle (oyuncu_id'leri fener_kadro tablosundan alınacak)
INSERT INTO `kaleci_istatistikleri` (`oyuncu_id`, `kurtaris_orani`, `gol_yememis_mac`, `penalti_kurtarma`, `uzun_top_isabet`, `ortalama_puan`) 
SELECT 
    oyuncu_id, 
    CASE 
        WHEN isim = 'Dominik Livakovic' THEN 85.5
        WHEN isim = 'İrfan Can Eğribayat' THEN 78.2
    END as kurtaris_orani,
    CASE 
        WHEN isim = 'Dominik Livakovic' THEN 12
        WHEN isim = 'İrfan Can Eğribayat' THEN 8
    END as gol_yememis_mac,
    CASE 
        WHEN isim = 'Dominik Livakovic' THEN 3
        WHEN isim = 'İrfan Can Eğribayat' THEN 1
    END as penalti_kurtarma,
    CASE 
        WHEN isim = 'Dominik Livakovic' THEN 75.5
        WHEN isim = 'İrfan Can Eğribayat' THEN 70.2
    END as uzun_top_isabet,
    CASE 
        WHEN isim = 'Dominik Livakovic' THEN 7.8
        WHEN isim = 'İrfan Can Eğribayat' THEN 7.2
    END as ortalama_puan
FROM fener_kadro 
WHERE pozisyon = 'Kaleci';

-- Wonderkid tablosunu oluştur
CREATE TABLE IF NOT EXISTS `wonderkids` (
  `wonderkid_id` int NOT NULL AUTO_INCREMENT,
  `isim` varchar(40) COLLATE utf8mb4_turkish_ci NOT NULL,
  `yas` smallint NOT NULL,
  `ulke` varchar(30) COLLATE utf8mb4_turkish_ci NOT NULL,
  `takim` varchar(40) COLLATE utf8mb4_turkish_ci NOT NULL,
  `pozisyon` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `potansiyel` smallint NOT NULL,
  `deger` varchar(10) COLLATE utf8mb4_turkish_ci NOT NULL,
  `scout_yorum` varchar(200) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`wonderkid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Wonderkid oyuncularını ekle
INSERT INTO `wonderkids` (`isim`, `yas`, `ulke`, `takim`, `pozisyon`, `potansiyel`, `deger`, `scout_yorum`) VALUES
('Jude Bellingham', 19, 'İngiltere', 'Real Madrid', 'Orta Saha', 95, '€150M', 'Olağanüstü yetenek, modern futbolun tüm gerekliliklerini karşılayan komple bir orta saha.'),
('Jamal Musiala', 20, 'Almanya', 'Bayern Münih', 'Orta Saha', 93, '€110M', 'Teknik kapasitesi ve dripling yeteneği ile öne çıkan yaratıcı orta saha.'),
('Gavi', 19, 'İspanya', 'Barcelona', 'Orta Saha', 92, '€90M', 'La Masia''nın yeni yıldızı, oyun zekası ve pas yeteneği üst düzey.'),
('Florian Wirtz', 20, 'Almanya', 'Bayer Leverkusen', 'Orta Saha', 91, '€85M', 'Yaratıcı oyun kurucusu, asist ve gol katkısı yüksek.'),
('Alejandro Balde', 20, 'İspanya', 'Barcelona', 'Defans', 89, '€50M', 'Modern sol bek, hızı ve ofansif katkısıyla dikkat çekiyor.'),
('Lamine Yamal', 16, 'İspanya', 'Barcelona', 'Forvet', 94, '€50M', 'Barcelona''nın yeni harikası, müthiş bir teknik kapasite.'),
('Endrick', 17, 'Brezilya', 'Palmeiras', 'Forvet', 93, '€45M', 'Yeni Pelé olarak görülüyor, müthiş bir golcü içgüdüsü.'),
('Warren Zaïre-Emery', 17, 'Fransa', 'PSG', 'Orta Saha', 90, '€40M', 'PSG''nin genç yıldızı, olgun oyun tarzı ve teknik kapasitesi ile öne çıkıyor.'),
('Mathys Tel', 18, 'Fransa', 'Bayern Münih', 'Forvet', 88, '€35M', 'Hızlı ve güçlü forvet, gol yollarında etkili.'),
('Antonio Nusa', 18, 'Norveç', 'Club Brugge', 'Forvet', 87, '€30M', 'Norveç''in yeni Haaland''ı, müthiş bir atletik yapı.'),
('Arda Güler', 18, 'Türkiye', 'Real Madrid', 'Orta Saha', 92, '€40M', 'Türk futbolunun yeni yıldızı, teknik kapasitesi ve yaratıcılığı üst düzey.');
