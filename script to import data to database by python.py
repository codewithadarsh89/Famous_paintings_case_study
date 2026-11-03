import pandas as pd
from sqlalchemy import create_engine
from pathlib import Path

# Connect to your existing MySQL database
from sqlalchemy import create_engine, URL

connection_url = URL.create(
    drivername="mysql+pymysql",
    username="root",
    password="Adarsh@123",
    host="localhost",
    port=3306,
    database="ikea_project"
)

engine = create_engine(connection_url)

# Folder containing your CSV files
folder = Path(r"C:\Users\csada\OneDrive\Desktop\data-analytics_krishnaik\ikea_project\IKEA Gifting Dataset")

# Import every CSV as a separate table
for file in folder.glob("*.csv"):
    df = pd.read_csv(file,encoding="latin1")

    table_name = file.stem.lower()

    df.to_sql(
        name=table_name,
        con=engine,
        if_exists="fail",
        index=False,
        chunksize=1000
    )

    print(f"Imported {table_name}: {len(df)} rows")

engine.dispose()