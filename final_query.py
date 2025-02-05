import psycopg2
import json
import os
from decimal import Decimal

def decimal_to_float(obj):
    if isinstance(obj, Decimal):
        return float(obj)
    raise TypeError

conn = psycopg2.connect(
    dbname="northwind_full",  
    user="northwind_user",    
    password="thewindisblowing", 
    host="localhost",         
    port="5434"               
)

cur = conn.cursor()

query = """
    SELECT 
        o.order_id,
        o.order_date,
        o.shipped_date,
        o.customer_id,
        c.company_name AS customer_name,
        od.product_id,
        p.product_name,
        od.unit_price::numeric AS unit_price,
        od.quantity::integer AS quantity,
        od.discount::numeric AS discount,
        (od.unit_price::numeric * od.quantity::numeric * (1 - od.discount::numeric)) AS total_price
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    JOIN customers c ON o.customer_id = c.customer_id
    ORDER BY o.order_id
"""

cur.execute(query)

results = cur.fetchall()

#https://www.bacancytechnology.com/qanda/python/return-sql-data-in-json-format-python

columns = [desc[0] for desc in cur.description]
data = [dict(zip(columns, row)) for row in results]
data = [dict((k, decimal_to_float(v) if isinstance(v, Decimal) else v) for k, v in item.items()) for item in data]

output_dir = os.path.join(os.getcwd(), 'query_output', 'orders.json')
os.makedirs(os.path.dirname(output_dir), exist_ok=True)

with open(output_dir, 'w') as f:
    json.dump(data, f, indent=4)


cur.close()
conn.close()

