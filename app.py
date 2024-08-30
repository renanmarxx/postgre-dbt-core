import psycopg2
import pandas as pd
from sqlalchemy import create_engine, text

db_params = {
    'host': 'dpg-cr8j6p23esus73b7hfpg-a.oregon-postgres.render.com'
    ,'database': 'public_kuy9'
    ,'user': 'renanmarx'
    ,'password': 'wMHSmWQDEV8umdu3BDdtbnHSR4mVf3Tl'
}

# Create a connection to the PostgreSQL server
conn = psycopg2.connect(
    host = db_params['host']
    ,database = db_params['database']
    ,user = db_params['user']
    ,password = db_params['password']
)

# Create a cursor object
cur = conn.cursor()

# Set automatic commit to be true, so that each action is committed without having to call conn.committ() after each command
conn.set_session(autocommit = True)

# Connect to the 'public_kuy9' database
db_params['database'] = 'public_kuy9'
engine = create_engine(f'postgresql://{db_params["user"]}:{db_params["password"]}@{db_params["host"]}/{db_params["database"]}')

# Define the file paths for your CSV files
csv_files = {
    'produtos' : 'produtos.csv'
    ,'vendas' : 'vendas.csv'
}

# Load and display the contents of each CSV file to check
for table_name, file_path in csv_files.items():
    print(f"Contents of '{table_name}' CSV file:")
    df = pd.read_csv(file_path)
    print(df.head(2))  # Display the first few rows of the DataFrame
    print("\n")

# Loop through the CSV files and import them into PostgreSQL
for table_name, file_path in csv_files.items():
    df = pd.read_csv(file_path)
    df.to_sql(table_name, engine, if_exists = 'replace', index = False)

# Create the 'soccer' database
#cur.execute("CREATE DATABASE soccer")

# Commit the changes and close the connection to the default database
conn.commit()
cur.close()
conn.close()