import json
import psycopg2

'''
Функция заполняет данными БД northwind-coursworkб таблицы suppliers и products_suppliers из json файла suppliers.json
'''
def add_data(password: str):
    with open('suppliers.json') as file:
        file_r = json.load(file)
        with psycopg2.connect(host='localhost', database='northwind-courswork', user='postgres', password=password) as conn:
            with conn.cursor() as cur:
                for line in file_r:
                    country = line['address'][0: + line['address'].find(';')]
                    address = line['address'][line['address'].find(';') + 1:]
                    cur.execute("INSERT INTO suppliers VALUES (%s, %s, %s, %s, %s, %s, %s)", (line['company_name'], line['contact'], country, address, line['phone'], line['fax'], line['homepage']))
                    quantity = len(line['products'])
                    count = 0
                    while count < quantity:
                        cur.execute("INSERT INTO products_suppliers VALUES (%s, %s)", (line['company_name'], line['products'][count]))
                        count += 1


    conn.close()



if __name__ == '__main__':
    password = input('Введите пароль: ')
    add_data(password)
