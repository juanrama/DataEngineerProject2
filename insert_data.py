import pandas as pd
from sqlalchemy import create_engine

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