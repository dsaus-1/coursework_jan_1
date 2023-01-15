-- Страница «Сотрудники» (employees_page)

--Выбрать записи работников (включить колонки имени, фамилии, телефона, региона) в которых регион неизвестен
SELECT first_name, last_name, home_phone, region
FROM employees
WHERE region IS NULL;

--Выбрать такие страны в которых "зарегистированы" одновременно заказчики и поставщики, но при этом в них не "зарегистрированы" работники
SELECT DISTINCT c.country
FROM suppliers s
JOIN customers c USING(country)
FULL JOIN employees e USING(country)
WHERE e.country IS NULL;