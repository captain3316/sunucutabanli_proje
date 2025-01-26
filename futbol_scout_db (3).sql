-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 26 Oca 2025, 00:47:08
-- Sunucu sürümü: 8.0.40
-- PHP Sürümü: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `futbol_scout_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `futbol_kadrom`
--

DROP TABLE IF EXISTS `futbol_kadrom`;
CREATE TABLE IF NOT EXISTS `futbol_kadrom` (
  `takim_id` int NOT NULL AUTO_INCREMENT,
  `takim_ad` varchar(30) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`takim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `futbol_kadrom`
--

INSERT INTO `futbol_kadrom` (`takim_id`, `takim_ad`) VALUES
(3, 'Borussia Dortmund'),
(4, 'Liverpool'),
(5, 'Milan'),
(6, 'Manchester United'),
(7, 'Bayer Leverkusen'),
(8, 'Chelsea'),
(9, 'Barcelona'),
(10, 'Villarreal'),
(11, 'Atalanta'),
(12, 'RB Leipzig'),
(13, 'Espanyol'),
(14, 'Benfica'),
(15, 'Athletico Paranaense'),
(16, 'PSV Eindhoven'),
(17, 'Everton'),
(18, 'Real Madrid'),
(19, 'Nice'),
(20, 'Newcastle United'),
(21, 'Arsenal'),
(22, 'Manchester City'),
(23, 'Aston Villa'),
(24, 'Brighton'),
(25, 'Celtic'),
(26, 'VfB Stuttgart'),
(27, 'Eintracht Frankfurt'),
(28, 'Porto'),
(29, 'Bournemouth'),
(30, 'VfL Wolfsburg'),
(31, 'Tottenham'),
(32, 'Galatasaray'),
(33, 'Napoli'),
(34, 'AS Roma'),
(35, 'Royale Union Saint-Gilloise'),
(36, 'Fiorentina'),
(37, 'Sevilla'),
(38, 'Al Arabi'),
(39, 'Southampton'),
(40, 'Leeds United'),
(45, 'Bayern Münih'),
(50, 'West Ham'),
(56, 'Feyenoord'),
(57, 'Inter Milan'),
(58, 'Ajax'),
(59, 'Brighton'),
(60, 'Olympique Marseille'),
(65, 'Wolverhampton Wanderers'),
(66, 'Wolverhampton Wanderers'),
(67, 'Wolverhampton Wanderers'),
(68, 'Bayer Leverkusen'),
(69, 'Arsenal'),
(70, 'Manchester City'),
(71, 'Aston Villa'),
(72, 'Galatasaray'),
(73, 'RB Leipzig'),
(74, 'Feyenoord'),
(75, 'Nice'),
(76, 'PSV Eindhoven'),
(77, 'Everton'),
(78, 'Chelsea'),
(79, 'Real Madrid'),
(80, 'Atalanta'),
(81, 'Espanyol'),
(82, 'Athletico Paranaense'),
(83, 'Barcelona'),
(84, 'Villarreal'),
(85, 'Barcelona'),
(86, 'Villarreal');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanıcılar`
--

DROP TABLE IF EXISTS `kullanıcılar`;
CREATE TABLE IF NOT EXISTS `kullanıcılar` (
  `kullanici_ad` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kullanici_sifre` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mevkiler`
--

DROP TABLE IF EXISTS `mevkiler`;
CREATE TABLE IF NOT EXISTS `mevkiler` (
  `mevki_id` int NOT NULL AUTO_INCREMENT,
  `mevki_ad` varchar(30) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`mevki_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `mevkiler`
--

INSERT INTO `mevkiler` (`mevki_id`, `mevki_ad`) VALUES
(1, 'Santrafor'),
(2, 'İkinci Forvet'),
(3, 'Sağ Kanat'),
(4, 'Sol Kanat'),
(5, 'Merkez Orta Saha'),
(6, 'Ofansif Orta Saha'),
(7, 'Defansif Orta Saha'),
(8, 'Sol Orta Saha'),
(9, 'Sağ Orta Saha'),
(10, 'Sağ Bek'),
(11, 'Sol Bek'),
(12, 'Sağ Stoper'),
(13, 'Sol Stoper'),
(14, 'Stoper'),
(15, 'Kaleci');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oyuncular`
--

DROP TABLE IF EXISTS `oyuncular`;
CREATE TABLE IF NOT EXISTS `oyuncular` (
  `oyuncu_id` int NOT NULL AUTO_INCREMENT,
  `oyuncu_ad` varchar(40) COLLATE utf8mb4_turkish_ci NOT NULL,
  `oyuncu_takim` int NOT NULL,
  `oyuncu_ulke` int NOT NULL,
  `oyuncu_yas` smallint NOT NULL,
  `oyuncu_degeri` mediumint NOT NULL,
  `oyuncu_boy` smallint NOT NULL,
  `oyuncu_kilo` smallint NOT NULL,
  `oyuncu_mevki` int NOT NULL,
  `oyuncu_2022_gol` smallint NOT NULL,
  `oyuncu_2023_gol` smallint NOT NULL,
  `oyuncu_2022_assist` smallint NOT NULL,
  `oyuncu_2023_assist` smallint NOT NULL,
  `oyuncu_ort_paun` smallint NOT NULL,
  `oyuncu_gozlemci_yorum` varchar(200) COLLATE utf8mb4_turkish_ci NOT NULL,
  `oyuncu_ayak` varchar(10) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`oyuncu_id`),
  KEY `oyuncu_takim` (`oyuncu_takim`,`oyuncu_ulke`,`oyuncu_mevki`),
  KEY `oyuncu_ulke` (`oyuncu_ulke`),
  KEY `oyuncular_ibfk_3` (`oyuncu_mevki`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `oyuncular`
--

INSERT INTO `oyuncular` (`oyuncu_id`, `oyuncu_ad`, `oyuncu_takim`, `oyuncu_ulke`, `oyuncu_yas`, `oyuncu_degeri`, `oyuncu_boy`, `oyuncu_kilo`, `oyuncu_mevki`, `oyuncu_2022_gol`, `oyuncu_2023_gol`, `oyuncu_2022_assist`, `oyuncu_2023_assist`, `oyuncu_ort_paun`, `oyuncu_gozlemci_yorum`, `oyuncu_ayak`) VALUES
(1, 'Giovanni Reyna', 3, 1, 21, 24, 180, 73, 3, 2, 6, 3, 5, 76, 'Hızlı, yaratıcı ve teknik; oyun görüşü mükemmel ama bazen fiziksel direnci zayıf kalabiliyor.', 'Sağ'),
(2, 'Cody Gakpo', 4, 2, 24, 30, 188, 80, 4, 8, 12, 5, 7, 77, 'Fiziksel olarak güçlü ve oyun içinde çok yönlü; sol kanatta çok etkili ama daha disiplinli olmalı.', 'Sol'),
(3, 'Mark Travers', 29, 24, 24, 15, 198, 87, 15, 0, 0, 0, 0, 76, 'Genç yaşına rağmen kendini geliştiren ve takımını savunmada iyi yönlendiren bir kaleci.', 'Sağ'),
(6, 'Rafael Leão', 5, 3, 24, 24, 188, 84, 4, 11, 8, 7, 4, 79, 'Hızlı ve yaratıcı, top taşıma konusunda çok etkili; savunmada ise bazen daha disiplinli olmalı.', 'Sol'),
(7, 'Youssoufa Moukoko', 3, 4, 19, 18, 180, 75, 3, 2, 6, 1, 2, 75, 'Genç yaşına rağmen oldukça olgun bir oyuncu; çok yönlü hücumcu ama bazen daha fazla konsantrasyon gerektirebilir.', 'Sağ'),
(8, 'Antony', 6, 5, 23, 30, 175, 67, 3, 8, 7, 4, 6, 76, 'Hızlı ve dribling yeteneği yüksek; zaman zaman bencil olabiliyor, takım oyununa daha fazla katkı sağlamalı.', 'Sağ'),
(9, 'Moussa Diaby', 7, 6, 24, 50, 170, 68, 4, 9, 13, 7, 12, 80, 'Hızlı, topa hakim ve yaratıcı; ofansif anlamda büyük katkılar sağlıyor, defansif anlamda da takıma faydalı.', 'Sağ'),
(10, 'Noni Madueke', 8, 7, 22, 25, 180, 70, 4, 4, 5, 2, 3, 77, 'Fiziksel olarak güçlü ve hızlı, driblingiyle rakipleri zorluyor; top kayıplarına dikkat etmesi gerekebilir.', 'Sağ'),
(11, 'Ferran Torres', 9, 8, 24, 35, 184, 78, 4, 5, 7, 3, 6, 76, 'Topu çok iyi taşıyor ve hızlı, ancak final vuruşlarında zaman zaman isabetsiz olabiliyor.', 'Sol'),
(12, 'Anssumane Fati', 9, 8, 21, 30, 178, 75, 4, 6, 4, 2, 1, 74, 'Hızlı, yaratıcı ve çevik; oyun görüşü gelişiyor fakat fiziksel olarak zaman zaman zayıf kalabiliyor.', 'Sol'),
(13, 'Samuel Chukwueze', 10, 9, 24, 20, 175, 72, 4, 7, 7, 8, 8, 76, 'Hızlı ve teknik bir oyuncu, dribling yeteneği yüksek ancak son vuruşlarda daha istikrarlı olmalı.', 'Sol'),
(14, 'Rasmus Højlund', 11, 10, 20, 30, 190, 88, 1, 5, 9, 2, 3, 76, 'Fiziksel gücü ve bitiricilik özelliği ile öne çıkan genç forvet, hava toplarında etkili.', 'Sol'),
(15, 'Benjamin Šeško', 12, 11, 21, 35, 194, 86, 1, 5, 8, 2, 3, 78, 'Uzun boyu ve hızıyla dikkat çeken forvet, gelişime açık ve potansiyeli yüksek.', 'Sağ'),
(16, 'César Montes', 13, 12, 22, 20, 190, 80, 1, 0, 5, 1, 2, 75, 'Güçlü defansif özellikleri olan, hava toplarında etkili stoper.', 'Sağ'),
(17, 'Gonçalo Ramos', 14, 3, 22, 40, 185, 79, 1, 12, 19, 2, 4, 79, 'Çok yönlü forvet oyuncusu, bitiricilik özelliği ve oyun zekası yüksek.', 'Sağ'),
(18, 'Vitor Roque', 15, 5, 18, 25, 176, 70, 1, 8, 12, 3, 5, 77, 'Genç yaşına rağmen olgun oyun stili, hızlı ve teknik özellikleri ile öne çıkıyor.', 'Sağ'),
(19, 'Mauro Junior', 16, 5, 22, 20, 173, 72, 5, 5, 8, 3, 5, 75, 'Çok yönlü defans oyuncusu, hücuma katkı sağlama konusunda başarılı.', 'Sağ'),
(20, 'Amadou Onana', 17, 14, 22, 30, 195, 85, 7, 2, 3, 1, 2, 76, 'Fiziksel gücü ve top kapma yeteneği ile öne çıkan orta saha oyuncusu.', 'Sağ'),
(21, 'Enzo Fernández', 8, 13, 22, 80, 180, 75, 5, 3, 5, 4, 7, 80, 'Teknik kapasitesi yüksek, oyun kurucu özelliği olan modern orta saha.', 'Sağ'),
(22, 'Ibrahima Sangaré', 16, 15, 22, 25, 187, 80, 14, 4, 7, 2, 4, 77, 'Güçlü fiziksel özellikleri ve top kapma yeteneği ile öne çıkan defansif oyuncu.', 'Sağ'),
(23, 'Jude Bellingham', 18, 7, 20, 120, 186, 73, 5, 6, 14, 4, 9, 85, 'Genç yaşına rağmen liderlik özellikleri olan, teknik kapasitesi yüksek orta saha.', 'Sağ'),
(24, 'Amadou Haidara', 12, 16, 22, 20, 172, 74, 6, 3, 6, 1, 2, 75, 'Dinamik ve çalışkan orta saha oyuncusu, press direnci yüksek.', 'Sağ'),
(25, 'Orkun Kökçü', 56, 17, 22, 30, 175, 72, 5, 7, 11, 4, 7, 78, 'Teknik kapasitesi ve oyun kurma yeteneği yüksek, uzun mesafe şutları etkili.', 'Sol'),
(26, 'Khephren Thuram', 19, 6, 22, 30, 187, 80, 5, 1, 2, 2, 3, 76, 'Fiziksel özellikleri ve top kontrolü ile öne çıkan box-to-box orta saha.', 'Sağ'),
(27, 'Florentino Luís', 14, 3, 24, 22, 185, 78, 7, 0, 1, 1, 2, 75, 'Defansif orta saha pozisyonunda etkili, top kapma yeteneği yüksek.', 'Sağ'),
(28, 'Sandro Tonali', 20, 18, 22, 60, 182, 74, 7, 3, 5, 1, 2, 79, 'Modern orta saha profili, hem defansif hem ofansif katkı sağlayabiliyor.', 'Sağ'),
(29, 'Declan Rice', 21, 7, 22, 80, 185, 79, 7, 2, 4, 2, 3, 80, 'Liderlik özellikleri olan, çok yönlü ve modern bir orta saha.', 'Sağ'),
(30, 'Sergio Gómez', 22, 8, 22, 25, 174, 67, 5, 1, 2, 2, 4, 74, 'Teknik kapasitesi yüksek, oyun kurmada etkili genç yetenek.', 'Sol'),
(31, 'Boubacar Kamara', 23, 6, 22, 30, 182, 76, 3, 0, 1, 2, 3, 76, 'Defansif orta sahada etkili, top kapma ve pas yeteneği yüksek.', 'Sağ'),
(32, 'Gavin Bazunu', 39, 24, 21, 20, 198, 85, 15, 0, 0, 0, 0, 75, 'Genç yaşına rağmen çok iyi bir refleks yeteneğine sahip, topa hakimiyet ve güvenilir kurtarışlar yapabiliyor.', 'Sağ'),
(33, 'Illan Meslier', 40, 6, 24, 22, 195, 80, 15, 0, 0, 0, 0, 76, 'Yüksek refleksleri ve liderlik özellikleriyle dikkat çeken bir kaleci.', 'Sol'),
(34, 'Sofyan Amrabat', 6, 19, 27, 30, 182, 75, 3, 1, 2, 2, 3, 75, 'Fiziksel gücü ve top kapma yeteneği ile öne çıkan defansif orta saha.', 'Sağ'),
(35, 'Victor Osimhen', 33, 9, 24, 80, 185, 78, 1, 12, 18, 2, 3, 82, 'Müthiş bir bitiricilik özelliğine sahip, hızlı ve güçlü forvet.', 'Sağ'),
(36, 'Alfonso Pedraza', 10, 8, 27, 15, 176, 74, 11, 2, 3, 3, 5, 72, 'Hücuma katkı sağlayan modern sol bek profili.', 'Sol'),
(37, 'Alejandro Garnacho', 6, 13, 19, 25, 174, 68, 4, 2, 4, 1, 2, 74, 'Genç yaşına rağmen üst düzey teknik kapasiteye sahip kanat oyuncusu.', 'Sol'),
(38, 'Dani Olmo', 12, 8, 25, 55, 178, 75, 6, 4, 7, 4, 6, 78, 'Teknik kapasitesi ve oyun zekası yüksek, yaratıcı orta saha.', 'Sağ'),
(39, 'Mohammed Kudus', 50, 20, 23, 30, 175, 68, 6, 3, 5, 2, 4, 76, 'Çok yönlü ve yaratıcı orta saha oyuncusu.', 'Sağ'),
(40, 'Pascal Groß', 24, 4, 32, 18, 178, 78, 3, 3, 5, 5, 8, 74, 'Tecrübeli ve yaratıcı orta saha, set organizasyonlarında etkili.', 'Sağ'),
(41, 'Rodrygo', 18, 5, 22, 70, 174, 75, 1, 5, 8, 3, 5, 78, 'Hızlı ve teknik özellikleri ile öne çıkan modern kanat oyuncusu.', 'Sağ'),
(42, 'Jakob Pöltl', 30, 21, 22, 25, 186, 79, 1, 5, 9, 2, 3, 75, 'Fiziksel gücü ile öne çıkan, hava toplarında etkili forvet.', 'Sağ'),
(43, 'Dejan Kulusevski', 31, 22, 23, 40, 184, 74, 3, 6, 10, 4, 7, 80, 'Teknik kapasitesi yüksek, yaratıcı ve çok yönlü kanat oyuncusu.', 'Sol'),
(44, 'Thiago Alcântara', 4, 8, 32, 20, 174, 70, 3, 2, 4, 3, 5, 79, 'Teknik kapasitesi ve pas yeteneği üst düzey, oyun zekası çok yüksek.', 'Sağ'),
(45, 'Nicolas González', 36, 13, 25, 30, 178, 75, 6, 3, 5, 2, 3, 74, 'Hızlı ve teknik özellikleri ile öne çıkan çok yönlü oyuncu.', 'Sol'),
(46, 'Youssef En-Nesyri', 37, 19, 26, 30, 189, 77, 1, 6, 9, 0, 1, 75, 'Hava toplarında etkili, fiziksel gücü yüksek forvet oyuncusu.', 'Sağ'),
(47, 'Marco Verratti', 38, 18, 30, 18, 165, 59, 3, 1, 2, 3, 5, 76, 'Press direnci ve pas yeteneği üst düzey, oyun kurma becerisi yüksek.', 'Sağ'),
(48, 'Andreas Christensen', 9, 10, 27, 35, 186, 82, 14, 0, 1, 0, 0, 72, 'Topla oyun kurma yeteneği iyi olan modern stoper profili.', 'Sağ'),
(49, 'Ryan Gravenberch', 45, 2, 21, 35, 185, 82, 6, 2, 3, 1, 2, 76, 'Fiziksel özellikleri ve teknik kapasitesi ile öne çıkan genç yetenek.', 'Sağ'),
(50, 'Bruno Guimarães', 20, 5, 25, 60, 180, 76, 7, 2, 4, 2, 4, 78, 'Modern orta saha profili, hem defansif hem ofansif katkı sağlıyor.', 'Sağ'),
(51, 'William Saliba', 21, 6, 22, 50, 189, 80, 14, 1, 2, 0, 1, 77, 'Fiziksel gücü ve top çıkarma yeteneği ile öne çıkan modern stoper.', 'Sağ'),
(52, 'Victor Lindelöf', 6, 22, 29, 30, 187, 80, 14, 0, 1, 1, 1, 74, 'Topla oyun kurma yeteneği iyi olan, tecrübeli stoper.', 'Sağ'),
(53, 'Christian Romero', 31, 13, 25, 45, 182, 75, 10, 1, 2, 1, 2, 78, 'Agresif savunma stili ve top çıkarma yeteneği ile öne çıkan stoper.', 'Sağ'),
(64, 'Diogo Costa', 28, 3, 24, 25, 191, 80, 15, 0, 0, 0, 0, 78, 'Genç yaşına rağmen takımını yönlendirebilecek kadar olgun ve güven verici bir kaleci.', 'Sol'),
(78, 'Micky van de Ven', 30, 2, 22, 22, 192, 84, 13, 2, 3, 1, 2, 76, 'Uzun boylu ve fiziksel olarak güçlü, savunmada etkili ancak bazen çabukluğu eksik olabiliyor.', 'Sol'),
(79, 'Armel Bella-Kotchap', 39, 4, 22, 18, 192, 90, 13, 0, 1, 1, 0, 73, 'Fiziksel olarak güçlü ve hava toplarında çok etkili; ancak daha fazla ofansif katkı sağlayabilir.', 'Sol'),
(80, 'Alessandro Bastoni', 57, 18, 24, 25, 187, 81, 13, 2, 2, 1, 3, 78, 'Hava toplarında etkili, topa hakim ve ofansif katkı sağlamakta başarılı.', 'Sol'),
(81, 'Jean-Clair Todibo', 19, 6, 23, 25, 190, 82, 13, 1, 2, 1, 0, 76, 'Fiziksel olarak çok güçlü, topa hakim ve savunmada oldukça güvenilir.', 'Sağ'),
(82, 'Calvin Bassey', 58, 9, 24, 22, 190, 85, 13, 2, 3, 1, 1, 77, 'Fiziksel olarak güçlü ve agressif; savunmada çok etkili ancak zaman zaman disiplinsiz olabiliyor.', 'Sol'),
(83, 'Levi Colwill', 8, 7, 21, 25, 187, 80, 12, 2, 1, 0, 2, 77, 'Savunmada çok güvenilir, hava toplarında etkili ve topa hakim.', 'Sol'),
(84, 'Jarrad Branthwaite', 17, 7, 21, 20, 190, 82, 12, 0, 1, 1, 0, 76, 'Fiziksel olarak güçlü, savunma becerileri oldukça iyi ancak ofansif katkı çok az.', 'Sol'),
(85, 'Antonio Silva', 14, 3, 20, 25, 188, 83, 12, 2, 3, 0, 1, 75, 'Fiziksel olarak çok güçlü, genç yaşına rağmen ciddi bir savunma yeteneğine sahip.', 'Sağ'),
(86, 'Nico Schlotterbeck', 3, 4, 23, 25, 191, 82, 12, 4, 2, 1, 1, 77, 'Hava toplarında güçlü, defansif anlamda çok güvenilir ancak bazen gereksiz kartlar alabiliyor.', 'Sol'),
(87, 'Omar Rekik', 26, 14, 21, 12, 188, 79, 12, 1, 1, 0, 0, 74, 'Fiziksel olarak güçlü ve hava toplarında etkili, savunmada sağlam bir oyuncu.', 'Sol'),
(90, 'Alexandro Bernabei', 25, 13, 22, 20, 172, 70, 11, 1, 2, 3, 3, 76, 'Ofansif anlamda hızlı ve yaratıcı, savunma katkısı da sağlam.', 'Sol'),
(91, 'Borna Sosa', 26, 23, 22, 18, 183, 77, 11, 3, 2, 6, 7, 77, 'Sol bekte ofansif katkı sağlıyor, harika ortalar yapabiliyor.', 'Sol'),
(92, 'Jetro Willems', 27, 2, 23, 20, 175, 68, 11, 3, 1, 4, 5, 74, 'Ofansif anlamda etkili, savunmada zaman zaman açığa düşebiliyor.', 'Sol'),
(95, 'Ridle Baku', 30, 4, 22, 20, 184, 75, 10, 3, 2, 5, 4, 74, 'Sağ bekte güçlü, hızlı ve ofansif anlamda katkı sağlıyor; savunma becerileri iyi.', 'Sağ'),
(96, 'Kieran Trippier', 20, 7, 23, 25, 178, 76, 10, 2, 3, 3, 5, 75, 'Savunma katkısı güçlü, ofansif olarak da çok etkili, özellikle duran toplarda.', 'Sağ'),
(99, 'Sandro Tonali', 20, 18, 22, 60, 182, 74, 7, 2, 5, 6, 2, 79, 'İyi bir oyun kurucu, top kazanma konusunda etkili; oyun görüşü gelişmeye devam ediyor.', 'Sol'),
(104, 'Florentino Luís', 14, 3, 24, 22, 185, 78, 8, 2, 1, 1, 2, 75, 'Savunmada etkili, güçlü ve top kazandırıcı; daha fazla hücum katkısı yapabilir.', 'Sağ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ulkeler`
--

DROP TABLE IF EXISTS `ulkeler`;
CREATE TABLE IF NOT EXISTS `ulkeler` (
  `ulke_id` int NOT NULL AUTO_INCREMENT,
  `ulke_ad` varchar(30) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`ulke_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `ulkeler`
--

INSERT INTO `ulkeler` (`ulke_id`, `ulke_ad`) VALUES
(1, 'Amerika Birleşik Devletleri'),
(2, 'Hollanda'),
(3, 'Portekiz'),
(4, 'Almanya'),
(5, 'Brezilya'),
(6, 'Fransa'),
(7, 'İngiltere'),
(8, 'İspanya'),
(9, 'Nijerya'),
(10, 'Danimarka'),
(11, 'Slovenya'),
(12, 'Meksika'),
(13, 'Arjantin'),
(14, 'Belçika'),
(15, 'Fildişi Sahili'),
(16, 'Mali'),
(17, 'Türkiye'),
(18, 'İtalya'),
(19, 'Fas'),
(20, 'Gana'),
(21, 'Avusturya'),
(22, 'İsveç'),
(23, 'Hırvatistan'),
(24, 'İrlanda'),
(25, 'Ekvador');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `oyuncular`
--
ALTER TABLE `oyuncular`
  ADD CONSTRAINT `oyuncular_ibfk_1` FOREIGN KEY (`oyuncu_takim`) REFERENCES `futbol_kadrom` (`takim_id`),
  ADD CONSTRAINT `oyuncular_ibfk_2` FOREIGN KEY (`oyuncu_ulke`) REFERENCES `ulkeler` (`ulke_id`),
  ADD CONSTRAINT `oyuncular_ibfk_3` FOREIGN KEY (`oyuncu_mevki`) REFERENCES `mevkiler` (`mevki_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
