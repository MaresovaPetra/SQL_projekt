--2. Otázka
--Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT 
    c.rok,
    c.nazev_produktu,
    c.prum_cena,
    m.prumerna_mzda,
    ROUND(m.prumerna_mzda / c.prum_cena, 0) AS kupni_sila
FROM 
(
    SELECT 
        rok,
        nazev_produktu,
        prum_cena
    FROM t_petra_maresova_projekt_SQL_primary_final
    WHERE rok IN (2006, 2018)
      AND (
            nazev_produktu LIKE 'Mléko%'
            OR nazev_produktu LIKE 'Chléb%'
          )
    GROUP BY rok, nazev_produktu, prum_cena
) c
JOIN 
(
    SELECT 
        rok,
        ROUND(AVG(prum_mzda), 2) AS prumerna_mzda
    FROM t_petra_maresova_projekt_SQL_primary_final
    WHERE rok IN (2006, 2018)
    GROUP BY rok
) m
ON c.rok = m.rok
ORDER BY c.rok, c.nazev_produktu;






