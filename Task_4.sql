--4. Otázka
--Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?


-- Průměrná mzda podle roku
WITH mzda_rok AS (
    SELECT
        rok,
        ROUND(AVG(prum_mzda), 2) AS prumerna_mzda
    FROM t_petra_maresova_projekt_SQL_primary_final
    GROUP BY rok
),
rust_mezd AS (
    SELECT
        m1.rok,
        ROUND(
            (m1.prumerna_mzda - m2.prumerna_mzda)
            / m2.prumerna_mzda * 100,
            2
        ) AS rust_mezd_pct
    FROM mzda_rok m1
    JOIN mzda_rok m2
        ON m1.rok = m2.rok + 1
),
cena_rok AS (
    SELECT
        rok,
        ROUND(AVG(prum_cena), 2) AS prumerna_cena
    FROM t_petra_maresova_projekt_SQL_primary_final
    GROUP BY rok
),
rust_cen AS (
    SELECT
        c1.rok,
        ROUND(
            (c1.prumerna_cena - c2.prumerna_cena)
            / c2.prumerna_cena * 100,
            2
        ) AS rust_cen_pct
    FROM cena_rok c1
    JOIN cena_rok c2
        ON c1.rok = c2.rok + 1
)
SELECT
    r.rok,
    r.rust_cen_pct AS avg_price_rise,
    m.rust_mezd_pct AS avg_pay_rise,
    ROUND(r.rust_cen_pct - m.rust_mezd_pct, 2) AS difference
FROM rust_cen r
JOIN rust_mezd m
    ON r.rok = m.rok
ORDER BY r.rok;