import pyodbc

conn = pyodbc.connect(
    f"DRIVER={os.getenv('DB_DRIVER')};"
    f"SERVER={os.getenv('DB_SERVER')};"
    f"DATABASE={os.getenv('DB_DATABASE')};"
    f"UID={os.getenv('DB_USER')};"
    f"PWD={os.getenv('DB_PASSWORD')};"
)

with open("query_counts_burrito_taco.sql", "r") as file:
    sql_query = file.read()

cursor = conn.cursor()
cursor.execute(sql_query)

rows = cursor.fetchall()

for row in rows:
    print(row)

conn.close()
