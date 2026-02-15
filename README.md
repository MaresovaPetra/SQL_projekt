# ENGETO DATOVÁ AKADEMIE – SQL PROJEKT

**Autor:** Petra Marešová  
**GitHub:** MaresovaPetra  
**Email:** p.heckova@seznam.cz  

---

## Cíl projektu

Cílem projektu je analyzovat dostupnost základních potravin v České republice na základě vývoje průměrných mezd a cen potravin.  
Součástí projektu je také analýza makroekonomických ukazatelů evropských států (HDP, GINI, populace) ve stejném období.

---

## Zadání projektu

SQL soubory k jednotlivým výzkumným otázkám jsou uloženy jako:

- `Task_1.sql`
- `Task_2.sql`
- `Task_3.sql`
- `Task_4.sql`
- `Task_5.sql`

### Výzkumné otázky

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?  
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?  
3. Která kategorie potravin zdražuje nejpomaleji (má nejnižší percentuální meziroční nárůst)?  
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (více než 10 %)?  
5. Má výška HDP vliv na změny ve mzdách a cenách potravin?

Odpovědi na otázky jsou uloženy v souboru `Tasks_answer.md`.

---

## Příprava dat a vytvoření hlavních tabulek

### Primární tabulka  
`t_petra_maresova_projekt_SQL_primary_final`

- vytvoření: `Primarni_tabulka.sql`
- obsahuje sjednocená roční data o průměrných mzdách a cenách potravin v ČR za období 2006–2018
- slouží jako hlavní analytický podklad pro otázky 1–4

---

### Sekundární tabulka  
`t_petra_maresova_projekt_SQL_secondary_final`

- vytvoření: `Sekundarni_tabulka.sql`
- obsahuje makroekonomická data evropských států za období 2006–2018
- slouží jako podklad pro analýzu vztahu mezi HDP a vývojem mezd a cen (otázka 5)
