--3. Otázka
--Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

SELECT *
FROM (
    SELECT 
        t1.kod_kategorie,
        t1.nazev_produktu,
        t1.rok,
        t1.prum_cena,
        t2.prum_cena AS prum_cena_minuly_rok,
        ROUND(
            (t1.prum_cena - t2.prum_cena) 
            / t2.prum_cena * 100, 
            2
        ) AS procentni_zmena
    FROM (
        SELECT
            kod_kategorie,
            nazev_produktu,
            rok,
            prum_cena
        FROM t_petra_maresova_projekt_SQL_primary_final
        GROUP BY kod_kategorie, nazev_produktu, rok, prum_cena
    ) t1
    LEFT JOIN (
        SELECT
            kod_kategorie,
            nazev_produktu,
            rok,
            prum_cena
        FROM t_petra_maresova_projekt_SQL_primary_final
        GROUP BY kod_kategorie, nazev_produktu, rok, prum_cena
    ) t2
        ON t1.kod_kategorie = t2.kod_kategorie
       AND t1.rok = t2.rok + 1
) x
WHERE prum_cena_minuly_rok IS NOT NULL
ORDER BY rok


SELECT
    kod_kategorie,
    nazev_produktu,
    ROUND(AVG(procentni_zmena), 2) AS prumerne_tempo_rustu
FROM (
    SELECT 
        t1.kod_kategorie,
        t1.nazev_produktu,
        t1.rok,
        ROUND(
            (t1.prum_cena - t2.prum_cena) 
            / t2.prum_cena * 100, 
            2
        ) AS procentni_zmena
    FROM t_petra_maresova_projekt_SQL_primary_final t1
    JOIN t_petra_maresova_projekt_SQL_primary_final t2
        ON t1.kod_kategorie = t2.kod_kategorie
       AND t1.rok = t2.rok + 1
) x
GROUP BY kod_kategorie, nazev_produktu
ORDER BY prumerne_tempo_rustu ASC;





