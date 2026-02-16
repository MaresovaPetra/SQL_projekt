---Vytvoření sekundární tabulky

--propojení economies a countries pres country

CREATE TABLE IF NOT EXISTS t_petra_maresova_project_SQL_secondary_final AS 
SELECT
	c.continent, 
	c.country, 
	e."year", 
	round((e.gdp)::numeric,2) AS gdp,
	e.population,
	e.gini 
FROM economies e 
JOIN countries c 
	ON e.country = c.country 
	WHERE c.continent = 'Europe'
	AND e."year" BETWEEN 2006 AND 2018 


SELECT *
FROM t_petra_maresova_project_SQL_secondary_final

