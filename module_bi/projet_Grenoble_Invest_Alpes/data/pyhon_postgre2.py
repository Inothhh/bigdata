import pandas as pd
from sqlalchemy import create_engine

# Paramètres de connexion
user = "binome8"
password = "6FE[CBis}KnsjLiMH8%g"
host = "51.159.205.157"
port = "15030"
database = "BI_group8"

# Connexion à PostgreSQL via SQLAlchemy
url = f"postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}"
engine = create_engine(url)

# Lecture du fichier CSV nettoyé
df = pd.read_csv("base_entreprises_clean.csv")

# Injection dans le schéma raw (attention : remplacer la table si elle existe déjà)
df.to_sql("base_entreprises", engine, schema="raw", index=False, if_exists="replace")

print("✅ Données injectées avec succès dans raw.base_entreprises !")
