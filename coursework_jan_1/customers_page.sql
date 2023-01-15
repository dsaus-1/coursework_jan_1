--Страница «Заказчики» (customers_page)


--Посчитать количество заказчиков
SELECT COUNT(1) FROM customers;

--Выбрать все уникальные сочетания городов и стран, в которых "зарегестрированы" заказчики
SELECT DISTINCT city, country FROM customers
ORDER BY country, city;

--Найти заказчиков и обслуживающих их заказы сотрудников, таких, что и заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express. Вывести компанию заказчика и ФИО сотрудника.
SELECT c.company_name, CONCAT(e.last_name, ' ', e.first_name) AS contact_name
FROM orders o
JOIN customers c USING (customer_id)
JOIN employees e USING (employee_id)
LEFT JOIN shippers s ON o.ship_via=s.shipper_id
WHERE e.city='London'
AND c.city='London'
AND s.company_name = 'Speedy Express';

--Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.
SELECT c.contact_name, o.order_id
FROM customers c
LEFT JOIN orders o USING (customer_id)
WHERE o.order_id IS NULL;