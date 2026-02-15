# ENGETO Datová akademie – SQL projekt

**Autor:** Petra Marešová  
**GitHub:** MaresovaPetra  
**Kontakt:** p.heckova@seznam.cz  

---

## Cíl projektu

Cílem projektu je analyzovat dostupnost základních potravin v České republice 
na základě vývoje průměrných mezd a cen vybraných potravin v období 2006–2018.

Součástí analýzy je také posouzení širšího makroekonomického kontextu 
prostřednictvím ukazatelů HDP, GINI koeficientu a populace evropských států.

---

## Struktura projektu

Projekt je rozdělen do dvou hlavních částí:

1. **Primární analytická část (ČR)** – analýza mezd a cen potravin  
2. **Sekundární makroekonomická část (Evropa)** – analýza HDP a dalších ukazatelů  

---

## Výzkumné otázky

Jednotlivé výzkumné otázky jsou řešeny v samostatných SQL souborech:

- `Task_1.sql`
- `Task_2.sql`
- `Task_3.sql`
- `Task_4.sql`
- `Task_5.sql`

Odpovědi a interpretace výsledků jsou uvedeny v souboru:

`Tasks_answer.md`

---

## Příprava dat

### Primární tabulka  
`t_petra_maresova_projekt_SQL_primary_final`

Tabulka obsahuje sjednocená roční data o:

- průměrných hrubých mzdách podle odvětví  
- průměrných ročních cenách vybraných potravin  

Období analýzy: 2006–2018  

Tabulka slouží jako hlavní datový zdroj pro odpovědi na otázky 1–4.

Vytvoření tabulky: `Primarni_tabulka.sql`

---

### Sekundární tabulka  
`t_petra_maresova_projekt_SQL_secondary_final`

Tabulka obsahuje makroekonomické ukazatele evropských států:

- HDP  
- populaci  
- GINI koeficient  

Období: 2006–2018  

Slouží jako podklad pro analýzu vztahu mezi vývojem HDP a změnami mezd a cen (otázka 5).

Vytvoření tabulky: `Sekundarni_tabulka.sql`
