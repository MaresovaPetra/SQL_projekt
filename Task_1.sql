--1. Otázka
--Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SELECT *
FROM (
    SELECT 
        t1.industry_name,
        t1.rok,
        t1.prum_mzda,
        t2.prum_mzda AS prum_mzda_minuly_rok,
        t1.prum_mzda - t2.prum_mzda AS rozdil_mzdy
    FROM (
        SELECT DISTINCT
            industry_name,
            rok,
            prum_mzda
        FROM t_petra_maresova_projekt_SQL_primary_final
    ) t1
    LEFT JOIN (
        SELECT DISTINCT
            industry_name,
            rok,
            prum_mzda
        FROM t_petra_maresova_projekt_SQL_primary_final
    ) t2
    ON t1.industry_name = t2.industry_name
    AND t1.rok = t2.rok + 1
) x
ORDER BY rok, prum_mzda 

---zobrazení záporného růstu přidáním WHERE rozdil_mzdy < 0

SELECT *
FROM (
    SELECT 
        t1.industry_name,
        t1.rok,
        t1.prum_mzda,
        t2.prum_mzda AS prum_mzda_minuly_rok,
        t1.prum_mzda - t2.prum_mzda AS rozdil_mzdy
    FROM (
        SELECT DISTINCT
            industry_name,
            rok,
            prum_mzda
        FROM t_petra_maresova_projekt_SQL_primary_final
    ) t1
    LEFT JOIN (
        SELECT DISTINCT
            industry_name,
            rok,
            prum_mzda
        FROM t_petra_maresova_projekt_SQL_primary_final
    ) t2
    ON t1.industry_name = t2.industry_name
    AND t1.rok = t2.rok + 1
) x
WHERE rozdil_mzdy < 0
ORDER BY industry_name, rok;


