
-- Spojeni dvou tabulek czechia_price a czechia_price_category pres "code" a vytvořeni prvni tabulky t1_price.

-- Spojeni dvou tabulek czechia_payroll a czechia_payroll_industry_branch pres "code" a vytvoreni tabulky t2_payroll.

-- Spojeni tabulek t1_price a t2_payroll pres rok.

CREATE OR REPLACE VIEW t1_price AS 
SELECT
	cpc."name" AS nazev_produktu,
	cpr.category_code AS kod_kategorie,
	cpc.price_unit AS jednotka,
	round(avg(cpr.value)::NUMERIC,1) AS prum_cena,
	DATE_PART('year', cpr.date_from) AS rok
FROM czechia_price cpr
JOIN czechia_price_category cpc 
ON cpr.category_code = cpc.code 
WHERE cpr.value IS NOT NULL 
GROUP BY cpc."name", DATE_PART('year', cpr.date_from), cpr.category_code, cpc.price_unit
ORDER BY rok, kod_kategorie

SELECT* FROM t1_price
ORDER BY rok, prum_cena

-----rok 2006-2018

CREATE OR REPLACE VIEW t2_payroll AS 
SELECT
	cp.industry_branch_code,
	cpib."name" AS industry_name,
	cp.payroll_year AS rok,
	round(avg(value),0) AS prum_mzda
FROM czechia_payroll cp
JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code
	WHERE cp.value_type_code = 5958
		AND cp.calculation_code = 200
		AND cp.industry_branch_code IS NOT NULL
GROUP BY cp.industry_branch_code, cpib."name", cp.payroll_year  

SELECT * FROM t2_payroll
ORDER BY prum_mzda DESC

--rok 2000 ---2021

--průnikové roky: 2006-2018

-- Spojení dvou pomocných tabulek do finální tabulky mezd a cen potravin za ČR sjednocených za období 2006-2018

CREATE TABLE IF NOT EXISTS t_petra_maresova_projekt_SQL_primary_final AS
SELECT
    t1.rok,
    t2.industry_branch_code,
    t2.industry_name,
    t2.prum_mzda,
    t1.kod_kategorie,
    t1.nazev_produktu,
    t1.jednotka,
    t1.prum_cena
FROM t1_price t1
INNER JOIN t2_payroll t2
    ON t1.rok = t2.rok;
	
SELECT *
FROM t_petra_maresova_projekt_SQL_primary_final

