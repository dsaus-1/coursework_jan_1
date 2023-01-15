import psycopg2

'''
Запрос (первый аргумент) для функций get_product_by_id и get_category_by_id в формате списка [host, database, user, password]
'''
def get_product_by_id(config, id):

    with psycopg2.connect(host=config[0], database=config[1], user=config[2], password=config[3]) as conn:
        with conn.cursor() as cur:
            cur.execute(f"SELECT p.product_id, p.product_name, c.category_name, p.unit_price "
                        f"FROM products p "
                        f"JOIN categories c USING(category_id)"
                        f"WHERE product_id={id}")
            request = cur.fetchone()
            js_data = [{'product_id': request[0], 'product_name': request[1], 'category_name': request[2], 'unit_price': request[3]}]

    conn.close()
    return js_data



def get_category_by_id(config, id):
    with psycopg2.connect(host=config[0], database=config[1], user=config[2], password=config[3]) as conn:
        with conn.cursor() as cur:
            cur.execute(f"SELECT c.category_id, c.category_name, c.description, p.product_name "
                        f"FROM categories c "
                        f"RIGHT JOIN products p USING(category_id) "
                        f"WHERE c.category_id = {id}")

            request = cur.fetchall()

            products = []
            for line in request:
                products.append(line[3])
            first_request = request[0]
            js_data = [{'category_id': first_request[0], 'category_name': first_request[1], 'description': first_request[2], 'product_name': products}]

    conn.close()
    return js_data
