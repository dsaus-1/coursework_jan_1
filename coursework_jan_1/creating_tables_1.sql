
-- Создание таблицы suppliers
CREATE TABLE suppliers
(
	company_name varchar(100) NOT NULL,
	contact varchar(200) NOT NULL,
	country varchar(200) NOT NULL,
	address varchar(250) NOT NULL,
	phone varchar(50) NOT NULL,
	fax varchar(50),
	homepage varchar(120),
	suppliers_id serial PRIMARY KEY
);

-- Добавление столбца suppliers_id в таблицу products
ALTER TABLE products ADD COLUMN suppliers_id int;

-- Создание таблицы взаимосвязи products и suppliers
CREATE TABLE products_suppliers
(
	company_name varchar(100) NOT NULL,
	product varchar(200) NOT NULL
);

