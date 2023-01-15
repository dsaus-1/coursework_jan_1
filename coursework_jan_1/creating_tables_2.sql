
-- Добавление данных в столбец suppliers_id таблицы products
UPDATE products p
SET suppliers_id = (SELECT s.suppliers_id FROM suppliers s
					 RIGHT JOIN products_suppliers ps USING (company_name)
					 WHERE p.product_name=ps.product);

--Привязка таблицы products к таблице suppliers
ALTER TABLE products
ADD CONSTRAINT fk_suppliers_products
FOREIGN KEY (suppliers_id) REFERENCES suppliers(suppliers_id);
