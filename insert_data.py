import pandas as pd
from sqlalchemy import create_engine
import psycopg2
from psycopg2 import sql


conn = psycopg2.connect(
    host='localhost',
    user='postgres',
    password='123456789'
)

conn.autocommit = True

#Creating a cursor object using the cursor() method
cursor = conn.cursor()

cursor.execute(sql.SQL("CREATE DATABASE {}").format(sql.Identifier('db_project_2')))

# Close the connection
cursor.close()
conn.close()

print("Database created successfully")

# Konfigurasi koneksi ke PostgreSQL
db_user = 'postgres'
db_password = '123456789'
db_host = 'localhost'
db_port = '5432'
db_name = 'db_project_2'


# Buat engine koneksi
engine = create_engine(f"postgresql+psycopg2://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}")

# Daftar file CSV dan tabel tujuan
csv_files = {
    'customers.csv': 'customers',
    'categories.csv': 'categories',
    'employees.csv': 'employees',
    'order_details.csv': 'order_details',
    'orders.csv': 'orders',
    'products.csv': 'products',
    'regions.csv': 'regions',
    'shippers.csv': 'shippers',
    'suppliers.csv': 'suppliers',
    'territories.csv': 'territories'
}

# Path ke folder CSV
csv_folder_path = 'data/'

# Fungsi untuk mengimpor CSV ke PostgreSQL
def import_csv_to_postgres(csv_file, table_name):
    df = pd.read_csv(csv_folder_path + csv_file)
    df.to_sql(table_name, engine, if_exists='replace', index=False)
    print(f'Tabel {table_name} berhasil dimasukkan ke PostgreSQL')

# Loop melalui setiap file CSV dan impor ke PostgreSQL
for csv_file, table_name in csv_files.items():
    import_csv_to_postgres(csv_file, table_name)