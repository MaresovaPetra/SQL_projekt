--5. Otázka
--Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

-- 1️⃣ Meziroční růst HDP (ČR)

WITH hdp_rok AS (
    SELECT
        year AS rok,
        gdp
    FROM t_petra_maresova_project_SQL_secondary_final
    WHERE country = 'Czech Republic'
),
rust_hdp AS (
    SELECT
        h1.rok,
        ROUND(
            (h1.gdp - h2.gdp) / h2.gdp * 100,
            2
        ) AS rust_hdp_pct
    FROM hdp_rok h1
    JOIN hdp_rok h2
        ON h1.rok = h2.rok + 1
),
mzda_rok AS (
    SELECT
        rok,
        AVG(prum_mzda) AS prumerna_mzda
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
        AVG(prum_cena) AS prumerna_cena
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
    h.rok,
    h.rust_hdp_pct,
    m.rust_mezd_pct,
    c.rust_cen_pct
FROM rust_hdp h
LEFT JOIN rust_mezd m
    ON h.rok = m.rok
LEFT JOIN rust_cen c
    ON h.rok = c.rok
ORDER BY h.rok;