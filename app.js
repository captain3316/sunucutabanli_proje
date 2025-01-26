const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const app = express();

// View engine ayarları
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Static dosyaları sunmak için
app.use(express.static('public'));

// Body parser middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// MySQL bağlantısı oluştur
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'futbol_scout_db'
});

// Global middleware
app.use((req, res, next) => {
    res.locals.user = { username: 'Admin' };
    res.locals.currentPage = req.path.substring(1) || 'home';
    next();
});

// Çıkış yapma route'u
app.get('/logout', (req, res) => {
    res.redirect('/login');
});

// Ana sayfa - Login'e yönlendir
app.get('/', (req, res) => {
    res.redirect('/login');
});

// Login sayfası route'u
app.get('/login', (req, res) => {
    res.render('login', { error: null });
});

// Login işlemi route'u
app.post('/login', (req, res) => {
    const { username, password } = req.body;
    
    // Basit bir kontrol - gerçek uygulamada veritabanından kontrol edilmeli
    if (username === 'admin' && password === 'admin') {
        res.redirect('/transfer-listesi');
    } else {
        res.render('login', { error: 'Kullanıcı adı veya şifre hatalı!' });
    }
});

// Transfer Listesi route'u
app.get('/transfer-listesi', (req, res) => {
    // Mevkileri çek
    connection.query(`
        SELECT * FROM mevkiler 
        WHERE mevki_ad IN (
            'Sol Bek', 'Sağ Bek', 
            'Sol Stoper', 'Sağ Stoper',
            'Defansif Orta Saha',
            'Sol Orta Saha', 'Sağ Orta Saha',
            'Sol Kanat', 'Sağ Kanat',
            'Santrafor'
        )
    `, (err, mevkiler) => {
        if (err) throw err;

        // Oyuncuları çek
        connection.query(`
            SELECT 
                o.*,
                t.takim_ad,
                u.ulke_ad,
                m.mevki_ad
            FROM oyuncular o
            LEFT JOIN futbol_kadrom t ON o.oyuncu_takim = t.takim_id
            LEFT JOIN ulkeler u ON o.oyuncu_ulke = u.ulke_id
            LEFT JOIN mevkiler m ON o.oyuncu_mevki = m.mevki_id
        `, (err, players) => {
            if (err) throw err;

            res.render('transfer-listesi', {
                mevkiler: mevkiler,
                players: players
            });
        });
    });
});

// Transfer Analizi route'u
app.get('/transfer-analizi', (req, res) => {
    // Gol istatistiklerini çek
    connection.query(`
        SELECT 
            o.oyuncu_ad,
            o.oyuncu_2022_gol as gol_2022,
            o.oyuncu_2023_gol as gol_2023,
            o.oyuncu_2022_assist as assist_2022,
            o.oyuncu_2023_assist as assist_2023
        FROM oyuncular o
        ORDER BY (o.oyuncu_2022_gol + o.oyuncu_2023_gol) DESC
        LIMIT 10
    `, (err, players) => {
        if (err) throw err;

        const goalStats = players;
        const assistStats = players.sort((a, b) => 
            (b.assist_2022 + b.assist_2023) - (a.assist_2022 + a.assist_2023)
        ).slice(0, 10);

        res.render('transfer-analizi', {
            goalStats: goalStats,
            assistStats: assistStats
        });
    });
});

// Optimal Oyuncu route'u
app.get('/optimal-oyuncu', (req, res) => {
    connection.query('SELECT * FROM mevkiler', (err, mevkiler) => {
        if (err) throw err;

        // Mevkileri positions objesine dönüştür
        const positions = {};
        mevkiler.forEach(m => {
            positions[m.mevki_ad] = m.mevki_id;
        });

        connection.query(`
            SELECT 
                o.*,
                t.takim_ad,
                u.ulke_ad,
                m.mevki_ad,
                (o.oyuncu_2022_gol + o.oyuncu_2023_gol) as toplam_gol,
                (o.oyuncu_2022_assist + o.oyuncu_2023_assist) as toplam_assist,
                LEAST(100, GREATEST(0, ROUND(
                    (
                        /* Gol katkısı (max 40 puan) */
                        LEAST(40, (o.oyuncu_2022_gol + o.oyuncu_2023_gol) * 4) +
                        
                        /* Asist katkısı (max 30 puan) */
                        LEAST(30, (o.oyuncu_2022_assist + o.oyuncu_2023_assist) * 3) +
                        
                        /* Yaş katkısı (max 20 puan) */
                        CASE 
                            WHEN o.oyuncu_yas < 23 THEN 20
                            WHEN o.oyuncu_yas < 27 THEN 15
                            WHEN o.oyuncu_yas < 30 THEN 10
                            WHEN o.oyuncu_yas < 33 THEN 5
                            ELSE 0
                        END +
                        
                        /* Piyasa değeri katkısı (max 10 puan) */
                        LEAST(10, o.oyuncu_degeri * 0.5)
                    )
                ))) as verimlilik_skoru
            FROM oyuncular o
            LEFT JOIN futbol_kadrom t ON o.oyuncu_takim = t.takim_id
            LEFT JOIN ulkeler u ON o.oyuncu_ulke = u.ulke_id
            LEFT JOIN mevkiler m ON o.oyuncu_mevki = m.mevki_id
            ORDER BY verimlilik_skoru DESC
        `, (err, players) => {
            if (err) throw err;

            res.render('optimal-oyuncu', {
                positions: positions,
                players: players
            });
        });
    });
});

// Oyuncu Ara route'u
app.get('/oyuncu-ara', (req, res) => {
    connection.query('SELECT * FROM mevkiler', (err, mevkiler) => {
        if (err) throw err;

        connection.query('SELECT * FROM futbol_kadrom', (err, takimlar) => {
            if (err) throw err;

            connection.query('SELECT * FROM ulkeler', (err, ulkeler) => {
                if (err) throw err;

                res.render('oyuncu-ara', {
                    mevkiler: mevkiler,
                    takimlar: takimlar,
                    ulkeler: ulkeler,
                    players: [],
                    filters: {} // Boş filters objesi ekledik
                });
            });
        });
    });
});

// Oyuncu Arama POST route'u
app.post('/oyuncu-ara', (req, res) => {
    const filters = {
        mevki: req.body.mevki,
        foot: req.body.foot,
        country: req.body.country,
        goalMin: req.body.goalMin,
        goalMax: req.body.goalMax,
        assistMin: req.body.assistMin,
        assistMax: req.body.assistMax
    };

    let query = `
        SELECT 
            o.*,
            t.takim_ad,
            u.ulke_ad,
            m.mevki_ad
        FROM oyuncular o
        LEFT JOIN futbol_kadrom t ON o.oyuncu_takim = t.takim_id
        LEFT JOIN ulkeler u ON o.oyuncu_ulke = u.ulke_id
        LEFT JOIN mevkiler m ON o.oyuncu_mevki = m.mevki_id
        WHERE 1=1
    `;

    if (filters.mevki) query += ` AND o.oyuncu_mevki = ${mysql.escape(filters.mevki)}`;
    if (filters.foot) query += ` AND o.oyuncu_ayak = ${mysql.escape(filters.foot)}`;
    if (filters.country) query += ` AND o.oyuncu_ulke = ${mysql.escape(filters.country)}`;
    if (filters.goalMin) query += ` AND (o.oyuncu_2022_gol + o.oyuncu_2023_gol) >= ${mysql.escape(filters.goalMin)}`;
    if (filters.goalMax) query += ` AND (o.oyuncu_2022_gol + o.oyuncu_2023_gol) <= ${mysql.escape(filters.goalMax)}`;
    if (filters.assistMin) query += ` AND (o.oyuncu_2022_assist + o.oyuncu_2023_assist) >= ${mysql.escape(filters.assistMin)}`;
    if (filters.assistMax) query += ` AND (o.oyuncu_2022_assist + o.oyuncu_2023_assist) <= ${mysql.escape(filters.assistMax)}`;

    connection.query('SELECT * FROM mevkiler', (err, mevkiler) => {
        if (err) throw err;

        connection.query('SELECT * FROM futbol_kadrom', (err, takimlar) => {
            if (err) throw err;

            connection.query('SELECT * FROM ulkeler', (err, ulkeler) => {
                if (err) throw err;

                connection.query(query, (err, players) => {
                    if (err) throw err;

                    res.render('oyuncu-ara', {
                        mevkiler: mevkiler,
                        takimlar: takimlar,
                        ulkeler: ulkeler,
                        players: players,
                        filters: filters
                    });
                });
            });
        });
    });
});

// Kaleci İstatistikleri route'u
app.get('/api/kaleci-istatistikleri', (req, res) => {
    connection.query(`
        SELECT 
            k.*,
            o.oyuncu_ad,
            o.oyuncu_takim,
            o.oyuncu_ulke
        FROM kaleci_istatistikleri k
        JOIN oyuncular o ON k.oyuncu_id = o.oyuncu_id
    `, (err, stats) => {
        if (err) throw err;
        res.json(stats);
    });
});

// Wonderkids API endpoint'i
app.get('/api/wonderkids', (req, res) => {
    const criteria = req.query.criteria || 'potential';
    let orderBy = '';
    
    switch(criteria) {
        case 'potential':
            orderBy = 'ORDER BY potansiyel DESC';
            break;
        case 'performance':
            orderBy = 'ORDER BY yas ASC, potansiyel DESC';
            break;
        case 'value':
            orderBy = 'ORDER BY CAST(REPLACE(REPLACE(deger, "€", ""), "M", "") AS DECIMAL) DESC';
            break;
        default:
            orderBy = 'ORDER BY potansiyel DESC';
    }

    connection.query(`
        SELECT * FROM wonderkids ${orderBy} LIMIT 10
    `, (err, wonderkids) => {
        if (err) throw err;
        res.json(wonderkids);
    });
});

// Takımım (Fenerbahçe Kadrosu) route'u
app.get('/takimim', (req, res) => {
    const query = `
        SELECT 
            f.*,
            COALESCE(k.kurtaris_orani, 0) as kurtaris_orani,
            COALESCE(k.gol_yememis_mac, 0) as gol_yememis_mac,
            COALESCE(k.penalti_kurtarma, 0) as penalti_kurtarma,
            COALESCE(k.uzun_top_isabet, 0) as uzun_top_isabet
        FROM fener_kadro f
        LEFT JOIN kaleci_istatistikleri k ON f.oyuncu_id = k.oyuncu_id
        ORDER BY 
            CASE 
                WHEN f.pozisyon = 'Kaleci' THEN 1
                WHEN f.pozisyon = 'Defans' THEN 2
                WHEN f.pozisyon = 'Orta Saha' THEN 3
                WHEN f.pozisyon = 'Forvet' THEN 4
            END,
            f.forma_no ASC
    `;

    connection.query(query, (err, players) => {
        if (err) {
            console.error('Veritabanı sorgusu hatası:', err);
            res.status(500).send('Veritabanı hatası');
            return;
        }

        // Oyuncuları pozisyonlarına göre grupla
        const groupedPlayers = {
            Kaleci: players.filter(p => p.pozisyon === 'Kaleci'),
            Defans: players.filter(p => p.pozisyon === 'Defans'),
            OrtaSaha: players.filter(p => p.pozisyon === 'Orta Saha'),
            Forvet: players.filter(p => p.pozisyon === 'Forvet')
        };

        res.render('takimim', { 
            players: groupedPlayers,
            currentPage: 'takimim'
        });
    });
});

// Server'ı başlat
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server ${PORT} portunda çalışıyor`);
});