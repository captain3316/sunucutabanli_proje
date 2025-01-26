-- Tablo adını değiştir
RENAME TABLE `takımlar` TO `futbol_kadrom`;

-- Fenerbahçe 2024 kadrosunu ekle
INSERT INTO `futbol_kadrom` (`takim_id`, `takim_ad`) VALUES (50, 'Fenerbahçe');

-- Fenerbahçe 2024 kadrosunu ekle
INSERT INTO `oyuncular` 
(`oyuncu_ad`, `oyuncu_takim`, `oyuncu_ulke`, `oyuncu_yas`, `oyuncu_degeri`, `oyuncu_boy`, `oyuncu_kilo`, `oyuncu_mevki`, `oyuncu_2022_gol`, `oyuncu_2023_gol`, `oyuncu_2022_assist`, `oyuncu_2023_assist`, `oyuncu_ort_paun`, `oyuncu_gozlemci_yorum`, `oyuncu_ayak`) VALUES
('Dominik Livakovic', 50, 1, 29, 20, 188, 83, 15, 0, 0, 0, 0, 78, 'Tecrübeli ve güvenilir kaleci, refleksleri güçlü.', 'Sağ'),
('İrfan Can Eğribayat', 50, 2, 25, 5, 190, 84, 15, 0, 0, 0, 0, 72, 'Genç ve gelişime açık kaleci.', 'Sağ'),
('Alexander Djiku', 50, 3, 29, 15, 182, 74, 12, 1, 2, 0, 1, 77, 'Güçlü defansif özellikleri olan stoper.', 'Sağ'),
('Serdar Aziz', 50, 2, 33, 8, 183, 79, 12, 1, 1, 0, 0, 75, 'Tecrübeli ve lider özellikli stoper.', 'Sağ'),
('Rodrigo Becão', 50, 4, 28, 12, 191, 86, 12, 0, 0, 1, 0, 76, 'Fiziksel gücü yüksek, hava toplarında etkili stoper.', 'Sağ'),
('Jayden Oosterwolde', 50, 5, 22, 18, 188, 80, 11, 1, 2, 3, 4, 77, 'Hızlı ve atletik sol bek, ofansif katkısı yüksek.', 'Sol'),
('Ferdi Kadıoğlu', 50, 2, 24, 25, 176, 69, 10, 2, 3, 6, 7, 79, 'Çok yönlü ve dinamik sağ bek, teknik kapasitesi yüksek.', 'Sağ'),
('İsmail Yüksek', 50, 2, 24, 15, 183, 76, 7, 1, 2, 3, 4, 77, 'Dinamik ve mücadeleci orta saha oyuncusu.', 'Sağ'),
('Fred', 50, 4, 30, 20, 169, 64, 5, 3, 4, 6, 7, 78, 'Tecrübeli ve yaratıcı orta saha, pas yeteneği yüksek.', 'Sol'),
('İrfan Can Kahveci', 50, 2, 28, 15, 176, 70, 9, 5, 6, 8, 9, 77, 'Teknik kapasitesi yüksek, yaratıcı orta saha.', 'Sol'),
('Sebastian Szymański', 50, 6, 24, 25, 174, 64, 6, 6, 8, 10, 12, 80, 'Yaratıcı ve üretken orta saha, gol katkısı yüksek.', 'Sol'),
('Dusan Tadic', 50, 7, 35, 15, 181, 76, 4, 8, 7, 12, 14, 79, 'Tecrübeli ve lider özellikli kanat oyuncusu.', 'Sol'),
('Joshua King', 50, 8, 31, 10, 187, 84, 3, 5, 4, 3, 4, 76, 'Fiziksel gücü yüksek, çok yönlü forvet.', 'Sağ'),
('Edin Dzeko', 50, 9, 37, 12, 193, 85, 1, 12, 14, 5, 6, 78, 'Tecrübeli ve gol yollarında etkili forvet.', 'Sağ'),
('Michy Batshuayi', 50, 10, 30, 15, 185, 78, 1, 10, 12, 3, 4, 77, 'Bitiricilik özelliği yüksek, hareketli forvet.', 'Sağ');
