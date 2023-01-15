--Страница «Товары» (products_page)

--Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood,
--которых в продаже менее 20 единиц. Вывести наименование продуктов, кол-во
--единиц в продаже, имя контакта поставщика и его телефонный номер.
SELECT p.product_name, p.units_in_stock, s.contact, s.phone
FROM products p
JOIN categories c USING(category_id)
JOIN suppliers s USING(suppliers_id)
WHERE discontinued = 0
AND c.category_name IN('Beverages', 'Seafood')
AND p.units_in_stock < 20;